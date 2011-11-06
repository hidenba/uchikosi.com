class UserAccount
  include Mongoid::Document
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :rememberable, :trackable, :validatable

  class UserType < ActiveEnum::Base
    value id: 1, name: 'member'
    value id: 2, name: 'admin'
  end

  field :login_name
  field :type, type: Integer, default: 1

  belongs_to :member

  after_create :create_member

  validates :login_name, presence: true, uniqueness: { case_sensitive: false }
  validates :email, presence: { if: :email_required? }

  attr_accessible :login_name, :password, :password_confirmation, :remember_me

  def admin?
    type == UserType[:admin]
  end

  private

  def email_required?; false end
  def email_changed?; false end

  def create_member
    update_attribute(:member_id, Member.create!(nickname: login_name).id)
  end
end
