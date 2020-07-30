# frozen_string_literal: true

RSpec.shared_context 'when disable standard output' do
  before do
    $stdout = StringIO.new
  end

  after do
    $stdout = STDOUT
  end
end
