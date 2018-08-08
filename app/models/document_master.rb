class DocumentMaster < ActiveRecord::Base
	has_many :document_lists
  validates :code, presence:true,uniqueness:{case_sensitive:false}
  # validates :name, presence:true
end
