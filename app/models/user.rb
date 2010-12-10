class User
  include Mongoid::Document

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :name, :email, :password, :password_confirmation

  validates_uniqueness_of :email, :case_sensitivy => false
  validate :email, :presence => true,
                    :uniqueness => true,
                    :length => { :within => 5..50 },
                    :format => { :with => /^[^@][\w.-]+@[\w.-]+[.][a-z]{2,4}$/i }
  
  validate :password,  :presence => true,
                        :confirmation => true
  
  references_many :articles
  references_many :comments
  
end
