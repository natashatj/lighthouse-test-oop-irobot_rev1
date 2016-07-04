require_relative 'spec_helper'  

describe '#heal!' do

    before :each do
      @robot = Robot.new
    end

    it 'raises an ArgumentError if robot health is less than or equal to zero' do
      #stubbing
      expect(@robot).to receive(:health).at_least(:once).with(0)
      expect {@robot.heal!}.to raise_error
    end

    
end

#describe '#attack!' do
