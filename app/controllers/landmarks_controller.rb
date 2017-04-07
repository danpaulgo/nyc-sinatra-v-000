class LandmarksController < ApplicationController

  # CREATE

  get '/landmarks/new' do
    erb :'/landmarks/new'
  end

  post '/landmarks' do
    ladmark = Landmark.create(params[:landmark])
    redirect "/landmarks/#{landmark.id}"
  end

  # READ

  get '/landmarks' do
    @landmarks = Landmark.all
    erb :'/landmarks/index'
  end

  get '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])
    erb :'/landmarks/show'
  end

  # UPDATE

  get '/landmarks/:id/edit' do
    @landmark = Landmark.find(params[:id])
    erb :'/landmarks/edit'
  end

  patch '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])
    @landmark.update(params[:landmark])
    redirect "/landmarks/#{@landmark.id}"
  end

  # DELETE

  delete '/landmarks/:id/delete' do
    @landmark = Landmark.find(params[:id]).delete
    erb :'/landmarks/delete'
  end


end
