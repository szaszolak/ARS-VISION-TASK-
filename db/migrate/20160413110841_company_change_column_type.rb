class CompanyChangeColumnType < ActiveRecord::Migration
  def change
  	change_column :companies, :countr_code, :string
  end
end
