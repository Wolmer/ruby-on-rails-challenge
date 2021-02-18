class ApplicationController < ActionController::API
  include ApiCache
  include ExceptionHandler
  include Response
end
