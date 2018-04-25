#############TASK1################

#input = '10.6.246.103 - - [23/Apr/2018:20:30:39 +0300] "POST /grid/2/messages HTTP/1.1" 200 48 0.0498
#10.6.246.101 - - [23/Apr/2018:20:30:42 +0300] "POST /grid/2/event HTTP/1.1" 200 - 0.2277
#2018-04-23 20:30:42: SSL error, peer: 10.6.246.101, peer cert: , #<Puma::MiniSSL::SSLError: System error: Undefined error: 0 - 0>
#10.6.246.101 - - [23/Apr/2018:20:29:39 +0300] "POST /grid/2/messages HTTP/1.1" 200 48 0.0290'

input.each_line do |line|
  list = []
   if (line.downcase['error'])
     #puts 'There is some ERRORS'
     list.push(line)
   else
     #puts 'SUCCESSFULL'
     list.push(line.split('[')[1].split(']')[0] + " FROM:" + line.split[0] + " TO:" + line.upcase.split('POST')[1].split('HTTP')[0])
   end
   puts list
end

############TASK2##############

#input = %q('2018-04-23 17:17:49.7 ubuntu-xenial[14319] Debug - Calling core with action: event
#2018-04-23 17:17:49.7 ubuntu-xenial[14319] Debug - connecting to: 10.6.246.101
#2018-04-23 17:17:49.8 ubuntu-xenial[14319] Debug - docker event processed
#2018-04-23 17:18:19.5 ubuntu-xenial[14319] Debug - monitoring grid communication health
#2018-04-23 17:18:38.8 ubuntu-xenial[14319] Debug - Calling core with action: messages
#2018-04-23 17:18:38.8 ubuntu-xenial[14319] Debug - connecting to: 10.6.246.101
#2018-04-23 17:18:59.8 ubuntu-xenial[14319] Debug - inside docker_handle_event')

require 'time'
list = []
input.each_line do |line|
  list.push Time.parse(line) if line.include? 'Calling'
end
  puts list[1] - list[0]

############TASK3#############

#input = 'вещественные числа, типа 3.14 рассматриваются как 3 числа'

sum = 0
regex = /[[:digit:]]+/
input.scan(regex)  { |num|
    sum += num.to_i
  }
puts "#{sum}"
