# ADMINS
def create_admin_if_new(email, name)
  admin = Admin.find_by(email: email)
  if !admin
    admin = Admin.new(name: name, email: email, password: "12345678", password_confirmation: "12345678")
    admin.skip_confirmation!
    admin.save!
  end
end

create_admin_if_new("admin@nucleo235.com.br", "Admin Núcleo 235")

if Rails.env.development?
  personal = Personal.find_or_create_by(name: 'Vall Personal', email: 'val@pb.com.br') do |personal| 
    personal.password = "12345678"
    personal.password_confirmation = "12345678"
    personal.skip_confirmation!
  end

  client = Client.find_or_create_by(name: 'Client', email: 'client@pb.com.br') do |client| 
    client.password = "12345678"
    client.password_confirmation = "12345678"
    client.skip_confirmation!
  end

  personal_client = PersonalClient.find_or_create_by(client: client, personal: personal) do |personal_client| 
    personal_client.objective = 'Get thinner'
    personal_client.fat_weight = 15
    personal_client.thin_weight = 20
    personal_client.fat_pct = 10
  end

  weekly_trainning = WeeklyScheduledTraining.find_or_create_by(personal_client: personal_client, 
    initial_date: Date.new(2016, 04, 12), starts_at: '12:00'.to_time, ends_at: '13:00'.to_time)
end