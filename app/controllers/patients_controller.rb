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
