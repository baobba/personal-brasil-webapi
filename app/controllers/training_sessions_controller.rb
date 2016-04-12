class TrainingSessionsController < ApplicationController
  devise_token_auth_group :member, contains: [:client, :personal]
  before_action :authenticate_member!, except: [:create, :update, :destroy]
  before_action :authenticate_personal!, only: [:create, :update, :destroy]
  before_action :set_training_session, only: [:show, :update, :destroy]

  # GET /training_sessions
  # GET /training_sessions.json
  def index
    if current_user.type == Client.name
      @scheduled_trainings = current_user.scheduled_trainings
      @training_sessions = current_user.training_sessions
    elsif current_user.type == Personal.name
      @scheduled_trainings = current_user.scheduled_trainings
      @training_sessions = current_user.training_sessions
    else
      @scheduled_trainings = []
      @training_sessions = []
    end

    @items = []

    # carrega especificicos
    specific_items = @training_sessions.where(date: (params[:start].to_date)..(params[:end].to_date))
    @items.concat specific_items.to_a

    # comecando antes do fim do periodo e terminando depois do comeco do start
    recurring_items = @scheduled_trainings.where('initial_date < ? and (end_date is null or end_date >= ?)', params[:end].to_date, params[:start].to_date)
    recurring_items.each do |item|
      children = item.list_children_in_period(params[:start].to_date, params[:end].to_date)
      @items.concat children
    end
    
    render json: @items.order(:date)
  end

  # GET /training_sessions/1
  # GET /training_sessions/1.json
  def show
    render json: @training_session
  end

  # POST /training_sessions
  # POST /training_sessions.json
  def create
    @training_session = TrainingSession.new(training_session_params)

    if @training_session.save
      render json: @training_session, status: :created, location: @training_session
    else
      render json: @training_session.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /training_sessions/1
  # PATCH/PUT /training_sessions/1.json
  def update
    @training_session = TrainingSession.find(params[:id])

    if @training_session.update(training_session_params)
      head :no_content
    else
      render json: @training_session.errors, status: :unprocessable_entity
    end
  end

  # DELETE /training_sessions/1
  # DELETE /training_sessions/1.json
  def destroy
    @training_session.destroy

    head :no_content
  end

  private

    def set_training_session
      @training_session = TrainingSession.find(params[:id])
    end

    def training_session_params
      params[:training_session]
    end
end
