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
        erb :'/patients/show'
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
      if patient.dentist_id = current_dentist.patients.find_by(params[:id])
        erb :'/patients/edit'
      else
        redirect '/patients'
      end
    end
  end

  patch '/patients/:id' do
    #if logged_in?
    #     @patient = Patient.find_by_id(params[:id])
    #
    #   #   if @patient.save
    #   #    redirect "/patients/#{params[:id]}"
    #   #  else
    #   #    redirect "/patients/#{params[:id]}/edit"
    #   #  end
    # else
    #   redirect '/login'
    # end
   end

end
