class Stage
  include Mongoid::Document

  field :place
  field :gather_time, type: Time
  field :start_time, type: Time

  default_scope asc(:start_time)
  has_many :staffs
  embedded_in :event

  validates :place, presence: true
end
