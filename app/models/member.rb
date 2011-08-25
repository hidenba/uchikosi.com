class Member
  include Mongoid::Document

  field :first_name
  field :last_name
  field :nickname

  field :prefecture
  field :city
  field :address

  belongs_to :user_account

  embeds_many :emails
  accepts_nested_attributes_for :emails
end
