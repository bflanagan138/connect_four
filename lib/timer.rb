require 'time'

class Timer
    attr_reader :time 
    attr_accessor :start, :stop

    def initialize
        @start = 0
        @stop = 0
    end

    def start_timer 
        @start = Time.now.to_i
    end

    def stop_timer
        @stop = Time.now.to_i
    end
    
    def elapsed_time
        @stop - @start 
    end
end