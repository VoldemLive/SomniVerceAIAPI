class Api::V1::InterpretationsController < ApplicationController
  include AuthenticationCheck

  before_action :is_user_logged_in
  before_action :set_interpretation, only: [:show, :update, :destroy]
  before_action :check_access

  # GET /dreams/:dream_id/interpretations
  def index
    @dream = Dream.find(params[:dream_id])
    render json: @dream.interpretations # note that because the interpretations route is nested inside dreams
                             # we return only the interpretations belonging to that dream
  end

  # GET /dreams/:dream_id/interpretations/:id
  def show
    # your code goes here
  end

  # POST /dreams/:dream_id/interpretations
  def create
     @dream = Dream.find(params[:dream_id])
    @interpretation = @dream.interpretations.new(interpretation_params)
    if @interpretation.save
      render json: @interpretation, status: 201
    else
      render json: { error: 
"The interpretation entry could not be created. #{@interpretation.errors.full_messages.to_sentence}"},
      status: 400
    end
  end

  # PUT /dreams/:dream_id/interpretations/:id
  def update
    # your code goes here
  end

  # DELETE /dreams/:dream_id/interpretations/:id
  def destroy
    # your code goes here
  end

  private

  def interpretation_params
    params.require(:interpretation).permit(:interpretation_text, :likes)
  end

  def set_interpretation
    @interpretation = Interpretation.find_by(id: params[:id], dream_id: params[:dream_id])
  end
  
  def check_access 
    @dream = Dream.find(params[:dream_id])
    if @dream.user_id != current_user.id
      render json: { message: "The current user is not authorized for that data."}, status: :unauthorized
    end
  end
end
