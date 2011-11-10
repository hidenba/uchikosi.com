class Comment
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Paranoia

  field body

  belongs_to :author, class_name: Member.to_s
  embedded_in :event
end
