module Response
  def json_response(object, status = :ok)
    render json: object, status: status
  end

  def api_error(messages, status = ApiMessage::ERROR_CODE_INTERNAL_SERVER_ERROR)
    render json: {error: { messages: Array.wrap(messages) }}, status: status
  end
end
