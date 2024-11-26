class AppointmentsController < ApplicationController
  before_action :authenticate
  before_action :load_appointment, only: [:show, :edit, :update, :destroy]

  def index
    @appointments = current_user.appointments.all
  end

  def new
    @appointment = Appointment.new
  end

  def show
    if @appointment.nil?
      redirect_to appointments_path, alert: "Appointment not found"
    end
  end

  def edit
  end

  def create
    @appointment = Appointment.new(appointment_params)
    @appointment.user = current_user
    if @appointment.save
      redirect_to appointments_path, notice: "Appointment was successfully created."
    else
      render 'new', status: :unprocessable_entity
    end
  end

  def update
    if @appointment.update(appointment_params)
      redirect_to @appointment
    else
      render 'edit' , status: :unprocessable_entity
    end
  end

  def destroy
    @appointment.destroy
    redirect_to appointments_path, alert: "Appointment was successfully deleted."
  end

  private 

  def load_appointment
    @appointment = current_user.appointments.find(params[:id])
  end

  def appointment_params
    params.require(:appointment).permit(:date)
  end
end

