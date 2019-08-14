# frozen_string_literal: true

require_relative '../app/robotcontrol.rb'
require 'rspec'
require 'byebug'
require 'spec_helper'

module ToyRobot
  RSpec.describe RobotController do
    let(:rr) { RobotController.new }

    describe 'robot reports location' do
      it 'reports the current location' do
        rr.place(x: 1, y: 1, f: 'NORTH')
        result = rr.report_location
      end

      it 'reports the current location' do
        rr.place(x: 4, y: 3, f: 'EAST')
        result = rr.report_location
        expect(result).to eq('4, 3, EAST')
      end

      it 'reports an error when the robot is not on the board' do
        rr.place(x:10 , y: 3, f: 'EAST')
        result = rr.report_location
        expect(result).to eq(false)
      end
    end
  end
end
