module ApplicationHelper
  #should be in user_helpers.rb
  def user_type_options
    [['Admin','admin'],
     ['Store manager','store'],
     ['Warehouse manager','warehouse'],
     ['Customer','customer'],
    ]
  end
  def store_admin
     if current_user.nil?
          false
        else
          current_user.user_type=='store' || current_user.user_type=='admin'
        end
    end

  def warehouse_admin
    if current_user.nil?
      false
    else
      current_user.user_type=='warehouse' || current_user.user_type=='admin'
    end
  end
  def admin
    if current_user.nil?
      false
    else
      current_user.user_type=='admin'
    end
  end
end
