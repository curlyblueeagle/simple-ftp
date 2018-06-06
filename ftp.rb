require 'net/ftp'

def printLine(line)
  puts line
end

Net::FTP.open('ftp.test.com') do |ftp| 
  ftp.login(user='foo', passwd='bar');

  ftp.chdir('/ipblocklistv2');

  ftp.gettextfile('test.csv') do |line| 
    puts line;
  end
end

