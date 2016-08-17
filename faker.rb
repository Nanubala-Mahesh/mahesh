15.times do
	client = Client.new
	client.name = Faker::Name.first_name
	client.copany = Faker::Company.name
	client.email = Faker::Internet.free_email(client.name)
	client.mobile = Faker::Number.number(10)
	client.website = Faker::Internet.domain_name
	client.save
end

100.times do
	project = Project.new
	project.name = Faker::App.name
	project.description = Faker::Lorem.sentence
	project.start_date = Faker::Date.between(Date.today.beginning_of_year, Date.today)
	project.end_date = Faker::Date.between(project.start_date, project.start_date + 3.months)
	project.client_id = Client.all.pluck(:id).sample
	project.save
end


200.times do
	task = Task.new
	task.title = Faker::App.name
	task.project_id = Project.all.pluck(:id).sample
	task.due_date = Faker::Date.between(Date.today + 1.month, Date.today + 4.months)
	task.is_completed = Faker::Boolean.boolean(0.2)
	task.save
end
