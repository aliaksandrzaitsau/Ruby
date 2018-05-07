# Basic server class
class Server
  TYPE = 'base'.freeze

  attr_accessor :spawned_by, :deployed_by, :cpu, :ram, :ssd, :name, :type, :ip

  def initialize
    @type = TYPE
  end

  def self.new_server
    new
  end

  def ping
    @cpu.even?
  end

  def deploy!
    @name = "#{@ip}-#{@type}"
    @status = 'Running'
  end
end

serv = Server.new
serv.ip = "1.1.1.1"
p serv.deploy!
