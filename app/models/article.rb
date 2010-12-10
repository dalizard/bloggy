class Article
  include Mongoid::Document

  field :title
  field :author
  field :published_at, :type => DateTime
  field :body
  
  #key :title
  
  embeds_many :comments
  referenced_in :user

  
  validates :title, :author, :body, :presence => true

  def long_title
    "#{title} - #{published_at}" 
  end
  
  def published?
    published_at.present?
  end  

  def owned_by?(owner)
    return false unless owner.is_a? User
    user == owner
  end


end
