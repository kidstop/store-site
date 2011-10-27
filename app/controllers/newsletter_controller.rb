class NewsletterController < ApplicationController
  def subscribe
    mimi = MadMimi.new(ENV['MADMIMI_EMAIL'], ENV['MADMIMI_KEY'])
    mimi.add_to_list(params[:newsletter], "Newsletter")
    
    redirect_to :back
  end
end
