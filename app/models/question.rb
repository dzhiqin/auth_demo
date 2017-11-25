class Question < ApplicationRecord
  belongs_to :user,:optional=>true
  has_many :answers
end
