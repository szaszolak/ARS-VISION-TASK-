class CompanyChangeColumnName < ActiveRecord::Migration
  def change
  	rename_column :companies, :countr_code, :country_code
  end
end
