require 'byebug'

libdir = File.dirname('lib')
$LOAD_PATH.unshift(libdir) unless $LOAD_PATH.include?(libdir)

# Dir[File.expand_path(File.join(File.dirname(__FILE__),'lib','*.rb'))].each {|f| require f}
