class Email
  include Mongoid::Document

  field :address

  embedded_in :member
end
