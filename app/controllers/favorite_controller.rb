class FavoriteController < ApplicationController
  before_action :set_employee, only: [:add_employee, :destroy_employee]
  before_action :set_company, only: [:add_employee, :destroy_employee,:add_company, :destroy_company]
  def index
    @companies = current_user.favorite_companies.order(created_at: :desc).includes(:company).map{|fav| fav.company}
    @employees = current_user.favorite_employees.order(created_at: :desc).includes(:person).map{|fav| fav.person}
  end

  def add_company
     respond_to do |format|
      if current_user.favorite_companies.create(company:@company)
        format.html {redirect_to companies_path, notice: 'favorite added' }
        format.js
      else
        format.html { render index, notice: 'favorite not added' }
        format.js
      end
    end
  end

  def add_employee
    respond_to do |format|
      if current_user.favorite_employees.create(person:@employee)
        format.html {redirect_to company_path @company, notice: 'favorite added' }
        format.js
      else
        format.html { render index, notice: 'favorite not added' }
        format.js
      end
    end
  end

  def destroy_company
    favorite = current_user.favorite_companies.where('company_id=?',@company).first
    respond_to do |format|
      if favorite.destroy
        format.html {redirect_to companies_path @company, notice: 'favorite removed ' }
        format.js
      else
        format.html { render index, notice: 'favorite not added' }
        format.js
      end
    end
  end

  def destroy_employee

    favorite = current_user.favorite_employees.where('person_id=?',@employee).first
    respond_to do |format|
      if favorite.destroy
        format.html {redirect_to company_path @company, notice: 'favorite removed' }
        format.js
      else
        format.html { render index, notice: 'favorite not added' }
        format.js
      end
    end
  end

  def set_employee
    @employee = Person.find(params[:person_id])
  end

  def set_company
    @company = Company.find(params[:company_id])
  end
end
