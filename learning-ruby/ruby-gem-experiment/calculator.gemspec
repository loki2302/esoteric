Gem::Specification.new do |s|
    s.name = 'calculator'
    s.version = '0.0.1'
    s.date = '2013-08-01'
    s.summary = 'Summary for calculator'
    s.description = <<-EOF
	Calculator is supercool calculator library.
	Use calculator. I mean it.
    EOF
    s.author = 'loki2302'
    s.email = 'loki2302@loki2302.me'
    s.homepage = 'http://loki2302.me'
    s.files = Dir['lib/*.rb']

    s.add_runtime_dependency 'json_pure', '~> 1.8.0'
end