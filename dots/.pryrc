def c(input)
  # Resolve class/module from String or Symbol
  klass = case input
          when String, Symbol
            input.to_s.split('::').inject(Object) { |mod, name| mod.const_get(name) }
          else
            input
          end

  colors = {
    public: "\e[32m", # green
    protected: "\e[33m", # yellow
    private: "\e[31m", # red
    reset: "\e[0m"
  }

  puts "\nDefined class methods for #{klass}:"

  {
    public: klass.public_methods(false),
    protected: klass.protected_methods(false),
    private: klass.private_methods(false)
  }.each do |visibility, methods|
    next if methods.empty?

    puts "\n#{visibility.capitalize} methods:"
    methods.sort.each do |method_name|
      color = colors[visibility]
      puts "  - #{color}#{method_name}#{colors[:reset]}"
    end
  end

  nil
rescue NameError => e
  puts "\e[31mError:\e[0m #{e.message}"
end
