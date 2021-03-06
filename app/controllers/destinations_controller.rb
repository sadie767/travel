class DestinationsController < ApplicationController
  before_action :authenticate_user!, except: [ :index ]

  def index
    if params[:search]
      @destinations = Destination.search(params[:search])
    else
      @destinations = Destination.all
    end
    json_response(@destinations)
  end

  def show
    @destination = Destination.find(params[:id])
    json_response(@destination)
  end

  def create
    @destination = Destination.create!(destination_params)
    json_response(@destination, :created)
  end

  def update
    @destination = Destination.find(params[:id])
    if @destination.update!(destination_params)
      render status: 200, json: {
       message: "Your destination has been updated successfully."
       }
    end
  end

  def destroy
    @destination = Destination.find(params[:id])
    @destination.destroy
  end

  private
  def json_response(object, status = :ok)
    render json: object, status: status
  end

  def destination_params
    params.permit(:city, :country)
  end
end
