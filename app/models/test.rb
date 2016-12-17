class Test < ApplicationRecord
  validates :name,:description,:password,:start_t, presence: true
  validates :name,:description,:password, length: { minimum: 5}
  has_many :tpublics, :dependent => :destroy
  has_many :tus, :dependent => :destroy
  has_many :inspections
end
