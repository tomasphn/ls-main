# list.rb
require "sinatra"
require "sinatra/reloader"
require "tilt/erubis"

get "/" do
  @files = Dir.glob("175_RB/directory_index/public/*").map {|file| File.basename(file) }.sort
  puts "Files: #{@files}"
  @files.reverse! if params[:sort] == "desc"
  erb :main
end
