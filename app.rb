### class Ga
# Manage repos/groups/users
# Manage git add/commit/pull/push
# Dependency - https://github.com/wingrunr21/gitolite
# Dependency - https://github.com/mojombo/grit
### gitolite doc
# http://sitaramc.github.com/gitolite/master-toc.html
require 'gitolite'
class Ga
  def self.repos
    ga_repo = Gitolite::GitoliteAdmin.new(App::GITOLITE_ADMIN_HOME)
    ga_repo.config.repos
  end

  def self.groups
  end

  def self.users
  end
end

require 'sinatra/base'
require 'haml'
class App < Sinatra::Base

  GITOLITE_ADMIN_HOME = "../gitolite-admin"
  GITOLITE_ADMIN_KEYDIR = "#{GITOLITE_ADMIN_HOME}/keydir"
  GITOLITE_ADMIN_CONF = "#{GITOLITE_ADMIN_HOME}/conf"
  GITOLITE_ADMIN_CONF_FILE = "#{GITOLITE_ADMIN_CONF}/gitolite.conf"

  get '/' do
    @repos = Ga.repos
    haml :index
  end

  get '/repos' do
    @repos = Ga.repos
    haml :repos
  end

  get '/groups' do
    haml :groups
  end

  get '/users' do
    haml :users
  end

  run! if app_file == $0
end