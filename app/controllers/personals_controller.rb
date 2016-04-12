# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  provider               :string           default("email"), not null
#  uid                    :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  confirmation_token     :string
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string
#  name                   :string
#  nickname               :string
#  image                  :string
#  email                  :string
#  tokens                 :json
#  created_at             :datetime
#  updated_at             :datetime
#  type                   :string
#  phone                  :string
#

class PersonalsController < ApplicationController
  before_action :set_personal, only: [:show, :update, :destroy]

  # GET /personals
  # GET /personals.json
  def index
    @personals = Personal.all

    render json: @personals
  end

  # GET /personals/1
  # GET /personals/1.json
  def show
    render json: @personal
  end

  # POST /personals
  # POST /personals.json
  def create
    @personal = Personal.new(personal_params)

    if @personal.save
      render json: @personal, status: :created, location: @personal
    else
      render json: @personal.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /personals/1
  # PATCH/PUT /personals/1.json
  def update
    @personal = Personal.find(params[:id])

    if @personal.update(personal_params)
      head :no_content
    else
      render json: @personal.errors, status: :unprocessable_entity
    end
  end

  # DELETE /personals/1
  # DELETE /personals/1.json
  def destroy
    @personal.destroy

    head :no_content
  end

  private

    def set_personal
      @personal = Personal.find(params[:id])
    end

    def personal_params
      params[:personal].permit(:name, :email, :password, :password_confirmation)
    end
end
