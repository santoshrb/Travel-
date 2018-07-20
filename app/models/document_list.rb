class DocumentList < ActiveRecord::Base
  belongs_to :employee
  belongs_to :document_master
  belongs_to :vehicle_booking
end
