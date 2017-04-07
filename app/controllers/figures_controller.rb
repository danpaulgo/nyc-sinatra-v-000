class FiguresController < ApplicationController

  # CREATE

  get '/figures/new' do
    @titles = Title.all
    @landmarks = Landmark.all
    erb :'/figures/new'
  end

  post '/figures' do
    figure = Figure.new(params[:figure])
    if !params[:title][:name].empty?
      title = Title.new(params[:title])
      figure.titles << title
    end
    if !params[:landmark][:name].empty?
      landmark = Landmark.new(params[:landmark])
      figure.landmarks << landmark
    end
    figure.save
    redirect "/figures/#{figure.id}"
  end

  # READ

  get '/figures' do
    @figures = Figure.all
    erb :'/figures/index'
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :'/figures/show'
  end

  # UPDATE

  get '/figures/:id/edit' do
    @titles = Title.all
    @landmarks = Landmark.all
    @figure = Figure.find(params[:id])
    erb :'/figures/edit'

  end

  patch '/figures/:id' do
    @figure = Figure.find(params[:id])
    @figure.update(params[:figure])
    if !params[:title][:name].empty?
      title = Title.new(params[:title])
      title.figures << @figure
      title.save
    end
    if !params[:landmark][:name].empty?
      landmark = Landmark.new(params[:landmark])
      landmark.figure = figure
      landmark.save
    end
    redirect "/figures/#{@figure.id}"
  end

  # DELETE

  delete '/figures/:id/delete' do
    @figure = Figure.find(params[:id]).delete
    erb :'/figures/delete'
  end

end
