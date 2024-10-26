class SessionsController < ApplicationController
  before_action :load_counselor
  before_action :load_session, only: [:show, :edit, :update, :destroy]
  def index
    
    @sessions = @counselor.sessions
  end

  def new
    @session = Session.new
  end

  def create
    @session = Session.new session_params
    if @counselor.sessions << @session
      redirect_to counselor_sessions_path(@counselor, @session), notice: "Session created successfully"
    else
      render :new, staturs: :unprocessable_entity
    end
  end

  def show
    

  end

  def edit
    
  end

  def update
    if @session.update session_params
      redirect_to counselor_session_path(@counselor, @session), notice: "Session updated successfully"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @session.destroy
    redirect_to counselor_sessions_path(@counselor), notice: "Session deleted successfully"
    
  end








  private
  def session_params
    params.require(:session).permit(:title, :session_date, :session_note)
  end
  def load_session
    @session = @counselor.sessions.find(params[:id])
  end
  def load_counselor
    @counselor = Counselor.find(params[:counselor_id])
  end

end
