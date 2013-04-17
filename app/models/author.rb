class Author
  include Mongoid::Document
  field :name
  key :name

  

  validates :name, :presence => true
end
