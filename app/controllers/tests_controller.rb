class TestsController < ApplicationController
  def index; end
  def create
    value = params[:result]
    result = 0
    value.each do |val|
      result += val.to_i
    end
    if Evaluation.evaluation(result)
      redirect_to '/users/sign_up'
      return
    end
    redirect_to '/'
  end
end