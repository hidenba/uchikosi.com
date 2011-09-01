class Stage
  include Mongoid::Document

  field :place
  field :schedule, type: DateTime

  belongs_to :event
end
