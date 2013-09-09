class UsersController < ApplicationController
  def panel
    @profile = current_user.profile
  end
end
