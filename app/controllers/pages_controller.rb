class PagesController < ApplicationController
    before_action :authenticate_user!, only: [:login]
    
    def login
    end
    
    def home
    end
   
    def abandoned
    end
    
end
