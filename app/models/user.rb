# -*- encoding : utf-8 -*-
class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :recoverable,
         :rememberable, :trackable, :validatable

  attr_accessible :name, :email, :password, :password_confirmation,
                  :remember_me

  has_many :messages, :dependent => :nullify

  validates :name, :presence => true
  validates :email, :presence => true, :email => true
  validates :password, :presence => true, :on => :create
  validates :password_confirmation, :presence => true, :on => :create

  after_create do
    Notifications.signup_admin(self).deliver
  end
end
