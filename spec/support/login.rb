module Login
  def sign_in(user)
    visit root_path
    fill_in 'auth_key', with: user.email
    fill_in 'password', with: user.password
    click_button '登录'
  end
end