BhppSurvey::Application.routes.draw do

  resources :hpi_surveys

  resources :admins

  devise_for :users, path_names: { sign_in: "login", sign_out: "logout" }

  mount SurveyorGui::Engine => "/surveyor_gui", :as => "surveyor_gui"
  mount Surveyor::Engine => "/surveys", :as => "surveyor"

  root :to => "surveyor#welcome"

  devise_scope :user do
    get 'users/welcome' => 'devise/sessions#welcome', :as => 'welcome'
    get 'results' => 'results#index', :as => 'results'
    get 'results/:survey_code' => 'results#show', :as => 'result'
    get 'users/logout' => 'devise/sessions#destroy', :method => :delete
    get 'surveyor_gui/logout' => 'devise/sessions#destroy', :method => :delete
    get 'surveyor/score' => 'surveyor#score'
    get 'surveyor/:survey_code/:response_set_code' => 'surveyor#show'
    get 'surveyor/:survey_code/:response_set_code/take' => 'surveyor#edit'
    get '/surveyor/edit' => 'surveyor#edit'
    get 'reports/bysex' => 'reports#bysex'
    get 'reports/bydept' => 'reports#bydept'
    get 'reports/bydiv' => 'reports#bydiv'
    get 'reports/byreg' => 'reports#byreg'
    get 'reports/byprov' => 'reports#byprov'
    get 'reports/byofftype' => 'reports#byofftype'
    get 'reports/byhosp' => 'reports#byhosp'
    get 'reports/bymyhosp' => 'reports#bymyhosp'
    get 'reports/byregprog' => 'reports#byregprog'
    get 'reports/byprovprog' => 'reports#byprovprog'
    get 'reports/byoffprog' => 'reports#byoffprog'
    get 'reports/byoffnameprog' => 'reports#byoffnameprog'
    get 'reports/bymyoffprog' => 'reports#bymyoffprog'
    get 'reports/bydeptprog' => 'reports#bydeptprog'
    get 'reports/bydivprog' => 'reports#bydivprog'
    get 'reports/overview' => 'reports#overview'

    get '/hpi_surveys/new' => 'hpi_surveys#new'
    get '/hpi/score' => 'hpi_surveys#hpiscore'
    get '/admins/:id/edit' => 'admins#edit'
    get '/hpi/reports' => 'hpi_surveys#hpireport'
  end

end

