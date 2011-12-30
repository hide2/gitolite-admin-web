require 'sinatra/base'

class App < Sinatra::Base
  GITOLITE_ADMIN_HOME = "../gitolite-admin"
  GITOLITE_ADMIN_KEYDIR = "#{GITOLITE_ADMIN_HOME}/keydir"
  GITOLITE_ADMIN_CONF = "#{GITOLITE_ADMIN_HOME}/conf"
  GITOLITE_ADMIN_CONF_FILE = "#{GITOLITE_ADMIN_CONF}/gitolite.conf"

  get '/' do
    erb :index
  end

  run! if app_file == $0
end
