# frozen_string_literal: true

require_relative '../app/robotcontrol.rb'
require 'rspec'
require 'byebug'
require 'spec_helper'

module ToyRobot
  RSpec.describe RobotController do
    let(:rm) { RobotController.new }

    describe 'robot turns left' do
      let(:new_direction) { 'LEFT' }

      it 'makes one turn to the left from n' do
        rm.place(x: 1, y: 1, f: 'NORTH')
        result = rm.turn_robot(new_direction)
        expect(result).to eq(x: 1, y: 1, f: 'WEST')
      end

      it 'makes one turn to the left from e' do
        rm.place(x: 1, y: 1, f: 'EAST')
        result = rm.turn_robot(new_direction)
        expect(result).to eq(x: 1, y: 1, f: 'NORTH')
      end

      it 'makes one turn to the left from s' do
        rm.place(x: 1, y: 1, f: 'SOUTH')
        result = rm.turn_robot( new_direction)
        expect(result).to eq(x: 1, y: 1, f: 'EAST')
      end

      it 'makes one turn to the left from w' do
        rm.place(x: 1, y: 1, f: 'WEST')
        result = rm.turn_robot(new_direction)
        expect(result).to eq(x: 1, y: 1, f: 'SOUTH')
      end
    end

    describe 'robot turns right' do
      let(:new_direction) { 'RIGHT' }
      it 'makes one turn to the right from n' do
        rm.place( x: 1, y: 1, f: 'NORTH')
        result = rm.turn_robot(new_direction)
        expect(result).to eq(x: 1, y: 1, f: 'EAST')
      end

      it 'makes one turn to the right from e' do
        rm.place( x: 1, y: 1, f: 'EAST' )
        result = rm.turn_robot(new_direction)
        expect(result).to eq(x: 1, y: 1, f: 'SOUTH')
      end

      it 'makes one turn to the right from s' do
        rm.place(x: 1, y: 1, f: 'SOUTH')
        result = rm.turn_robot(new_direction)
        expect(result).to eq(x: 1, y: 1, f: 'WEST')
      end

      it 'makes one turn to the right from w' do
        rm.place(x: 1, y: 1, f: 'WEST')
        result = rm.turn_robot(new_direction)
        expect(result).to eq(x: 1, y: 1, f: 'NORTH')
      end
    end
  end
end
