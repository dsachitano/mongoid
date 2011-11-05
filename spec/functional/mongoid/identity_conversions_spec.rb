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
      end

      let(:person) do
        Person.create!(:id => "2")
      end

      it "it is still a string" do
        person.id.should == "2"
      end
    end

    context "and setting id as an Integer" do
      before do
        Person.delete_all
        Person.identity(:type => String)
      end

      let(:person) do
        Person.create!(:id => 3)
      end

      it "it is still a string" do
        person.id.should == "3"
      end
    end

  end

  context "when identity type is an Integer" do

    context "and setting id as a String" do
      before do
        Person.delete_all
        Person.identity(:type => Integer)
      end

      let(:person) do
        Person.create!(:id => "2")
      end

      it "it is still an integer" do
        person.id.should == 2
      end
    end

    context "and setting id as an Integer" do
      before do
        Person.delete_all
        Person.identity(:type => Integer)
      end

      let(:person) do
        Person.create!(:id => 3)
      end

      it "gives back a string" do
        person.id.should == 3
      end
    end

  end

end
