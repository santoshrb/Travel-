# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.create(email: "admin@gmail.com", password: "12345678", role: "Admin")
Company.create(code: "", name: string, address: text, country: string, state: string, district: string, city: string, pin_code: integer, email: string, contact_no: string, status: boolean)
Branch.create(id: integer, code: string, name: string, address: text, email: string, contact_no: string, status: boolean, company_id: integer)
Employee.create(id: integer, code: string, prefix: string, first_name: string, middle_name: string, last_name: string, date_of_birth: date, gender: string, contact_no: string, email: string, blood_group: string, address: string, country: string, state: string, district: string, city: string, pin_code: integer, adhar_no: string, status: boolean, company_id: integer, branch_id: integer)
VehicleType.create(id: integer, code: string, name: string, description: text, status: boolean) 
Enquiry.create(id: integer, mobile_no: string, name_first: string, middle_name: string, last_name: string, email: string, address: text, place: string, user_id: integer, vehicle_type_id: integer)
Scheme.create(id: integer, name: string, budget: decimal, down_payment: string, intrest: decimal, from_date: date, to_date: date, status: boolean, installment_amount: decimal, scheme_type: string, installment: string, vehicle_type_id: integer)