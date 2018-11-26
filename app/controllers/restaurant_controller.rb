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
     erb :"/restaurants/new"
   else 
     redirect "/login"
   end 
  end 
  
  post '/restaurants' do 
    if logged_in?
      if params[:name] == ""
        redirect "/restaurants/new"
      else 
        @restaurant = Restaurant.create(name: params[:name])
        current_user.restaurant << @restaurant
        @restaurant.save
        redirect "/restaurant/#{@restaurant.id}"
     end 
    else 
      redirect "/login"
    end 
  end 
  
  
end 