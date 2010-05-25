class StaticsController < ApplicationController

  def index
  end

  def education
  end

  def research
  end

  def entrepreneurship
  end

  def projects
  end

  def contact
  end

  def post_contact

    email = params[:email]
    message = params[:message]
    begin
      f = File.open("/home/tkairi/messages.txt", "a")
      f.puts(email)
      f.puts(Time.now)
      f.puts("\n")
      f.puts(message)
      f.puts("\n\n----\n")
      f.close
      flash[:notice] = "Thank you!"
    rescue
      flash[:error] = "Something went wrong. Please try again later."
    end
    redirect_to contact_path
  end

  def guide
    redirect_to "/pdf/SF_guide.pdf", :content_type => "application/pdf"
  end

end
