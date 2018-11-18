class PatientsController < ApplicationController

  get '/patients' do  #displays all patients in database
      @dentist = Dentist.find_by(session[:dentist_id])
      @patients = Patient.all
      erb :'/patients/index'
  end

  get '/patients/new' do  #creates a new patient
    if !logged_in?
      redirect '/login'
    else
      erb :'/patients/new'
    end
  end

  post '/patients' do  #displays patient details entered in params
    if logged_in?
      @patient = Patient.new
      @patient.name = params[:name]
      @patient.insurance = params[:insurance]
      @patient.email = params[:email]
      @patient.history = params[:history]
      if @patient.save
        erb :'/patients/show'
      else
        redirect '/patients/new'
      end
    else
      redirect '/login'
    end
  end

  get '/patients/:id' do
    if logged_in?
    @patient = Patient.find_by_id(params[:id])
      erb :'/patients/show'
    else
      redirect '/login'
    end
  end

  delete '/patients/:id/delete' do
    @patient = Patient.find_by_id(params[:id])
    if session[:dentist_id] == @patient.dentist_id
      @patient.delete
      redirect '/patients'
    else
      redirect to "/patients/#{params[:id]}"
    end
  end

  get '/patients/:id/edit' do
     if !logged_in?
       redirect '/login'
     else
       if patient = current_dentist.patients.find_by(params[:dentist_id])
         #@patient.name = params[:name]
         erb :'/patients/edit'
       else
         redirect '/patients'
       end
     end
  end

  patch '/patients/:id' do
    if logged_in?
      if params[:name] == ""
        redirect "/patients/#{params[:id]}/edit"
      else
      @patient = Patient.find_by_id(params[:id])
      @patient.name = params[:name]
      @patient.save
        redirect "/patients/#{params[:id]}"
      end
    else
      redirect '/login'
    end
  end

end
