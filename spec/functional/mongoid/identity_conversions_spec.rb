require "spec_helper"

describe Mongoid::Identity do

  before do
    Motherboard.delete_all
    Ram.delete_all
  end

  context "when identity type is a String" do

    context "and setting id as a String" do
      before do
        Motherboard.delete_all
        Ram.delete_all
        Motherboard.identity(:type => String)
        Motherboard.create!(:id => 1)
        Ram.create!(:motherboard_id => "1")
      end

      #let(:person) do
      #  Person.find.first
      #end

      it "it is still a string" do
        Ram.first.motherboard.id.should == "1"
      end
    end

    context "and setting id as an Integer" do
      before do
        Motherboard.delete_all
        Ram.delete_all
        Motherboard.identity(:type => String)
        Motherboard.create!(:id => 1)
        Ram.create!(:motherboard_id => 1)
      end

      it "it is still a string" do
        Ram.first.motherboard.id.should == "1"
      end
    end

  end

  context "when identity type is an Integer" do

    context "and setting id as a String" do
      before do
        Motherboard.delete_all
        Ram.delete_all
        Motherboard.identity(:type => Integer)
        Motherboard.create!(:id => 1)
        Ram.create!(:motherboard_id => "1")
      end

      it "it is still an integer" do
        Ram.first.motherboard.id.should == 1
      end
    end

    context "and setting id as an Integer" do
      before do
        Motherboard.delete_all
        Ram.delete_all
        Motherboard.identity(:type => Integer)
        Motherboard.create!(:id => 1)
        Ram.create!(:motherboard_id => 1)
      end

      it "gives back an integer" do
        Ram.first.motherboard.id.should == 1
      end
    end

  end

end
