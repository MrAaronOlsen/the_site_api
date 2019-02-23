class AboutAttachment < ActiveRecord::Base
  belongs_to :attachment
  belongs_to :about
end