require 'spec_helper'

describe 'consul' do
  context 'supported operating systems' do
    ['Debian', 'RedHat'].each do |osfamily|
      describe "consul class without any parameters on #{osfamily}" do
        let(:params) {{ }}
        let(:facts) {{
          :osfamily => osfamily,
        }}

        it { should compile.with_all_deps }

        it { should contain_class('consul::params') }
        it { should contain_class('consul::install').that_comes_before('consul::config') }
        it { should contain_class('consul::config') }
        it { should contain_class('consul::service').that_subscribes_to('consul::config') }

        it { should contain_service('consul') }
        it { should contain_package('consul').with_ensure('present') }
      end
    end
  end

  context 'unsupported operating system' do
    describe 'consul class without any parameters on Solaris/Nexenta' do
      let(:facts) {{
        :osfamily        => 'Solaris',
        :operatingsystem => 'Nexenta',
      }}

      it { expect { should contain_package('consul') }.to raise_error(Puppet::Error, /Nexenta not supported/) }
    end
  end
end
