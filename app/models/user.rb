class User < ApplicationRecord
  validates :fname,:lname,:login,:password,:img,:status_user, presence: true
  validates :fname,:lname, length: { minimum: 2 }
  validates :login, length: { in: 5..15 },uniqueness: true
  validates :status_user, length: { in: 0..1 }
  has_many :tasks
  has_many :tus
  has_many :inspections
end

