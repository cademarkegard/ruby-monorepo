require 'spec_helper'
require 'hello_world/cli'
require 'hello_world/parser'

require 'forwardable'

module HelloWorld

  RSpec.describe CLI do
    let(:cli) { described_class.create(argv: argv) }

    describe '--help' do
      let(:argv) { %w(--help) }

      it 'should display help screen' do
        expect(Parser).to receive(:print_help)
        expect(cli).to receive(:response)
        cli.execute!
      end
    end

    describe 'en' do
      let(:argv) { %w(english) }

      it 'should show hello world in English' do
        expect(cli).to receive(:response).with('English — Hello World!')
        cli.execute!
      end
    end
  end
end
