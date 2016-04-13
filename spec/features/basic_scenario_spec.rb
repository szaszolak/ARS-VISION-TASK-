require 'rails_helper'

feature 'choose favorites companies and employes' do

  background do
    DatabaseCleaner.clean

    @companies = []
    countries = ISO3166::Country.all.to_a
    20.times do |i|
      company = FactoryGirl.create(:company,country_code: countries[rand(1..countries.size)].alpha3)
      rand(2..10).times do
        FactoryGirl.create(:person,company: company)
      end
      if i > 15
        @companies.push(company)
      end  
    end  
  end

  given(:vaild_user){FactoryGirl.create(:user)}

  scenario "as vaild user" do
    visit new_user_session_path
     within("#new_user") do
        fill_in 'user_email', :with => vaild_user.email
        fill_in 'user_password', :with => vaild_user.password
      end
    click_button 'Log in'
    expect(page).to have_content 'Signed in successfully.'

    expect(page).to have_content 'Listing companies'

    within 'tbody' do
    	#expect(page).to have_xpath '//tr'
    	@companies.each do |company|
    		within "td#cid#{company.id}" do
    		 click_link ''
    		end 	
    	end
    	first('tr').click_link('Show')
    end
    
    expect(page).to have_content "Company"
	within 'tbody' do    	
    	first('tr').click_link('')
    end
    visit favorites_path
    expect(page).to have_content "Companies: #{@companies.size}"
    expect(page).to have_content "Employees: 1"

    visit  companies_path 
    within 'tbody' do
    	within "td#cid#{@companies.last.id}" do
    	  click_link ''
    	end 	
    	all('tr')[1].click_link('Show')
    end
    
    expect(page).to have_content "Company"
	within 'tbody' do    	
    	first('tr').click_link('')
    end
    visit favorites_path
    expect(page).to have_content "Companies: #{@companies.size-1}"
    expect(page).to have_content "Employees: 2"
  end

end