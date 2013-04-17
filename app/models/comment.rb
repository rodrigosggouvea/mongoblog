class Comment
  include Mongoid::Document
  field :content, type: String
  field :name, type: String

  embedded_in :article, :inverse_of => :comments

  validates :name, :presence => true
  validates :content, :presence => true
end
