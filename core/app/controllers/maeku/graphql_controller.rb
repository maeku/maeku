module Maeku
  class GraphqlController < ApplicationController
    def execute
      variables = ensure_hash(params[:variables])
      query = params[:query]
      operation_name = params[:operationName]
      context = { current_author: current_author }
      result = MaekuSchema.execute(query, variables: variables, context: context, operation_name: operation_name)
      render json: result
    rescue => error
      raise error unless Rails.env.development?
      handle_error_in_development error
    end

    private

    def ensure_hash(ambiguous_param)
      case ambiguous_param
      when String
        if ambiguous_param.present?
          ensure_hash(JSON.parse(ambiguous_param))
        else
          {}
        end
      when Hash, ActionController::Parameters
        ambiguous_param
      when nil
        {}
      else
        raise ArgumentError, "Unexpected parameter: #{ambiguous_param}"
      end
    end

    def handle_error_in_development(error)
      logger.error error.message
      logger.error error.backtrace.join("\n")
      render json: { error: { message: error.message, backtrace: error.backtrace }, data: {} }, status: 500
    end
  end
end
