class Event
  include Mongoid::Document

  field :name
  field :description


  embeds_many :stages
  accepts_nested_attributes_for :stages

  validates :name, presence: true

  default_scope asc("stages.schedule")
  scope :future_plan, where("stages.schedule".to_sym.gt => Time.now)

  def date
    stages.min(:schedule).to_date
  end
end
