class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  #protect the database while allowing these fiels to be updated
end
