class Article < ApplicationRecord
   belongs_to :user
   validates :title, :content, :price, presence: true
end
