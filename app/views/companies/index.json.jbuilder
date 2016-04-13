json.array!(@companies) do |company|
  json.extract! company, :id, :name, :countr_code
  json.url company_url(company, format: :json)
end
