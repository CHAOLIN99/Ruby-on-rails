class CounselorsController < ApplicationController
  before_action :load_counselor, only: [:show, :edit, :update, :destroy]

  def index
    @counselors = Counselor.all
  end

  def new
    @counselor = Counselor.new
  end

  def show
    if @counselor.nil?
      redirect_to counselorss_path, alert: "Counselor not found"
    end
  end

  def edit
  end

  def create
    @counselor = Counselor.new(counselor_params)

    if @counselor.save
      redirect_to counselors_path, notice: "Counselor was successfully created."
    else
      render 'new', status: :unprocessable_entity
    end
  end

  def update
    if @counselor.update(counselor_params)
      redirect_to @counselor, notice: "Counselor was successfully updated."
    else
      render edit , status: :unprocessable_entity
    end
  end

  def destroy
    @counselor.destroy
    redirect_to counselors_path, alert: "Counselor was successfully deleted."
  end

  private 

  def load_counselor
    @counselor = Counselor.find(params[:id])
  end

  def counselor_params
    params.require(:counselor).permit(:first_name, :last_name, :specialization, :email, :phone)
  end
end

