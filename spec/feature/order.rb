require 'spec_helper'
feature 'order' do
  background do 
    user = build(:user)
    sign_in user
  end

  scenario 'request order' do 
    rent = create(:rent)
    visit rent_path(rent)
  end
end