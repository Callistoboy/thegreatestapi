class Api::V1::AppliesController < ApplicationController
  before_action :set_apply, only: %i[show update]

  def index
    @applies = if params[:company_id]
                 Apply.find(params[:company_id])
               else
                 Apply.all
               end
    render json: { applies: @applies }, except: %i[id created_at updated_at]
  end

  def show
    render json: @apply
  end

  def create
    @apply = Apply.new(company_params)
    if @apply.save
      render json: @apply.as_json, status: :created
    else
      render json: { user: @apply.errors, status: :no_content }
    end
  end

  def update
    if @apply.update(apply_params)
      render json: @apply
    else
      render json: @apply.errors, status: :unprocessable_entity
    end
  end


  private

  def set_apply
    @apply = Apply.find(params[:id])
  end

  def apply_params
    params.permit(:job_id, :geek_id, :read, :invited)
  end
end
