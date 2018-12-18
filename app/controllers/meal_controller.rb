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
       
       @restaurant = current_user.restaurants.find_by(name: params[:restaurant_name])
       
       if @restaurant 
         @restaurant.meals << @meal
       else 
         @restaurant = Restaurant.create(name: params[:restaurant_name])
         @restaurant.meals << @meal 
         @restaurant.save
         current_user.restaurants << @restaurant 
        end 
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
      if @meal && @meal.restaurant.user == current_user
        @meal.delete
        redirect '/meals'
      else
        redirect '/meals'
      end
    else
      redirect '/login'
    end
  end
  
  
  get "/meals/:id/edit" do 
    if logged_in?
      if @meal = current_user.meals.find_by_id(params[:id])
      erb :"/meals/edit"
      else
        redirect '/meals'
      end 
    else 
      redirect '/login'
    end
  end
  
  patch "/meals/:id" do 
    if logged_in?  
      if params[:name] == "" || params[:ingredients] == ""
       redirect "/meals/#{params[:id]}/edit"
      else 
        @meal = Meal.find_by_id(params[:id])
          if @meal && @meal.restaurant.user == current_user
             @meal.update(name: params[:name], ingredients: params[:ingredients])
             redirect "/meal/#{@meal.id}"
          else
            redirect "/meals"
          end 
      end 
    else 
      redirect "/login"
    end 
  end 
  
end 