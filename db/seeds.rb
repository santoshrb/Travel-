# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



Company.create(code: "C001", name: "ABC", address: "Magarpatta", country: "India", state: "Maharashtra", district: "Pune", city: "Pune", 
	           pin_code: 123456, email: "abc@gmail.com", contact_no: "9632785410", status: true)
Branch.create(code: "B001", name: "Pune", address: "Magarpatta", email: "b001@gmail.com", contact_no: "1234567890", status: true,
 company_id: 1)
Employee.create(code: "10001", prefix: "Mr.", first_name: "admin", middle_name: "b", last_name: "c", 
	date_of_birth: "2018-06-1990", gender: "Male", contact_no: "9970865601", email: "abc", blood_group: "B+", address: "Magarpatta", country: "India",
	 state: "Maharashtra", district: "Pune", city: "Pune", pin_code: "123654", adhar_no: "ASDFG25410A", status: true, company_id: 1,
	  branch_id: 1)
User.create(email: "admin@gmail.com", password: "12345678", role: "Admin")
# VehicleType.create(id: integer, code: string, name: string, description: text, status: boolean) 
# Enquiry.create(id: integer, mobile_no: string, name_first: string, middle_name: string, last_name: string, email: string, 
# 	address: text, place: string, user_id: integer, vehicle_type_id: integer)
# Scheme.create(id: integer, name: string, budget: decimal, down_payment: string, intrest: decimal, from_date: date, to_date: date,
#  status: boolean, installment_amount: decimal, scheme_type: string, installment: string, vehicle_type_id: integer)