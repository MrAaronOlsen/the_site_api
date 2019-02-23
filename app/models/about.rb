class About < ApplicationRecord
  has_many :about_attachments
  has_many :attachments, :through => :about_attachments

  validates_uniqueness_of :name
  validates_presence_of :name
end
