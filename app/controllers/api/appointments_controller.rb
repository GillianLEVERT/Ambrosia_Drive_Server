class Api::AppointmentsController < ApplicationController
    before_action :authenticate_request!
  
    def index
      @appointments = Appointment.all
      render json: @appointments
    end
  
    def create
      appointment = Appointment.new(appointment_params)
    
      if appointment.save
        render json: { appointment: appointment }, status: :created
      else
        render json: { error: appointment.errors.full_messages.join(', ') }, status: :unprocessable_entity
      end
    end
  
    def show
      @appointment = Appointment.find(params[:id])
      render json: @appointment
    end
  
    def destroy
      @appointment = Appointment.find(params[:id])
      @appointment.destroy
      render json: { message: 'Appointment deleted' }
    end
  
    private
  
    def appointment_params
      params.require(:appointment).permit(:date).merge(user_id: @current_user.id)
    end
  end