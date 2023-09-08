# frozen_string_literal: true

require 'securerandom'

# Frameは1つのフレーム分のピン数やボーナスを記録する
class Frame
    attr_reader :frame_no
    attr_accessor :first, :second, :spare_bonus, :strike_bonus, :total, :state

    def initialize(frame_no)
        @frame_no = frame_no
        @first = 0
        @second = 0
        @spare_bonus = 0
        @total = 0
        @state = :RESERVED
    end

    def action(event, pins=0)
        case @state
        when :RESERVED
            case event
            when :SETUP
                @state = :BEFORE_1ST
            else
                puts "invalid event: #{event} is ignored."
            end
        when :BEFORE_1ST
            before_1st_proc(event, pins)
        when :BEFORE_2ND
            before_2nd_proc(event, pins)
        when :PENDING
            case event
            when :DETERMINE
                @state = :FIXED
            end
        when :FIXED
            puts 'fixed.'
        end
    end
end


