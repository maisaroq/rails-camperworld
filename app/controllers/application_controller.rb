class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  include Pundit
end
