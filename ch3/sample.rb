class Sample
    def initialize
        @state = :ST0
        @attr_a = true
        @attr_b = true
    end

    def play(evt, param)
        puts "#{@state} ->"
        puts "  event:#{evt}, param: #{param}"
        case @state
        when :ST0
            st0_proc(evt, param)
        when :ST1
            st1_proc(evt, param)
        when :ST2
            # none
        end
        puts "          -> #{@state}"
        puts 'finished.' if @state == :ST2
    end
end
