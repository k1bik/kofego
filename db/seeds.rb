# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

puts "creating required roles..."

Iam::Roles::Record.find_or_create_by!(name: "Администратор", system_type: Iam::Roles::Record::ADMIN)
Iam::Roles::Record.find_or_create_by!(name: "Сотрудник", system_type: Iam::Roles::Record::EMPLOYEE)

puts "required roles successfully created!"
