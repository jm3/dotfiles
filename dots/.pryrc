def c(klass)
  methods = {
    public:   klass.public_methods(false),
    protected: klass.protected_methods(false),
    private:  klass.private_methods(false)
  }

  puts "\nDefined class methods for #{klass}:"
  methods.each do |visibility, list|
    next if list.empty?
    puts "\n#{visibility.capitalize} methods:"
    list.sort.each { |m| puts "  - #{m}" }
  end
  nil
end
