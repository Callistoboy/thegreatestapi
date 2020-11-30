class Api::V1::CompaniesController < ApplicationController
  before_action :set_company, only: %i[show update]

  def index
    @companies = if params[:id]
                   Company.find(params[:id])
                 else
                   Company.all
                 end
    render json: { companies: @companies }, except: %i[created_at updated_at]
  end

  def show
    render json: @company
  end

  def create
    @company = Company.new(company_params)
    if @company.save
      render json: @company.as_json, status: :created
    else
      render json: { user: @company.errors, status: :no_content }
    end
  end

  def update
    p "params = #{params.inspect}"
    p "@company = #{@company.inspect}"
    if @company.update(company_params)
      render json: @company
    else
      render json: @company.errors, status: :unprocessable_entity
    end
  end

  def delete_company
    @company = Company.find(params[:id])
    p "params = #{params.inspect}"
    p "@company = #{@company.inspect}"
    @company.update(deleted: true)
    render json: @company
  end


  private

  def set_company
    @company = Company.find(params[:id])
  end

  def company_params
    params.permit(:name, :location)
  end
end
