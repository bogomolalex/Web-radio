rake db:migrate 
rake db:migrate RAILS_ENV=test
rake db:migrate RAILS_ENV=production
rem gem install will_paginate

gem install mongrel_service 
gem install mongrel_service --platform x86-mswin32 
gem install cgi_multipart_eof_fix
mongrel_rails service::install --name RadioRubyTest -p 4000 -e production -a 78.36.196.106
