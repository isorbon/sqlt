class Shadow< ActiveRecord::Base
  self.establish_connection(Use.find(1)[:db_shadow])
end