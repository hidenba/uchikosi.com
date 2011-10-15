class Stage
  include Mongoid::Document

  field :place
  field :schedule, type: DateTime

  default_scope desc(:schedule)
  embedded_in :event

  validates :place, presence: true
end
