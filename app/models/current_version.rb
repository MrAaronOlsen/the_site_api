class CurrentVersion < ApplicationRecord
  validates_uniqueness_of :model
end
