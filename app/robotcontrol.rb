# frozen_string_literal: true

module ToyRobot
  class RobotController

    attr_accessor :x, :y, :f, :current_position

    def initialize(x = nil, y = nil, f = nil)
      #when place is run, update position to set it
      #whenever everything runs and works it upsdates it do
          #instance variable will know hwere it is and store it and everything can access
          #make it private to the robot
      @x = x
      @y = y
      @f = f
      @current_position = { x: x, y: y, f: f }
    end

    def report_location
      if @current_position == { x: nil, y: nil, f: nil }
        false
      else
        "#{@current_position[:x]}, #{@current_position[:y]}, #{@current_position[:f]}"
      end
    end

    def place(directions)
      x = directions[:x]
      y = directions[:y]
      f = directions[:f]

      if directions == @current_postion
        @current_position
      else
        if validate_grid?(x, y) && validate_direction?(f)
          @current_position = directions
        else
          false
        end
      end
    end

    def validate_grid?(x, y)
      allowable = (0..4)
      allowable.include?(x) && allowable.include?(y)
    end

    def validate_direction?(f)
      allowable = %w[NORTH SOUTH EAST WEST]
      allowable.include?(f)
    end


    def robot_move
      x = @current_position[:x]
      y = @current_position[:y]
      f = @current_position[:f]

      if f == 'NORTH'
        y += 1
        @current_position[:y] = y
      elsif f == 'SOUTH'
        y -= 1
        @current_position[:y] = y
      elsif f == 'EAST'
        x += 1
        @current_position[:x] = x
      elsif f == 'WEST'
        x -= 1
        @current_position[:x] = x
      else
        false
      end

      if validate_grid?(x, y)
        @current_position
      else
        false
      end
    end

    def turn_robot(new_direction)
      f = @current_position[:f]
      if new_direction == 'LEFT'
        if f == 'NORTH'
          @current_position[:f] = 'WEST'
        elsif f == 'WEST'
          @current_position[:f] = 'SOUTH'
        elsif f == 'SOUTH'
          @current_position[:f] = 'EAST'
        elsif f == 'EAST'
          @current_position[:f] = 'NORTH'
        else
          false
        end
        @current_position
      else
        if f == 'NORTH'
          @current_position[:f] = 'EAST'
        elsif f == 'WEST'
          @current_position[:f] = 'NORTH'
        elsif f == 'SOUTH'
          @current_position[:f] = 'WEST'
        elsif f == 'EAST'
          @current_position[:f] = 'SOUTH'
        else
          false
        end
        @current_position
      end
    end
  end
end
