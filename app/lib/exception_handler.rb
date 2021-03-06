module ExceptionHandler
  # http://api.rubyonrails.org/classes/ActiveSupport/Concern.html
  extend ActiveSupport::Concern
  # Define custom error subclasses - rescue catches `StandardErrors`
  class AuthenticationError < StandardError; end
  class MissingToken < StandardError; end
  class InvalidToken < StandardError; end

  included do
    # Define custom handlers
    rescue_from ActiveRecord::RecordInvalid, with: :four_twenty_two
    rescue_from ExceptionHandler::AuthenticationError, with: :unauthorized_request
    rescue_from ExceptionHandler::MissingToken, with: :four_twenty_two
    rescue_from ExceptionHandler::InvalidToken, with: :four_twenty_two

    rescue_from ActiveRecord::RecordNotFound do |e|
      json_response({ message: e.message }, ApiMessage::ERROR_CODE_RECORD_NOT_FOUND)
    end

    private

    # JSON response with message; Status code 422 - unprocessable entity
    def four_twenty_two(e)
      json_response({ message: e.message }, ApiMessage::ERROR_CODE_UNPROCESSABLE_ENTITY)
    end

    # JSON response with message; Status code 401 - Unauthorized
    def unauthorized_request(e)
      json_response({ message: e.message }, ApiMessage::ERROR_CODE_PERMISSION_DENIED)
    end
  end
end