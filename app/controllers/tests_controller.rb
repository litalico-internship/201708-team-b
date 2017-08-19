class TestsController < ApplicationController
  def index; end
  def create
    value = params[:result]
    result = 0
    value.each do |key, val|
      result += val.to_i
    end
    # if Evaluation.evaluation(result)
    if result >= 7
      return redirect_to '/users/sign_up'
    end
    redirect_to '/'
  end
end