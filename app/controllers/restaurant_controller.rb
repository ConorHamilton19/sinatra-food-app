class RestaurantController < ApplicationController
  
  get '/restaurants' do 
    if logged_in?
      @restaurants = Restaurant.all
      if @restaurants.empty? 
        redirect "/restaurants/new"
      else
        erb :"/restaurants/index"
      end 
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
        current_user.restaurants << @restaurant
        @restaurant.save
        redirect "/restaurant/#{@restaurant.id}"
     end 
    else 
      redirect "/login"
    end 
  end 
  
  get '/restaurant/:id' do
    if logged_in?
      @restaurant = Restaurant.find_by_id(params[:id])
      erb :'restaurants/show'
    else
      redirect '/login'
    end 
  end 
  
  delete '/tweets/:id/delete' do
    if logged_in?
      @restaurant = Restaurant.find_by_id(params[:id])
      if @restaurant && @restaurant.user == current_user
        @restaurant.delete
        redirect '/restaurants'
      else
        redirect '/restaurants'
      end
    else
      redirect '/login'
    end
  end
  
  
end 