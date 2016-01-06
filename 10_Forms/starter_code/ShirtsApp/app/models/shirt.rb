class Shirt < ActiveRecord::Base
  #validates :image, format: /\A\w+\.png\z/
#there is a method called where, 
  def self.search_for(query)
  	self.where("name LIKE :query OR description LIKE :query", query: "%#{query}%")
  end
end
