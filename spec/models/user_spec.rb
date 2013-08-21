require 'spec_helper.rb'

describe User do 
  before(:each) do 
    @user = User.new
  end

  it 'show return or create one user' do
    auth={info:{name: 'lzh', email: 'love@163.com'}, provider: 'weibo', uid: '123434343134'}
    user = User.from_omniauth(auth)
    user.email.should == 'love@163.com'
  end
  
end