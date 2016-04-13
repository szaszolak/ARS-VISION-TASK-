class CompaniesController < ApplicationController
  before_action :set_company, only: [:show]

  # GET /companies
  # GET /companies.json
  def index
    @companies = Company.all
    @favorite_companies = current_user.favorite_companies.map{|com|com.company_id}.to_a||[]
  end

  # GET /companies/1
  # GET /companies/1.json
  def show
    @country = ISO3166::Country.find_country_by_alpha3(@company.country_code)
    @favorite_employees = current_user.favorite_employees.map{|emp|emp.person_id}.to_a||[]
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_company
      @company = Company.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def company_params
      params.require(:company).permit(:name, :countr_code)
    end
end
