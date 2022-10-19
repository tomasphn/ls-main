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

  client.puts "<h1>Counter</h1>"

  number = params["number"].to_i
  client.puts "<p>The current number is #{number}.</p>"

  client.puts "<a href='?number=#{number + 1}'>Add one</a>"
  client.puts "<a href='?number=#{number - 1}'>Minus one</a>"
  
  client.puts "</pre>"
  client.puts "</body>"
  client.puts "</html>"
  client.close
end
