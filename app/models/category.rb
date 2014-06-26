class Category < ActiveRecord::Base
  has_many :posts, through: :post_categories
  has_many :post_categories

  validates :name, presence: true
end