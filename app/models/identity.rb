class Identity
  
  include Mongoid::Document
  include OmniAuth::Identity::Models::Mongoid
  before_save :create_name

  field :email, type: String
  field :password_digest, type: String
  field :name, type: String

  def create_name
    self.name = self.email.split('@')[0]
  end

end
