class SessionController < ApplicationController
  
  get '/login' do 
    erb :"sessions/login"
  end 
  
  post '/sessions' do 
    session[:username]
  end 
  
end 