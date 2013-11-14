class Identity
  
  include Mongoid::Document
  include OmniAuth::Identity::Models::Mongoid
  before_save :create_name
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  field :email, type: String
  field :password_digest, type: String
  field :name, type: String
  
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }

  def create_name
    self.name = self.email.split('@')[0]
  end

end
