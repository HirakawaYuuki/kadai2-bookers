class Book < ApplicationRecord

	belongs_to :user

	validates :book_title, presence: true
	validates :caption, presence: true
	validates :caption, length: {maximum: 200}
end
