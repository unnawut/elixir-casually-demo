require 'socket'
server = TCPServer.new 5000

while session = server.accept
  request = session.gets

  session.print "HTTP/1.1 200\r\n"
  session.print "Content-Type: text/html\r\n"
  session.print "\r\n"
  session.print "Hello world."

  session.close
end
