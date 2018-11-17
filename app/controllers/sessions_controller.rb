class SessionsController < ApplicationController

  get '/login' do
    erb :login
  end

  post '/sessions' do
    login(params[:email], params[:password])
    redirect '/patients'
  end

  get '/logout' do
    logout!
  end

end
