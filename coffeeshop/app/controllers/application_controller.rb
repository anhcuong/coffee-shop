class ApplicationController < ActionController::API
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception
  rescue_from ActiveRecord::RecordNotFound, with: :render_record_not_found
  
  def render_record_not_found(error)    
    render json: "Not Found", status: :not_found
  end

  rescue_from ActionController::ParameterMissing, with: :render_parameter_missing
  
  def render_parameter_missing(error)    
    render json: "Missing required parameter", status: :bad_request
  end

  rescue_from ActiveRecord::InvalidForeignKey, with: :render_invalid_fk
  
  def render_invalid_fk(error)    
    render json: "Invalid Foreign Key", status: :bad_request
  end  

end
