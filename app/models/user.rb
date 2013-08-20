class User

  include Mongoid::Document


  has_many :authorizations
  embeds_one :profile
  has_many :cars, dependent: :destroy
  has_many :rents, dependent: :destroy

  field :name, type: String
  field :email, type: String  

  def self.from_omniauth(auth)
    Authorization.find_by(provider: auth[:provider], uid: auth[:uid]).try(:user) ||
      create_with_omniauth(auth)
  end

  # auth={info:{name: 'lzh', email: 'love@163.com'}, provider: 'weibo', uid: '123434343134'}

  def self.create_with_omniauth(auth)
    if user = User.find_by(email: auth[:info][:email])
      user.authorizations.create!(provider: auth[:provider], uid: auth[:uid])
      user
    else
      user = User.create(name: auth[:info][:name], email: auth[:info][:email])
      user.create_profile(nickname: auth[:info][:name])
      user.authorizations.push(Authorization.new(provider: auth[:provider], uid: auth[:uid]))
      user
    end
  end
end
