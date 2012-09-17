Gem::Specification.new do |s|
  s.name = 'custom_tailer'
  s.version = '0.0.1'
  s.summary = 'Tail a logfile and generate statsd metrics from new lines that appear'
  s.authors = ['John Berry']
  s.email = 'jberry@lumoslabs.com'
  s.files = Dir['lib/**/*.rb']
  s.executables << 'custom_tailer'
  s.add_runtime_dependency 'daemons', '~> 1.1.9'
  s.add_runtime_dependency 'file-tail', '~> 1.0.11'
  s.add_runtime_dependency 'statsd', '~> 0.5.4'
end
