class Comment
  include Mongoid::Document
  field :name
  field :email  
  field :body
  field :published_at, :type => Date
  
  embedded_in :article, :inverse_of => :comments
  
  validates :name, :email, :body, :presence => true
  validate :article_should_be_published
  validates :email,  :length => { :within => 5..50 },
                    :format => { :with => /^[^@][\w.-]+@[\w.-]+[.][a-z]{2,4}$/i }
  
  
  def article_should_be_published
    errors.add(:article_id, "is not published yet") if article && !article.published?
  end
    
end
