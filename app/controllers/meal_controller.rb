class MealController < ApplicationController
  
  get '/meals' do 
    if logged_in?
      @meals = Meal.all
      if @meals.empty? 
        redirect "/meals/new"
      else
        erb :"/meals/index"
      end 
    else 
      redirect "/login"
    end 
  end 
  
  get '/meals/new' do 
   if logged_in?
     erb :"/meals/new"
   else 
     redirect "/login"
   end 
  end 
  
  post '/meals' do 
    if logged_in?
      if params[:name] == ""
        redirect "/meals/new"
      else 
        @meal = Meal.create(name: params[:name], ingredients: params[:ingredients])
        @restaurant = Restaurant.find_by(name: params[:restaurant_name])
        @restaurant.meals << @meal
        @meal.save
        redirect "/meal/#{@meal.id}"
     end 
    else 
      redirect "/login"
    end 
  end 
  
  get '/meal/:id' do
    if logged_in?
      @meal = Meal.find_by_id(params[:id])
      erb :'meals/show'
    else
      redirect '/login'
    end 
  end 
  
  delete '/meal/:id/delete' do
    if logged_in?
      @meal = Meal.find_by_id(params[:id])
      if @meal && @meal.user == current_user
        @meal.delete
        redirect '/meals'
      else
        redirect '/meals'
      end
    else
      redirect '/login'
    end
  end
  
end 