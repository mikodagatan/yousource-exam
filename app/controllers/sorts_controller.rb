class SortsController < ApplicationController
  def index
  end

  def create
    service = Sort::Service.new(**create_params.to_h.deep_symbolize_keys)

    if service.call
      @result = service.result
    else
      @errors = service.errors
    end
  end

  private

  def create_params
    params.permit(:strategy, :data)
  end
end
