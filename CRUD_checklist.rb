=begin
Sinatra Quick Start
- Schema (fields, associations)
- make db migration file generate
- make models (generate:model)
- create db (rake db:create)
- migrate db (rake generate:migration)
- run console, check models and associations
- controllers, make routes
=end
########################################
### Terminal ###
bundle install
bundle exec rake -T
bundle exec rake db:create
bundle exec rake generate:migration NAME=create_users
### Go into Migration Folder ###
class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :full_link
      t.string :short_link
      t.integer :count

      t.timestamps
   	end
  end
end

# bundle exec rake generate:model NAME=User
# 	-lower or upper case. Singular

class User < ActiveRecord::Base
  has_many :subscriptions

  validates :email, uniqueness: true
  validates :email, :password_hash, presence: true
end

#### Go into APP Folder ####
MODELS: fill associations
MIGRATION: fill tables

#### Terminal ####
bundle exec rake db:migrate
bundle exec rake db:seed
  #if needed


#### Terminal ####
bundle exec rake console
User.connection
User

#### GO INTO CONTROLLER AND MAKE ROUTES ####
# Don't need all all actions for everything

# R   index     get '/channels'
#     show      get '/channels/id'

# C   create    get '/users/new'
#     new       post '/users'

# U   edit      put
#     update

# D   delete    delete

#### GO INTO VIEWS ####
#try to do 1 view per route

#### PROFILE.ERB ####
<h1>Welcome Back <%="#{{current_user.name}}"%>!</h1>

#### LAYOUT.ERB ####
#great place to add LOGOUT link

<div class="fieldset">
   <% if current_user %>
     <a href="/logout">Logout</a>
   <% end %>
 </div>

#### NEW.ERB ####
#### FORM TEMPLATE ####
<form action="/register" id="registration" method="POST" >
   <div class="fieldset">
     <label for="first_name">First Name</label>
       <input type="text" name="user[first_name]" placeholder="first name" />
   </div>
   <div class="fieldset">
     <label for="last_name">Last Name</label>
       <input type="text" name="user[last_name]" placeholder="last name" />
   </div>
   <div class="fieldset">
     <label for="email">Email</label>
       <input type="text" name="user[email]" placeholder="email" />
   </div>
   <div class="fieldset">
     <label for="password">Password</label>
       <input type="password" name="user[password_hash]" placeholder="password" />
     </div>
   <div class="fieldset">
       <input type="submit" value="Register"/>
   </div>
 </form>

#### IF YOU NEED A NEW MODEL/CONTROLLER ####
bundle exec rake generate:migration NAME=create_subscription
bundle exec rake generate:model NAME=subscription
#fill out model association and migration table
bundle exec rake db:migrate
bundle exec rake db:seed
  #if needed

#### Terminal ####
bundle exec rake console
Subscription.connection
Subscription
#CONTROLLER - ROUTES ####
#VIEWS

### HELPER METHODS ###
helpers do

  def login(user)
    session[:user_id] = user.id
  end

  def logout
    session.clear
  end

  def current_user_id
    session[:user_id]
  end

  def user?
    if current_user_id != nil
      true
    else
      false
    end
  end

end
