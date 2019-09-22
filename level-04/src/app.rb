# app.rb
require 'sinatra'

def get_todos
  @@todos ||= []
end

def get_todo
  get_todos()[@id.to_i-1]
end

def add_todo(todo)
  #get_todos().push(:title=>title,:date=>date})
    get_todos().push(todo)
end

def update_todo(title)
  get_todos()[@id.to_i - 1] = title
end

def delete_todo
  get_todos().slice!(@id.to_i - 1)
end

delete "/todos/:id" do
  @id = params[:id]
  delete_todo()
  redirect "/todos"
end

#get,post,put
get "/todos" do
  @todos = get_todos()
  erb :todos
end

get "/todos/:id" do
  @id = params[:id]
  @todo = get_todo()
  @@dt=@todo[:date].to_s
  erb :todo
end

post "/todos" do
  @dt=params[:date]
  add_todo({:title=>params[:title],:date=>params[:date]})
  redirect "/todos"
end

put "/todos/:id" do
  @id = params[:id]
  update_todo({:title=>params[:title],:date=>@dt})
  redirect "/todos"
end
