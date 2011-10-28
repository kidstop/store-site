class NewsletterController < ApplicationController
  def subscribe
    mimi = MadMimi.new(ENV['MADMIMI_EMAIL'], ENV['MADMIMI_KEY'])
    result = mimi.add_to_list(params[:newsletter], "Newsletter")
    
    if result.empty?
      flash[:success] = "Welcome To Our Mailing List"
    else
      flash[:error] = "Invalid Email"
    end
    
    redirect_to :back
  end
end