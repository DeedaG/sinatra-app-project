class AssistantsController < ApplicationController

  get '/assistants' do  #displays all assistants in database
      @dentist = Dentist.find_by(session[:dentist_id])
      @assistants = Assistant.all
      erb :'/assistants/index'
  end

  get '/assistants/new' do  #creates a new patient
    if !logged_in?
      redirect '/login'
    else
      erb :'/assistants/new'
    end
  end

  post '/assistants' do  #displays patient details entered in params
    if !logged_in?
      redirect '/login'
    else
      @assistant = Assistant.create(params[:assistant])
      @assistant.dentist = Dentist.find_or_create_by(params[:dentist])
      @assistant.name = params[:name]
      @assistant.position = params[:position]
      @assistant.skills = params[:skills]
      @assistant.save
        redirect "/assistants"
    end
  end

    get '/assistants/:id' do
      if !logged_in?
        redirect '/login'
      else
        @assistant = Assistant.find_by_id(params[:id])
      #@patient = current_dentist.patients.find_by_id(params[:id])
        erb :'/assistants/show'
      end
    end

    get '/assistants/:id/edit' do
       if !logged_in?
         redirect '/login'
       else
         #@patient = current_dentist.patients.find_by(params[:id])
         @assistant = Assistant.find_by_id(params[:id])
          erb :'/assistants/edit'
       end
    end

    patch '/assistants/:id' do
      if logged_in?
        if params[:name] == ""
          redirect "/assistants/#{params[:id]}/edit"
        else
        @assistant = Assistant.find_by_id(params[:id])
        @assistant.name = params[:name]
        @assistant.position = params[:position]
        @assistant.skills = params[:skills]
        @assistant.save
          redirect "/assistants/#{params[:id]}"
        end
      else
        redirect '/login'
      end
    end

    delete '/assistants/:id/delete' do
      @assistant = Assistant.find_by_id(params[:id])
      #if @patient = current_dentist.patients.find_by(params[:id])
        @assistant.delete
        redirect '/assistants'
      #else
      #  redirect to "/patients/#{params[:id]}"
      #end
    end
  end