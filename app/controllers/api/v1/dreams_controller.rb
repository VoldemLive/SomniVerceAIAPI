class Api::V1::DreamsController < ApplicationController
  include AuthenticationCheck

  before_action :is_user_logged_in
  before_action :set_dream, only: [:show, :update, :destroy]

  # GET /dreams
  def index
    @dreams = Dream.where(user_id: current_user.id)
    render json: {dreams: @dreams}
  end

  # GET /dreams/:id
  def show
    if check_access
      # your code goes here
    end
  end

  # POST /dreams
  def create
    @dream = Dream.new(dream_params)
    @dream.user_id = current_user.id
    if @dream.save
      render json: @dream, status: 201
    else
      render json: { error:
        "Unable to create dream: #{@dream.errors.full_messages.to_sentence}"},
        status: 400
    end
  end

  # PUT /dreams/:id
  def update
    if check_access
      # your code goes here
    end
  end

  # DELETE /dreams/:id
  def destroy
    if check_access
      @dream.destroy
      render json: { message: 'Dream record successfully deleted.'}, status: 200
    end
  end

  private

  def dream_params
    params.require(:dream).permit(:description, :datedream, :quality, :tags, :lang, :hours, :lucid, :complete)
  end

  def set_dream
    @dream = Dream.find(params[:id])
  end

  def check_access
    if (@dream.user_id != current_user.id) 
      render json: { message: "The current user is not authorized for that data."}, status: :unauthorized
      return false
    end
    true
  end

end
