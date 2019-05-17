require './config/environment'

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

use Rack::MethodOverride
#allows us to send patch and delete requests 

#mount other controllers here with "use"
run ApplicationController
