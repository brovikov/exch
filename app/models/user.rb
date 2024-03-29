# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0)
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  nik                    :string(255)
#  balance                :decimal(6, 2)    default(0.0), not null
#  confirmation_token     :string(255)
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string(255)
#  roles_mask             :integer
#  configApp_id           :integer
#  topics_count           :integer          default(0)
#  posts_count            :integer          default(0)
#

# -*- encoding : utf-8 -*-

class User < ActiveRecord::Base

  require 'role_model'
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable#, :confirmable

  include RoleModel
  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :nik, :balance, :configApp_id
  # attr_accessible :title, :body
  validates(:nik, presence: true)
  has_many :payments
  has_many :orders
  has_many :lotitems
  has_many :lotts
  has_many :topics, :dependent => :destroy
  has_many :posts, :dependent => :destroy
  belongs_to :configApp
  accepts_nested_attributes_for :orders
  before_validation :set_roles
  # optionally set the integer attribute to store the roles in,
  # :roles_mask is the default
  roles_attribute :roles_mask
 
  # declare the valid roles -- do not change the order if you add more
  # roles later, always append them at the end!
  roles :admin, :editor, :guest
  private
  def set_roles
    self.roles = [:guest] if self.roles.empty?
  end
  def self.usearch(search)
  if search
    find(:all, :conditions => ['nik LIKE ?' , "%#{search}%"]  )
  else
    find(:all, :conditions => ['nik LIKE ?' , "777dfgdg"] ) # при первом обращении ищет пользователя 777dfgdg
  end
end
end
