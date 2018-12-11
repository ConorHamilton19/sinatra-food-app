Specifications for the Sinatra Assessment
Specs:

 [x]Use Sinatra to build the app
      I used sinatra as can be seen in my Gemfile
 [x]Use ActiveRecord for storing information in a database
      ActiveRecord was used to store information and create relationships between my models as can be seen in Models/DB and Gemfile.
[x] Include more than one model class (e.g. User, Post, Category)
      Three different Models used, User/Restaurant and Meal
 [x]Include at least one has_many relationship on your User model (e.g. User has_many Posts)
    User has_many Restaurants and has_many Meals, through Restaurants. 
 [x]Include at least one belongs_to relationship on another model (e.g. Post belongs_to User)
    Restaurant belongs_to a User and a Meal belongs_to a Restaurant.
 [x]Include user accounts with unique login attribute (username or email)
    Users are stored in database and need unique username and password to login. Password is encrypted using bcrypt and has_secure_password.
 [x]Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying
    User has access to all CRUD for Meals and everything but edit for Restaurants because the capability did not seem necessary to build in. 
 [x]Ensure that users can't modify content created by other users
    Using both "current_user" which confirms session ID and user_id match as well as confirming that in certain routes
 [x]Include user input validations
    user input is validated in a few ways including password validation through bcrypt and through comparing it to database informaiton. 
 BONUS - not required - Display validation failures to user with error message (example form URL e.g. /posts/new)
 [x]Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code
Confirm

[x] You have a large number of small Git commits
 [x]Your commit messages are meaningful
[x] You made the changes in a commit that relate to the commit message
 [x]You don't include changes in a commit that aren't related to the commit message
    Tried to commit often enough that this was not the case