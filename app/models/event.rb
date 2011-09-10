class Event
  include Mongoid::Document

  field :name
  field :description

  embeds_many :stages
  accepts_nested_attributes_for :stages
  has_many :staffs


  validates :name, presence: true

  scope :future_plan, where("stages.schedule".to_sym.gt => Time.now)
  scope :history, where("stages.schedule".to_sym.gt => Time.now)

  def date
    stages.min(:schedule).to_date
  end
end
