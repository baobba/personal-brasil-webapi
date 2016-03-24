# == Schema Information
#
# Table name: personal_clients
#
#  id          :integer          not null, primary key
#  personal_id :integer          not null
#  client_id   :integer          not null
#  objective   :string
#  fat_weight  :decimal(6, 2)
#  thin_weight :decimal(6, 2)
#  fat_pct     :decimal(6, 2)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class PersonalClientsController < ApplicationController
  before_action :set_personal_client, only: [:show, :update, :destroy]

  # GET /personal_clients
  # GET /personal_clients.json
  def index
    @personal_clients = PersonalClient.all

    render json: @personal_clients
  end

  # GET /personal_clients/1
  # GET /personal_clients/1.json
  def show
    render json: @personal_client
  end

  # POST /personal_clients
  # POST /personal_clients.json
  def create
    @personal_client = PersonalClient.new(personal_client_params)

    if @personal_client.save
      render json: @personal_client, status: :created, location: @personal_client
    else
      render json: @personal_client.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /personal_clients/1
  # PATCH/PUT /personal_clients/1.json
  def update
    @personal_client = PersonalClient.find(params[:id])

    if @personal_client.update(personal_client_params)
      head :no_content
    else
      render json: @personal_client.errors, status: :unprocessable_entity
    end
  end

  # DELETE /personal_clients/1
  # DELETE /personal_clients/1.json
  def destroy
    @personal_client.destroy

    head :no_content
  end

  private

    def set_personal_client
      @personal_client = PersonalClient.find(params[:id])
    end

    def personal_client_params
      params.require(:personal_client).permit(:personal_id, :client_id, :objective, :fat_weight, :thin_weight, :fat_pct)
    end
end
