# ################task_3_1#####################

def task_3_1(input)
  start_time = Time.now
  input.call
  end_time = Time.now
  (end_time - start_time).round(1)
end
input = proc { sleep(1) }

# #####################task_3_2#####################


def task_3_2(array, digit = 0, &block)
  array = array.map { |v| yield v } if block_given?
  array.sum + digit
end

# ######################task_3_3####################

def task_3_3(input)
  input.detect { |value| (value % 7 == 3) && (value.to_s.size == 3) }
end

# ################task_3_4######################

def task_3_4(*args, &block)
  if block_given?
    args.count { |i| yield i }
     return nil if args.empty?
  else
    'ERROR'
  end
end

# ###############task_3_5###########################

def task_3_5(args, &block)
  if block_given?
    args.select { |n| yield n }.select { |n|  n % 2 == 0 }
  end
end

# ################task_3_6####################

def task_3_6(string)
  if block_given?
    string.split("\n").map { |e| yield(e) }
  else
    return string
  end
end
