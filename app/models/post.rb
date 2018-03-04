class Post < ApplicationRecord
  validates_presence_of :date, :rationable, :overtime_request
  validates :overtime_request, numericality: { greater_than: 0.0}

  enum status: { submitted: 0, approved: 1, rejected: 2 }
  belongs_to :user

  scope :post_by, ->(user) {where(user_id: user.id)}


end
