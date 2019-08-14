# frozen_string_literal: true

require_relative '../app/robotcontrol.rb'
require 'rspec'
require 'byebug'
require 'spec_helper'

module ToyRobot
  RSpec.describe RobotController do
    let(:rs) { RobotController.new }

    def set_direction(x, y, f)
      { x: x, y: y, f: f }
    end

    context 'place robot on table in a valid way' do
      describe 'Place commands put robots in position' do
        it 'sets robot to start position' do
          set_place = set_direction(0, 0, 'NORTH')
          result = rs.place(set_place)
          expect(result).to eq(x: 0, y: 0, f: 'NORTH')
        end

        it 'places the robot to any position' do
          set_place = set_direction(4, 1, 'EAST')
          result = rs.place(set_place)
          expect(result).to eq(x: 4, y: 1, f: 'EAST')
        end

        it 'checks range of x' do
          set_place = set_direction(5, 0, 'SOUTH')
          result = rs.place(set_place)
          expect(result).to eq(false)
        end

        it 'checks range of x' do
          set_place = set_direction(-1, 0, 'SOUTH')
          result = rs.place(set_place)
          expect(result).to eq(false)
        end

        it 'checks range of y' do
          set_place = set_direction(3, 8, 'SOUTH')
          result = rs.place(set_place)
          expect(result).to eq(false)
        end

        it 'checks range of y' do
          set_place = set_direction(3, -9, 'SOUTH')
          result = rs.place(set_place)
          expect(result).to eq(false)
        end
      end

      describe 'it only accepts a valid direction' do
        it 'checks value of direction' do
          set_place = set_direction(4, 4, 'WEST')
          result = rs.place(set_place)
          expect(result).to eq(x: 4, y: 4, f: 'WEST')
        end

        it 'checks value of direction' do
          set_place = set_direction(4, 4, 'x')
          result = rs.place(set_place)
          expect(result).to eq(false)
        end
      end
    end
  end
end
