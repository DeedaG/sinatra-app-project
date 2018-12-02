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
      #login(params[:email], params[:password])
      #binding.pry
      redirect '/login'
    else
      erb :'dentists/new'
    end
   end
  end
