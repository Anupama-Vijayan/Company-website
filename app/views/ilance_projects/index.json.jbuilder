json.array!(@ilance_projects) do |ilance_project|
  json.extract! ilance_project, :id
  json.url ilance_project_url(ilance_project, format: :json)
end
