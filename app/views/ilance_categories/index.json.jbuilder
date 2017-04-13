json.array!(@ilance_categories) do |ilance_category|
  json.extract! ilance_category, :id
  json.url ilance_category_url(ilance_category, format: :json)
end
