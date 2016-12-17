class Task < ApplicationRecord
  validates :ask,:answer,:mark,:cat_id,:time, presence: true
  validates :ask,:answer, length: { minimum: 10}
  validates :mark,length: { maximum: 1 }
  validates :time,length: { maximum: 3 }
  has_many :tpublics
  has_many :inspections
  belongs_to :user
  belongs_to :cat
end
