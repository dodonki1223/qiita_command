# frozen_string_literal: true

require 'optparse'
require './spec/spec_helper'
require './qiita_commands/command_line'

module QiitaCommands
  describe CLI do
    describe '#initialise' do
      shared_examples 'system shutdown' do
        subject { described_class.new }

        include_context 'when set command line args'
        include_context 'when disable standard output'

        it { expect { subject }.to raise_error(SystemExit) }
      end

      context 'when not exitst command line args' do
        let(:argv) { %w[--hoge] }

        include_examples 'system shutdown'
      end

      context 'when multiple -d and -w and -m specified' do
        let(:argv) { %w[-w -m] }

        include_examples 'system shutdown'
      end

      context 'when multiple --daily and --weekly and --monthly specified' do
        let(:argv) { %w[--weekly --monthly] }

        include_examples 'system shutdown'
      end
    end

    describe '#has?' do
      let(:cli) { described_class.new }

      context 'when exists key name' do
        include_context 'when set command line args'
        let(:argv) { %w[] }

        it { expect(cli.has?(:target)).to eq(true) }
      end

      context 'when not exists key name' do
        include_context 'when set command line args'
        let(:argv) { %w[] }

        it { expect(cli.has?(:hoge)).to eq(false) }
      end
    end

    describe '#get' do
      let(:cli) { described_class.new }

      context 'when exists key name' do
        include_context 'when set command line args'
        let(:argv) { %w[] }

        it { expect(cli.get(:target)).to eq('daily') }
      end

      context 'when not exists key name' do
        include_context 'when set command line args'
        let(:argv) { %w[] }

        it { expect(cli.get(:hoge)).to eq('') }
      end
    end
  end
end
