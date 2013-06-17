module InfosHelper
  include SessionsHelper

  def jump_to(url)
    redirect_to url
  end
  
end
