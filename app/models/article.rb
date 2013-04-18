class Article < ActiveRecord::Base
  attr_accessible :name
  has_attached_file :document

  validates :document, attachment_presence: true
end
