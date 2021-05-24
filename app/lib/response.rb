module Response
  def json_response(object, status = :ok)
    render json: object, status: status
  end

  def api_error(messages, status = 400)
    render json: {error: { messages: Array.wrap(messages) }}, status: status
  end
end