class DentistController < ApplicationController

  get '/signup' do
  #  if logged_in?
    #  redirect '/patients'
    # else
       erb :'/dentists/new'
    # end
  end

  post '/dentists' do
    @dentist = Dentist.new
    @dentist.email = params[:email]
    @dentist.password = params[:password]
    if @dentist.save
      redirect '/login'
    else
      erb :'dentists/new'
    end
   end
  end
