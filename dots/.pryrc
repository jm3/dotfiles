def c(input)
  klass = case input
          when String, Symbol
            input.to_s.split('::').inject(Object) { |mod, name| mod.const_get(name) }
          else
            input
          end

  colors = {
    public: "\e[32m",
    reset: "\e[0m"
  }

  methods = klass.singleton_methods(false)

  puts "\nDefined class methods for #{klass}:"
  if methods.empty?
    puts '(none)'
  else
    puts "\nPublic methods:"
    methods.sort.each do |m|
      puts "  - #{colors[:public]}#{m}#{colors[:reset]}"
    end
  end

  nil
rescue NameError => e
  puts "\e[31mError:\e[0m #{e.message}"
end
