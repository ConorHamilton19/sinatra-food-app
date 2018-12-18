class SessionController < ApplicationController
  
  get '/login' do 
    erb :"sessions/login", :layout => :layout_login
  end 
  
  post '/login' do 
    @user = User.find_by(:username => params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect "/restaurants"
    else 
      redirect "/signup"
    end
  end 
  
  get '/logout' do 
    session.clear
    erb :"/index"
  end 
  
end 