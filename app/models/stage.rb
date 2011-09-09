class Stage
  include Mongoid::Document

  field :place
  field :schedule, type: DateTime

  embedded_in :event

  validates :place, presence: true
end
