class Habit < ApplicationRecord
  has_many :habit_logs, dependent: :destroy
end
