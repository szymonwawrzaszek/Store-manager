module EmployeesHelper
  def position_options
    [['Manager','manager'],
     ['Salesman','salesman'],
     ['Storekeeper','storekeeper'],
     ['Cleaner','cleaner'],
    ]
  end

  def work_time_options
    [['Full-time','full-time'],
     ['Three-quarter time','three-quarter time'],
     ['Half-time','half-time'],
     ['Quarter-time','quarter-time'],

    ]
  end
end
