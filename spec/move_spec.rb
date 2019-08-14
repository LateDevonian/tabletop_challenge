# frozen_string_literal: true

require_relative '../app/robotcontrol.rb'
require 'rspec'
require 'byebug'
require 'spec_helper'

module ToyRobot
  RSpec.describe RobotController do
    let(:rm) { RobotController.new }

    context 'robot moves one unit in a valid direction' do

      before do
        def set_pos(position)
          rm.initialize(position)
        end
      end

      describe 'robot makes a valid move in facing direction' do
        it 'moves north one unit +1y' do
          rm.place(x: 1, y: 1, f: 'NORTH')
          result = rm.robot_move
          expect(result).to eq(x: 1, y: 2, f: 'NORTH')
        end

        it 'moves south one unit -1y' do
          rm.place(x: 1, y: 1, f: 'SOUTH')
          result = rm.robot_move
          expect(result).to eq(x: 1, y: 0, f: 'SOUTH')
        end

        it 'moves east one unit +1x' do
          rm.place(x: 1, y: 1, f: 'EAST')
          result = rm.robot_move
          expect(result).to eq(x: 2, y: 1, f: 'EAST')
        end

        it 'moves west one unit -1x' do
          rm.place(x: 1, y: 1, f: 'WEST')
          result = rm.robot_move
          expect(result).to eq(x: 0, y: 1, f: 'WEST')
        end
      end

      describe 'robot does not move when invalid' do
        it 'does not move north one unit +1y when on max' do
          rm.place(x: 0, y: 4, f: 'NORTH')
          result = rm.robot_move
          expect(result).to eq(false)
        end

        it 'does not move south one unit -1y when on min' do
          rm.place(x: 0, y: 0, f: 'SOUTH')
          result = rm.robot_move
          expect(result).to eq(false)
        end

        it 'does not move east one unit +1x when on max' do
          rm.place(x: 4, y: 0, f: 'EAST')
          result = rm.robot_move
          expect(result).to eq(false)
        end

        it 'does not move east one unit -1x when on max' do
          rm.place(x: 0, y: 0, f: 'WEST')
          result = rm.robot_move
          expect(result).to eq(false)
        end
      end
    end
  end
end
