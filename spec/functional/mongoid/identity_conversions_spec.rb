require "spec_helper"

describe Mongoid::Identity do

  before do
    Person.delete_all
  end

  context "when identity type is a String" do

    context "and setting id as a String" do
      before do
        Person.delete_all
        Person.identity(:type => String)
        Person.create!(:id => "2")
      end

      #let(:person) do
      #  Person.find.first
      #end

      it "it is still a string" do
        Person.first.id.should == "2"
      end
    end

    context "and setting id as an Integer" do
      before do
        Person.delete_all
        Person.identity(:type => String)
        Person.create!(:id => 3)
      end

      it "it is still a string" do
        Person.first.id.should == "3"
      end
    end

  end

  context "when identity type is an Integer" do

    context "and setting id as a String" do
      before do
        Person.delete_all
        Person.identity(:type => Integer)
        Person.create!(:id => "2")
      end

      it "it is still an integer" do
        Person.first.id.should == 2
      end
    end

    context "and setting id as an Integer" do
      before do
        Person.delete_all
        Person.identity(:type => Integer)
        Person.create!(:id => 3)
      end

      it "gives back an integer" do
        Person.first.id.should == 3
      end
    end

  end

end
