require 'pry'
class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    redirect to "/recipes"
  end

  get '/recipes' do
    erb :index
  end

  get '/recipes/new' do
    erb :new
  end

  post '/recipes' do
    @recipe = Recipe.create(params)
    redirect to "/recipes/#{@recipe.id}"
  end


  get '/recipes/:id' do
    @recipe = Recipe.all.find_by(id: params[:id])
    erb :show
  end

  get '/recipes/:id/edit' do
    @recipe = Recipe.find(params[:id])
    erb :edit
  end


  patch '/recipes/:id' do
    @recipe = Recipe.find(params[:id])
    @recipe.update(params[:recipe])
    erb :show
    redirect to "recipes/#{@recipe.id}"
  end


  delete '/recipes/:id' do
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    redirect "/recipes/#{@recipe.id}"
  end

end
