require 'pry'
class FiguresController < ApplicationController
  get '/figures/new' do
    erb :'figures/new'
  end

  post '/figures' do
    @figure = Figure.new(:name => params[:figure][:name])
    @figure.save
    @figure.titles << Title.find_or_create_by(:name => params[:title][:name])
    @figure.landmarks << Landmark.find_or_create_by(:name => params[:landmark][:name])
  end

  get '/figures' do
    @figures = Figure.all
    erb :'figures/index'
  end

  get '/figures/:id' do
    @figure = Figure.find_by_id(params[:id])
    erb :'figures/show'
  end

  get '/figures/:id/edit' do
    @figure = Figure.find_by_id(params[:id])
    erb :'figures/edit'
  end

  post '/figures/:id/edit' do
    @figure = Figure.find_by_id(params[:id])
    @figure.update(:name => params[:figure][:name])
    @figure.titles << Title.find_or_create_by(:name => params[:title][:name])
    @figure.landmarks << Landmark.find_or_create_by(:name => params[:landmark][:name])
    @figure.save
    redirect "/figures/#{@figure.id}"
  end
end
