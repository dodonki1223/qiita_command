# frozen_string_literal: true

RSpec.shared_context 'when set command line args' do
  before { stub_const('ARGV', argv) }
end
