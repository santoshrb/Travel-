module ApplicationHelper
  def class_name
    if action_name == 'new' || action_name == 'create' || action_name == 'update'
      'class: btn btn-primary btn-sm'
    else
      'class: btn btn-success btn-sm'
    end
  end

  def data_info
    if action_name == 'new' || action_name == 'create' || action_name == 'update'
      'Saving...'
    else
      'updating...'
    end
  end
end
