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