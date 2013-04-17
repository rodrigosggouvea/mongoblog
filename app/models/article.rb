class Article
  include Mongoid::Document
  field :title, type: String
  field :content, type: String

  belongs_to :user
  embeds_many :comments

  validates :title, :presence => true
  validates :content, :presence => true

end
