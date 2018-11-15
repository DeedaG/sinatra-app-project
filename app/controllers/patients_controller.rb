class PatientsController < ApplicationController

  get '/patients' do
    "a list of patients"
  end

  get '/patients/new' do
    if !logged_in?
      redirect '/login'
    else
      "another form"
    end
  end

  get '/patients/:id/edit' do
    if !logged_in?
      redirect '/login'
    else
      "another form"
    end
  end

end
