class ApplicationController < ActionController::API
  include ActionController::Caching
  include ActionController::ImplicitRender

  include ApiCache
  include ExceptionHandler
end
