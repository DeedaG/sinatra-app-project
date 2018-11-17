class PatientsController < ApplicationController

  get '/patients' do
    @dentist = Dentist.find_by(session[:dentist_id])
    @patients = Patient.all
    erb :'/patients/index'
  end

  get '/patients/new' do
    if !logged_in?
      redirect '/login'
    else
      erb :'/patients/new'
    end
  end

  post '/patients' do
    if logged_in?
      @patient = Patient.new
      @patient.name = params[:name]
      @patient.insurance = params[:insurance]
      @patient.email = params[:email]
      @patient.history = params[:history]
      if @patient.save
        erb :'patients/show'
      else
        redirect '/patients/new'
      end
    else
      redirect '/login'
    end
  end


  get '/patients/:id/edit' do
    if !logged_in?
      redirect '/login'
    else
      if patient = current_dentist.patients.find_by(params[:id])
        "An edit patient form #{current_dentist.id} is editing #{patient.id}"
      else
        redirect '/patients'
      end
    end
  end

end
