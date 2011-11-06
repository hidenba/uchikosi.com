class Event
  include Mongoid::Document

  field :name
  field :description
  field :schedule, type: Date

  embeds_many :stages
  accepts_nested_attributes_for :stages, allow_destroy: true

  validates :name, presence: true

  default_scope desc(:schedule)
  scope :future_plan, where("schedule".to_sym.gt => Time.now)
  scope :history, where("schedule".to_sym.gt => Time.now)

end
