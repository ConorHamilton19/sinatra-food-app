class SessionController < ApplicationController
  
  get '/login' do 
    erb :"sessions/login"
  end 
  
  post '/sessions' do 
    session[:username] = params[:username]
    redirect "/restaurants"
  end 
  
  get '/logout' do 
    session.clear
  end 
  
end 