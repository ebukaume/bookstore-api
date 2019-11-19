require 'faker'

CATEGORIES = %w(Action Horror Sci-Fi Learning Kids Biography History)

Book.destroy_all
7.times do |index|
  Book.create({
    title: Faker::Book.title,
    author: Faker::Book.author,
    category: CATEGORIES[index - 1]
  })
end
