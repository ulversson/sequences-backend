class CreateAdminService
    def call
      User.find_or_create_by!(email: "admin@example.net",
                              name: "Super Admin") do |user|
        user.password = "P@$$w0rd212"
        user.password_confirmation = "P@$$w0rd212"
        user.admin!
      end
    end
  end