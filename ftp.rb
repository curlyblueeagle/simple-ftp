require 'net/ftp'

def printLine(line)
  puts line
end

class FTPClient
  ## attr_reader :host, :user, :password
  def initialize(host, user, password)
    @host = host
    @user = user
    @password = password
  end

  def startConnection
    ftp = NET::FTP.new(@host, @user, @password);

    return ftp
  end

  def gettextfile(path, file, code)
    ftp = startConnection()
    ftp.chdir(path)

    ftp.gettextfile(file) do |line|
      code.call(line)
    end

  end

  def closeConnection(ftp)
    unless ftp.closed?
      ftp.close()
    end

  end

end





