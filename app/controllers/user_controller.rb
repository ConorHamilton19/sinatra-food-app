class UserController < ApplicationController 
  
  get '/signup' do 
   if !logged_in?
      erb :"/users/signup"
   else
      redirect :"/restaurants"
    end 
  end 
  
  post '/signup' do 
     if 
       params[:username] == "" || params[:password] == ""
       redirect "/signup"
     else
       @user = User.create(username: params[:username], password: params[:password])
       @user.save
       session[:user_id] = @user.id
       redirect "/restaurants"
     end 
  end 
  
  
end 