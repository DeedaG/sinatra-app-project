class SessionsController < ApplicationController

  get '/login' do
    erb :login
  end

  post '/sessions' do
    session[:email] = params[:email]
    redirect '/patients'
  end

  get '/logout' do
    logout!
    redirect '/patients'
  end

end
