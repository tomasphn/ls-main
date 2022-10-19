require "socket"

server = TCPServer.new("localhost", 3003)
loop do
  client = server.accept
  

  request_line = client.gets
  next if !request_line || request_line =~ /favicon/

  puts request_line

  http_method, path, params = request_line.scan(/^(.*?)\s(\/.*)\?(.+)\s/)[0]
  params = params.split('&').each_with_object({}) do |item, hash|
    key, value = item.split('=')
    hash[key] = value
  end

  client.puts "HTTP/1.1 200 OK"
  client.puts "Content-Type: text/HTML"
  client.puts
  client.puts "<html>"
  client.puts "<body>"
  client.puts "<pre>"
  client.puts http_method
  client.puts path
  client.puts params
  client.puts "</pre>"

  client.puts "<h1>Rolls!</h1>"

  rolls = params["rolls"].to_i
  sides = params["sides"].to_i

  rolls.times do
    roll = rand(sides) + 1
    client.puts "<p>", roll, "</p>"
  end

  client.puts "</body>"
  client.puts "</html>"
  client.close
end
