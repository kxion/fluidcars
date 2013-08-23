class IdentitiesController < ApplicationController
  def new
    # @identity = request.env['omniauth.identity']  
    @identity = Identity.new
  end
end
