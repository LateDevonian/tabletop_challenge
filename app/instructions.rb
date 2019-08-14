# frozen_string_literal: true
require 'byebug'
require_relative './robotcontrol.rb'

module ToyRobot
  class Instructions


    def initialize(toyrobot: RobotController.new)
      @robot = toyrobot

    end


    # def instruct_robot(input)
    #   #open file and parse_file
    #   #work out current location
    #   #do and save teh moves
    #   #update location
    # end

    def parse_file(file)


        File.readlines(file).each do |line|
          command = parse_command(line)
        end
      # File.readlines(file).each do |line|
      #   command = parse_command(line)
      #   apply_command(command)
    end


    def parse_command(line)

      commands = line.split
      if %w[ PLACE MOVE LEFT RIGHT REPORT ].include?(commands.first)
        apply_command(commands)
      else
        false
     end
    end

    def apply_command(command)

      line = command.first
      case line
      when 'PLACE'
        raw_directions = command[1].split(",")
        directions = {
          x: raw_directions[0].to_i,
          y: raw_directions[1].to_i,
          f: raw_directions[2]
        }
        directions = @robot.place(directions)
      when  'MOVE'
        @robot.robot_move
      when 'LEFT'
        @robot.turn_robot('LEFT')
      when 'RIGHT'
        @robot.turn_robot('RIGHT')
      when 'REPORT'
        puts @robot.report_location
      else
        false
      end
    end
  end
end
