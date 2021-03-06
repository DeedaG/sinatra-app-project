
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
    if !logged_in?
      redirect '/login'
    else
      if params[:name] != ""
        current_dentist.patients.create(params)
        redirect '/patients'
      else
        redirect "/patients/new"
      end
    end
  end

  get '/patients/:id' do
    if !logged_in?
      redirect '/login'
    else
      @patient = Patient.find_by_id(params[:id])
    #@patient = current_dentist.patients.find_by_id(params[:id])
      erb :'/patients/show'
    end
  end

  get '/patients/:id/edit' do
     if !logged_in?
       redirect '/login'
     else
       #binding.pry
       patient = Patient.find_by_id(params[:id])
       #binding.pry
       if patient = current_dentist.patients.find_by_id(params[:id])
       "an edit patient form #{current_dentist.id} is editing #{patient.id}"
       #binding. pry
        erb :'/patients/edit'
      else
        flash[:errors] = "You are not authorized to edit this record."
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
      @patient.insurance = params[:insurance]
      @patient.email = params[:email]
      @patient.history = params[:history]
      @patient.save
        redirect "/patients/#{params[:id]}"
      end
    else
      redirect '/login'
    end
  end

  delete '/patients/:id/delete' do
    patient = Patient.find_by_id(params[:id])
    if patient = current_dentist.patients.find_by_id(params[:id])
      "a delete patient form #{current_dentist.id} is deleting #{patient.id}"
      patient.delete
      redirect '/patients'
    else
      flash[:errors] = "You are not authorized to delete this record."
      redirect to '/patients'
    end
  end
end
