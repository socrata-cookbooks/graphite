require 'spec_helper'

describe 'socrata-graphite-web::carbon' do
  let(:chef_run) { ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '16.04').converge(described_recipe) }

  %w(_user _carbon_packages _directories _carbon_config).each do |g|
    it "includes the internal graphite::#{g} recipe" do
      expect(chef_run).to include_recipe("graphite::#{g}")
    end
  end
end
