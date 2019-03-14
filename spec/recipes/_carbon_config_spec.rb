require 'spec_helper'

describe 'socrata-graphite-fork::_carbon_config' do
  let(:chef_run) { ChefSpec::Runner.new.converge(described_recipe) }
  let(:file_resource) { chef_run.find_resource(:file, "carbon.conf") }

  context "for the file resource" do

    it "has the path specified" do
      expect(file_resource.path).to eq('/opt/graphite/conf/carbon.conf')
    end

    it "has the correct owner" do
      expect(file_resource.owner).to eq('graphite')
    end

    it "has the correct group" do
      expect(file_resource.group).to eq('graphite')
    end

    it "has correct mode" do
      expect(file_resource.mode).to eq(0644)
    end

    it "has action :nothing" do
      expect(file_resource.performed_actions).to be_empty
    end

  end

  it "to create the socrata_graphite_fork_carbon_conf_accumulator resource" do
    expect(chef_run).to create_socrata_graphite_fork_carbon_conf_accumulator("default")
  end

end
