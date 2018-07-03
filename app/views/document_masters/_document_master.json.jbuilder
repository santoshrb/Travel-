json.extract! document_master, :id, :code, :name, :description, :status, :created_at, :updated_at
json.url document_master_url(document_master, format: :json)
