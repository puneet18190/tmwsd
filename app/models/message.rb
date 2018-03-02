# -*- encoding : utf-8 -*-
require 'securerandom'

class Message < ActiveRecord::Base

  include BCrypt

  attr_accessor :terms_of_service
  attr_reader :password

  attr_accessible :password, :body, :note, :message_urls_attributes,
                  :terms_of_service

  attr_encrypted :body, :key => :encryption_key

  validates :body, :presence => true, :on => :create
  validates :terms_of_service, :acceptance => true, :on => :create

  belongs_to :user
  has_many :message_urls

  accepts_nested_attributes_for :message_urls, :allow_destroy => true

  before_create do
    self.url ||= (SecureRandom.random_number(10_000_000_000_000)+10_000_000_000_000).alphadecimal
  end

  after_create do
    message_urls.create
  end


  def to_param
    url
  end

  def requires_password?
    !encrypted_password.blank?
  end

  def authenticate(password)
    @password = password
    encrypted_password == password
  end

  def password=(new_password)
    if new_password.blank?
      self.encrypted_password = @password = nil
    else
      self.encrypted_password = Password.create(new_password)
      @password = new_password
    end
  end

  def encrypted_password
    if read_attribute(:encrypted_password)
      Password.new(read_attribute(:encrypted_password))
    end
  end

  def assign_attributes_with_password_first(new_attributes, options={})
    return if new_attributes.nil?

    if new_attributes[:password] || new_attributes['password']
      self.password = new_attributes[:password] || new_attributes['password']
    end

    send(:assign_attributes_without_password_first, new_attributes, options)
  end
  alias_method_chain :assign_attributes, :password_first

  def message_url_deleted!
    clear_body! if message_urls.all?(&:deleted?)
  end

  def accessed!
    update_attribute(:last_accessed_at, Time.now.utc)
    clear_body! if message_urls.all?(&:deleted?)
  end

  def clear_body!
    self.body    = nil
    self.deleted = true
    save!
  end

  def geocode!
    if sender_ip_address && sender_country.blank?
      location = Geokit::Geocoders::MultiGeocoder.geocode(sender_ip_address)
      self.sender_country  = location.country_code
      self.sender_state    = location.state
      self.sender_province = location.province
      self.sender_city     = location.city
      save
    end
  end


protected

  def encryption_key
    "#{Tmwsd::Config.encryption_key}#{password}"
  end

end
