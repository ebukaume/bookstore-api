class ApplicationController < ActionController::API
  before_action :white_list_cors

  def white_list_cors
    response.headers['Access-Control-Allow-Origin'] = '*'
    response.headers['Access-Control-Allow-Methods'] = 'GET, DELETE, POST'
    response.headers['Access-Control-Allow-Headers'] = 'origin, content-type, accept'
  end
end
