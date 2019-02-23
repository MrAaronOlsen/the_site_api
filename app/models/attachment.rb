class Attachment < ApplicationRecord
  has_one_attached :image

  has_many :about_attachments
  has_many :abouts, :through => :about_attachments
end
