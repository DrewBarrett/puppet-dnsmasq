require 'spec_helper'

describe 'dnsmasq' do
    let(:title) { 'dnsmasq' }
    let(:params) { {'domains' => ['alice.com']} }
    it { is_expected.to contain_package('dnsmasq').with(ensure: 'present') }
    #it { is_expected.to contain_service('dnsmasq').with(
    #    :ensure => 'running',
    #    :enabled => true,
    #)}
    it do
        is_expected.to contain_file('/etc/dnsmasq.conf').with_content(/.*address=\/alice.com\/1.2.3.4.*/)
    end
end