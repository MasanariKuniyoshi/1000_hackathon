class ApplicationController < ActionController::Base
  
  def hello
    render html: "hello,world!"
  end
  protect_from_forgery with: :null_session
  
  include SessionsHelper
  
end
