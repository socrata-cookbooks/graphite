require 'spec_helper'

describe 'socrata-graphite-web::carbon' do
  let(:chef_run) { ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '16.04').converge(described_recipe) }

  it 'installs python runtime' do
    expect(chef_run).to install_python_runtime('carbons_python')
  end
end
