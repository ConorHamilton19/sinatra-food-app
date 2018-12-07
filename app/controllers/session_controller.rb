class SessionController < ApplicationController
  
  get '/login' do 
    erb :"sessions/login"
  end 
  
  post '/login' do 
    @user = User.find_by(:username => params[:username])
    if @user && @user.authenticate(params[:password])
      session[:username] = params[:username]
      redirect "/restaurants"
    else 
      redirect "/signup"
    end
  end 
  
  get '/logout' do 
    session.clear
    redirect "/login"
  end 
  
end 