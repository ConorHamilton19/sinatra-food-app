class RestaurantController < ApplicationController
  
  get '/restaurants' do 
    if logged_in?
      @restaurants = Restaurant.all
      erb :"/restaurants/index"
    else 
      redirect "/login"
    end 
  end 
  
  get '/restaurants/new' do 
    if logged_in?
      erb :"/resaurants/new"
    else 
      redirect "/login"
    end 
  end 
  
  
end 