class Inspection < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :task
end
