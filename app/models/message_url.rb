# -*- encoding : utf-8 -*-
require 'securerandom'

class MessageUrl < ActiveRecord::Base

  attr_accessible :name, :email

  belongs_to :message, :counter_cache => true

  validates :name, :presence => true, :if => lambda{|u| u.email.present? }
  validates :email, :presence => true, :email => true, :if => lambda{|u| u.name.present? }

  before_create do
    self.url ||= (SecureRandom.random_number(10_000_000_000_000)+10_000_000_000_000).alphadecimal
  end

  after_update do
    if (name.present? && email.present?) && (name_changed? || email_changed?)
      Notifications.encrypted_message(self).deliver
    end
  end

  before_destroy do
    !deleted?
  end

  after_destroy do
    message.message_url_deleted!
  end


  def to_param
    url
  end

  def authenticate(password)
    if message.authenticate(password)
      true
    else
      attempted!
      false
    end
  end

  def attempted!
    increment!(:attempts)
    accessed! if attempts >= 3
  end

  def accessed!(options={})
    self.recipient_ip_address = options[:by] if options[:by].present?
    self.accessed_at          = Time.now.utc
    self.deleted              = true
    save!
    message.accessed!
  end

  def geocode!
    if recipient_ip_address && recipient_country.blank?
      location = Geokit::Geocoders::MultiGeocoder.geocode(recipient_ip_address)
      self.recipient_country  = location.country_code
      self.recipient_state    = location.state
      self.recipient_province = location.province
      self.recipient_city     = location.city
      save(false)
    end
  end

end
