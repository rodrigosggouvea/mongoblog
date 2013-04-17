class Comment
  include Mongoid::Document
  field :content, type: String

  embedded_in :article, :inverse_of => :comments
  belongs_to :user

  validates :user_id, :presence => true
  validates :content, :presence => true
end
