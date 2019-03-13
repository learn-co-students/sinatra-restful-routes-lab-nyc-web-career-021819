class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  # code actions here!

  #Index
  get '/recipes' do
    @recipes = Recipe.all
    erb :index
  end

  #New
  get '/recipes/new' do
    erb :new
  end

  post '/recipes' do
    @recipe = Recipe.create(params)
    redirect to "/recipes/#{@recipe.id}"
  end

  #Show
  get '/recipes/:id' do
    @recipe = Recipe.find(params[:id])

    erb :show
  end

  #Edit
  get '/recipes/:id/edit' do
    @recipe = Recipe.find(params[:id])

    erb :edit
  end

  patch '/recipes/:id' do
    @recipe = Recipe.find(params[:id])
    @recipe.update(params[:recipe])
    redirect to "/recipes/#{@recipe.id}"
  end

  #Delete
  delete '/recipes/:id' do
    @recipe = Recipe.find_by_id(params[:id])
    @recipe.delete
    redirect to '/recipes'
  end
end
