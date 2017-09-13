# == Schema Information
#
# View name: rep_all
#
# id       | integer      |
# sex      | text         |
# dept     | text         |
# div      | text         |
# region   | character(2) |
# province | text         |
# avg1     | numeric      |
# avg2     | numeric      |
# avg3     | numeric      |
# avg4     | numeric      |
# avg5     | numeric      |
# avg6     | numeric      |
# avg7     | numeric      |
# avg8     | numeric      |
# avg9     | numeric      |
# total    | numeric      |
# finished | boolean      |
#

# This is a report from a SQL View

module Report
  class RepAll < ActiveRecord::Base
    self.table_name = 'rep_all'

    def self.bysex
    end

    protected

    def readonly?
      true
    end
  end # class

  class RegProgress < ActiveRecord::Base
    self.table_name = 'v_reg_progress'

    def self.byregion
    end

    protected

    def readonly?
      true
    end
  end

  class ProvProgress < ActiveRecord::Base
    self.table_name = 'v_prov_progress'

    def self.byprovince
    end

    protected

    def readonly?
      true
    end
  end

  class OffProgress < ActiveRecord::Base
    self.table_name = 'v_off_progress'

    def self.byoffice
    end

    protected

    def readonly?
      true
    end
  end

  class OffnameProgress < ActiveRecord::Base
    self.table_name = 'v_offname_progress'

    def self.byoffice
    end

    protected

    def readonly?
      true
    end
  end

  class DeptProgress < ActiveRecord::Base
    self.table_name = 'v_dept_progress'

    def self.bydepartment
    end

    protected

    def readonly?
      true
    end
  end

  class DivProgress < ActiveRecord::Base
    self.table_name = 'v_div_progress'

    def self.bydivision
    end

    protected

    def readonly?
      true
    end
  end

end # module

