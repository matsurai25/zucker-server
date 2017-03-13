class ErrorsController < ApplicationController
  layout 'application'

  rescue_from ActiveRecord::RecordNotFound, with: :render_404
  rescue_from ActionController::RoutingError, with: :render_404
  rescue_from StandardError, with: :render_500

  def render_404(exception = nil)
    if exception
      logger.info "Rendering 404 with exception: #{exception.message}"
    end
    @title = 'NOT FOUND'
    @body = 'sorry, nothing is here.'
    render template: "errors/show", status: 404
  end

  def render_500(exception = nil)
    if exception
      logger.info "Rendering 500 with exception: #{exception.message}"
    end
    @title = 'EROOR'
    @body = 'sorry, something happen ...'
    render template: "errors/show", status: 500
  end

  def show
    raise env["action_dispatch.exception"]
  end
end
