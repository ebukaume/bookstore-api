class Book < ApplicationRecord
  validate :title, presence: true
  validate :author, presence: true
  validate :category, presence: true
end
