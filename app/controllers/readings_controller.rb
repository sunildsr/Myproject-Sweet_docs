class ReadingsController < ApplicationController


  # GET /readings/new
  def new
    @reading = Reading.new
  end

  # POST /readings.json
  def create
    @reading = Reading.new(glucose_reading: params[:reading][:glucose_reading])
    if @reading.save
      flash[:success] = "Reading of #{@reading.glucose_reading} mg/dl successfully submitted"
    else
      flash[:danger] = @reading.errors.full_messages.join(", and ")
    end
    redirect_to root_path
  end

  
end
