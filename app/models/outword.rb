class Outword < ActiveRecord::Base
  belongs_to :employee
  belongs_to :handover_id
  validates :date, presence:true
  validates :handover_to, presence:true
end
