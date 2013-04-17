class Article
  include Mongoid::Document
  field :title, type: String
  field :content, type: String
  field :published_on, type: Date

  referenced_in :user
  embeds_many :comments

  validates :title, :presence => true
  validates :content, :presence => true
  validates :published_on, :presence => true

  before_validation :set_published_on, :on => :create

  def set_published_on
  	published_on = Date.today
  end
end
