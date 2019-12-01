# frozen_string_literal: true

require 'spec_helper'
require 'hello_world/cli'
require 'hello_world/parser'
require 'forwardable'

RSpec.describe 'rake task spec' do
  subject(:result) { `bundle exec rake speak[#{lang}]`.chomp.gsub(/(\e\[\d+m)/, '') }
  describe 'english' do
    let(:lang) { 'en' }
    it { is_expected.to eq 'English — Hello World!' }
  end
  describe 'russian' do
    let(:lang) { 'russian' }
    it { is_expected.to eq 'Russian — Привет мир!' }
  end
end
