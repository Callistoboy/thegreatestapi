class Api::V1::GeeksController < ApplicationController
  before_action :set_geek, only: [:show, :update]

  def index
    @geeks = if params[:company_id]
               Geek.find(params[:company_id]).applies
             else
               Geek.all
             end
    render json: {geeks: @geeks}, except: [:id, :created_at, :updated_at]
  end

  def show
    render json: @geek
  end

  def create
    @geek = Geek.new(job_params)
    if @geek.save
      render json: @geek.as_json, status: :created
    else
      render json: {user: @geek.errors, status: :no_content}
    end
  end

  def update
    if @geek.update(geek_params)
      render json: @geek
    else
      render json: @geek.errors, status: :unprocessable_entity
    end
  end


  private

  def set_geek
    @geek = Geek.find(params[:id])
  end

  def geek_params
    params.permit(:name, :stack, :resume)
  end
end
