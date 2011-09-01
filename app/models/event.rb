class Event
  include Mongoid::Document

  field :name
  field :description

  has_many :stages, dependent: :delete, autosave: true
  accepts_nested_attributes_for :stages

end
