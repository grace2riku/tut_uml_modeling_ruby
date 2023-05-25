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

    def gd1?
        @attr_a && @attr_b
    end

    def gd2?
        !@attr_a || @attr_b
    end

    def st0_proc(evt, param)
        case evt
        when :ev1
            if gd1?
                puts "  gd1: #{gd1?}"
                act1(evt, param)
                @state = :ST1
            else
                puts "  gd1: #{gd1?}, transition is ignored. >>>"
            end
        when :ev3
            act3(evt, param)
            @state = :ST2
        end
    end

end
