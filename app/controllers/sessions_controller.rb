class SessionsController < ApplicationController

  get '/login' do
    erb :login
  end

  post '/sessions' do
    session[:email] = params[:email]
    redirect '/patients'
  end

end
