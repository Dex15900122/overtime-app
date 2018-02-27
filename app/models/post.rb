class Post < ApplicationRecord
  validates_presence_of :date, :rationable

  belongs_to :user
end
