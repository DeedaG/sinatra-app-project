class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "secret"
  end

get '/' do
  if !logged_in?
    redirect '/signup'
  else
  redirect '/login'
  end
end

helpers do

  def logged_in?
    !!current_dentist
  end

  def current_dentist
    @current_dentist ||= Dentist.find_by(:email => session[:email]) if session[:email]
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
