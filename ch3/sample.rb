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

    def st1_proc(evt, param)
        case evt
        when :ev2
            act2(evt, param)
            puts "    gd2: #{gd2?}"
            if gd2?
                @state = :ST2
            else
                act3(evt, param)
                @state = :ST0
            end
        when :ev3
            act3(evt, param)
            @state = :ST0
        end
    end

    private

    def act1(evt, prm)
        puts "    act1: event:#{evt}, param: #{prm}"
    end

    def act2(evt, prm)
        puts "    act2: event:#{evt}, param: #{prm}"
    end

    def act3(evt, prm)
        puts "    act3: event:#{evt}, param: #{prm}"
    end

    def gd1?
        @attr_a && @attr_b
    end

    def gd2?
        !@attr_a || @attr_b
    end
end
