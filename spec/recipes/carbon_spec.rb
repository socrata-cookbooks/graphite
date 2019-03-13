require 'spec_helper'

describe 'socrata-graphite-fork::carbon' do
  let(:chef_run) do
    ChefSpec::Runner.new { |node| node.automatic["platform_family"] = 'debian' }
      .converge(described_recipe)
  end

  %w{python python::pip}.each do |r|
    it "includes the external #{r} recipe" do
      expect(chef_run).to include_recipe("#{r}")
    end
  end

  %w{_user _carbon_packages _directories _carbon_config}.each do |g|
    it "includes the internal socrata-graphite-fork::#{g} recipe" do
      expect(chef_run).to include_recipe("socrata-graphite-fork::#{g}")
    end
  end

end
