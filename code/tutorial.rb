class Greeter

    attr_accessor :names

    def initialize(names = "World")
        @names = names
    end

    def say_hi
        if @names.nil?
            puts "No one to greet"
        elsif @names.respond_to?(:each)
            @names.each do |name|
                puts "Hello, #{name}!"
            end
        else
            puts "Hello, #{@names}!"
        end
    end

    def say_bye
        if @names.nil?
            puts "No one to say bye to..."
        elsif @names.respond_to?(:join)
            puts "Bye, #{@names.join(", ")}!"
        else
            puts "Bye, #{@names}!"
        end
    end

end

if __FILE__ == $0
    greeter = Greeter.new
    greeter.say_hi
    greeter.say_bye

    puts ''

    greeter.names = "Sid"
    greeter.say_hi
    greeter.say_bye

    puts ''

    greeter.names = ["Sid", "Ritu", "Omi"]
    greeter.say_hi
    greeter.say_bye

    puts ''

    greeter.names = nil
    greeter.say_hi
    greeter.say_bye
end