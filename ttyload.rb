class Ttyload < Formula
  desc 'Utility to show a graph of load average'
  head  'https://github.com/lindes/ttyload.git'
  homepage 'http://www.daveltd.com/src/util/ttyload/'
  url 'https://github.com/lindes/ttyload.git'
  version '0.5.3'

  def install
    system "make"
    bin.install 'ttyload'
    man1.install 'ttyload.1'
  end

  test do
    ENV["TERM"] = "xterm-256color"
    IO.popen("#{bin}/ttyload",  "w+") do |pipe|
      sleep 1
      pipe.write "\C-c"
      pipe.close_write
    end
    assert_equal $?.exitstatus, 130
  end

end

