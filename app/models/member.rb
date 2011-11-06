class Member
  include Mongoid::Document

  field :first_name
  field :last_name
  field :nickname

  field :prefecture
  field :city
  field :address

  field :due, type: Boolean

  has_one :user_account, dependent: :delete

  embeds_many :emails
  accepts_nested_attributes_for :emails

  validates :nickname, presence: true

  def fullname
    "#{last_name} #{first_name}"
  end
end
