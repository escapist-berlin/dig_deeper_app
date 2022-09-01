class TestsrequestsController < ApplicationController
  def receiving
    @received_data = params[:random_hash]
    raise
  end
end
