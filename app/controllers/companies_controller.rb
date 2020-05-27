class CompaniesController < ApplicationController
  def index
    @companies = Company.all 
  end

  def show
    @companies = Company.find(params[:id])
    render :show
  end 

  def new
    @company = Company.new
  end 

  def create 
    @company = Company.new(company_params)
    if @company.save
      redirect_to companies_path(@company)
    else
      render :new  
    end
  end 

  private 
  def company_params
    params.require(:company).permit(:name, :description, :start_date, :country)
  end
end
