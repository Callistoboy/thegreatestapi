class Api::V1::JobsController < ApplicationController
  before_action :set_job, only: %i[show update]

  # для выполнения routes с ассоциацией
  def index
    @jobs = if params[:company_id]
              Company.find(params[:company_id]).jobs
            else
              Job.all
            end
    render json: { jobs: @jobs }, except: %i[id created_at updated_at]
  end

  def show
    render json: @job
  end

  def create
    @job = Job.new(job_params)
    if @job.save
      render json: @job.as_json, status: :created
    else
      render json: { user: @job.errors, status: :no_content }
    end
  end

  def update
    if @job.update(job_params)
      render json: @job
    else
      render json: @job.errors, status: :unprocessable_entity
    end
  end


  private

  def set_job
    @job = Job.find(params[:id])
  end

  def job_params
    params.permit(:place, :company_id, :name)
  end
end
