class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "secret"
  end


helpers do

  def logged_in?
    !!session[:email]
  end

  def login(email, password)
    dentist = Dentist.find_by(:email => email)
    if dentist && dentist.authenticate(password)
      session[:email] = dentist.email
    else
      redirect '/login'
    end
  end

  def logout!
    session.clear
    redirect '/patients'
  end
 end
end
