class DentistController < ApplicationController

  get '/signup' do
     erb :'/dentists/new'
  end

  post '/dentists' do
    # @dentist = Dentist.new
    # @dentist.email = params[:email]
    # @dentist.password = params[:password]
    # if @dentist.save
    if params[:email] != "" && params[:password] != ""
      Dentist.create(params)
      #binding.pry
      redirect '/patients'
    else
      erb :'dentists/new'
    end
   end
  end
