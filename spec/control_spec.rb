require_relative '../app/instructions.rb'
require 'rspec'
require 'byebug'
require 'spec_helper'

module ToyRobot
  RSpec.describe Instructions do
    let(:ins) { Instructions.new }


    describe 'place the robot as the first move' do

      let(:data_file) { "spec/valid1.txt" }

      it 'is sent instructions' do
        # ins.parse_file(data_file)
        #
        # # expect(result).to eq(
        # #   {x: 0, y: 1, f: "NORTH" })
        # expect { block of shit}. to output("lbbahhhh").to_stdout
        # expect(STDOUT).to receive(:puts).with('0, 1, NORTH')
        # assert that the correct position is printed to stdout
      end

      it 'reports its first location'
      it 'only accepts a valid place first up'
    end
  end
end
