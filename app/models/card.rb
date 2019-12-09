class Card < ApplicationRecord  
  has_many :card_ownerships, :dependent => :delete_all
  has_many :users, through: :card_ownerships
  has_one_attached :image
  
  #Validations
  #validates :imageurl, presence: true, allow_blank: false, format: { with: /https:\/\/i.imgur.com\/([a-zA-Z]|\d)+.(png|jpg)/, message: "include a valid imgur url" }
  validates :title, presence: true, allow_blank: false
  validates :text, presence: true, allow_blank: false
  validates :collection, presence: true, allow_blank: false
  validates :set, presence: true, allow_blank: false

  def self.search(collection_filter, set_filter, search)
	collection_filter = collection_filter || ""
	search = search || ""
	
	if (collection_filter=="" or Card.set_in_collection(collection_filter, set_filter))
		set_filter = ""
	else
		set_filter = set_filter || ""
	end
	
	Card.where('(lower(title) LIKE :search OR lower(text) LIKE :search OR lower(set) LIKE :search OR lower(collection) LIKE :search) AND lower(collection) LIKE :collection_filter AND lower(set) LIKE :set_filter', collection_filter: '%'+collection_filter.downcase+'%',set_filter: '%'+set_filter.downcase+'%', search: '%'+search.downcase+'%')
  end
  
  def self.get_sets_in_collection(collection_filter)
	Card.where('lower(collection) LIKE :collection_filter', collection_filter: '%'+collection_filter.downcase+'%').select{|card| card.approved}.collect{|card| card.set}.uniq
  end
  
  def self.set_in_collection(collection_filter, set_filter)
	Card.get_sets_in_collection(collection_filter).find {|set| set==set_filter}.nil?
  
  end
end