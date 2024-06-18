class SessionsController < ApplicationController
  # ----- add these lines here: -----
  
    def new
      # No need for anything in here, we are just going to render our
      # new.html.erb AKA the login page
    end
  
    def create
      # Look up User in db by the email address submitted to the login form and
      # convert to lowercase to match email in db in case they had caps lock on:
      seller = Seller.find_by(email: params[:login][:email].downcase)
      
      # Verify user exists in db and run has_secure_password's .authenticate() 
      # method to see if the password submitted on the login form was correct: 
      if seller && seller.authenticate(params[:login][:password]) 
        # Save the user.id in that user's session cookie:
        session[:seller_id] = seller.id.to_s
        # te re dirige al show del seller
        redirect_to seller_path(seller), notice: 'Successfully logged in!'
      else
        # if email or password incorrect, re-render login page:
        flash.now.alert= "Incorrect email or password, try again."
        render :new, status: :unprocessable_entity
      end
    end
  
    def destroy
      # delete the saved user_id key/value from the cookie:
      session.delete(:seller_id)
      redirect_to root_path, notice: "Logged out!"
    end
    
  # ----- end of added lines -----
  end
  
