require 'byebug'
require_relative './instructions.rb'

my_robot = ToyRobot::Instructions.new

my_robot.parse_file('../spec/valid1.txt')
