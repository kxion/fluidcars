class IdentitiesController < ApplicationController
  layout 'blank'
  def new
    # @identity = request.env['omniauth.identity']  
    @identity = Identity.new
  end
end
