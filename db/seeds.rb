# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
pass = SecureRandom.hex(5)
admin = User.create email: "admin@vkm.de",
                    password: pass,
                    password_confirmation: pass
asmin.add_role = :admin
puts "Admin password is #{pass}"