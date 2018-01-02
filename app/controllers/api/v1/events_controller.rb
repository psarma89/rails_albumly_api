class Api::V1::EventsController < ApplicationController
  # def index
  #   @events = Event.all
  #   render json: @events
  # end

  def show
    @event = Event.find(params[:id])
    render json: @event
  end

  def destroy
    @event = Event.find(params[:id])
    if @event
      # Task.where(user_id: @user.id).destroy_all
      @user = User.find(@event.user_id)
      @event.destroy
      render json: @user
    else
      render json: {errors: @event.errors.full_messages}, status: 422
    end
  end
end
