#############TASK1################

#input = '10.6.246.103 - - [23/Apr/2018:20:30:39 +0300] "POST /grid/2/messages HTTP/1.1" 200 48 0.0498
#10.6.246.101 - - [23/Apr/2018:20:30:42 +0300] "POST /grid/2/event HTTP/1.1" 200 - 0.2277
#2018-04-23 20:30:42: SSL error, peer: 10.6.246.101, peer cert: , #<Puma::MiniSSL::SSLError: System error: Undefined error: 0 - 0>
#10.6.246.101 - - [23/Apr/2018:20:29:39 +0300] "POST /grid/2/messages HTTP/1.1" 200 48 0.0290'

def task_1(input)
  list = ''
  input.each_line do |line|
     if (line.downcase.include? 'error')
       list << line[0..-2]
     end
  end
  list
end

############TASK2##############

#input = %q('2018-04-23 17:17:49.7 ubuntu-xenial[14319] Debug - Calling core with action: event
#2018-04-23 17:17:49.7 ubuntu-xenial[14319] Debug - connecting to: 10.6.246.101
#2018-04-23 17:17:49.8 ubuntu-xenial[14319] Debug - docker event processed
#2018-04-23 17:18:19.5 ubuntu-xenial[14319] Debug - monitoring grid communication health
#2018-04-23 17:18:38.8 ubuntu-xenial[14319] Debug - Calling core with action: messages
#2018-04-23 17:18:38.8 ubuntu-xenial[14319] Debug - connecting to: 10.6.246.101
#2018-04-23 17:18:59.8 ubuntu-xenial[14319] Debug - inside docker_handle_event')

def task_2(input)
  task2_list = []
  input.each_line do |lines|
    if (lines.match(/(?:\d{1,3}\.){3}\d{1,3} - - \[(.*?)\] "POST \/.* HTTP\/.*/))
    task2_list << lines.split('[')[1].split(']')[0] + " FROM: " + lines.split[0] + " TO:" + lines.upcase.split('POST')[1].split('HTTP')[0][0..-2] if (lines.downcase.match("^(?!.*error).*$"))
    end
  end
  task2_list
end

############TASK3#############

def task_3(input)
  require 'time'
  list = []
  input.each_line do |line|
    list.push Time.parse(line) if line.include? 'Calling'
  end
    list[1] - list[0]
end

#input = 'вещественные числа, типа 3.14 рассматриваются как 3 числа'

def task_4(input)
  sum = 0
  input.each_char do |letter|
    sum += letter.to_i if letter.to_i.is_a? Integer
  end
  sum
end
