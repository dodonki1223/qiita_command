# frozen_string_literal: true

require 'optparse'
require './spec/spec_helper'
require './qiita_commands/command_line/command_line'
require './spec/support/command_line_args_helper'
require './spec/support/cli_spec_behavior'

module QiitaCommands
  describe CLI do
    describe '#initialise' do
      shared_examples 'system shutdown' do
        include_context 'set command line args'
        include_context 'when disable standard output'

        subject { described_class.new }

        it 'システムが終了すること' do
          expect { subject }.to raise_error(SystemExit)
        end
      end

      context 'when not exitst command line args' do
        let(:argv) { %w[-hoge] }

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

    describe '#daily?' do
      include_context 'set command line args'

      subject { described_class.new.daily? }

      context 'when given default arg' do
        let(:argv) { %w[] }

        it { is_expected.to eq(true) }
      end

      context 'when given -d arg' do
        let(:argv) { %w[-d] }

        it { is_expected.to eq(true) }
      end

      context 'when given --daily arg' do
        let(:argv) { %w[--daily] }

        it { is_expected.to eq(true) }
      end

      context 'when given not daily arg' do
        let(:argv) { %w[-m] }

        it { is_expected.to eq(false) }
      end
    end

    describe '#weekly?' do
      include_context 'set command line args'

      subject { described_class.new.weekly? }

      context 'when given default arg' do
        let(:argv) { %w[] }

        it { is_expected.to eq(false) }
      end

      context 'when given -w arg' do
        let(:argv) { %w[-w] }

        it { is_expected.to eq(true) }
      end

      context 'when given --weekly arg' do
        let(:argv) { %w[--weekly] }

        it { is_expected.to eq(true) }
      end

      context 'when given not weekly arg' do
        let(:argv) { %w[-m] }

        it { is_expected.to eq(false) }
      end
    end

    describe '#monthly?' do
      include_context 'set command line args'

      subject { described_class.new.monthly? }

      context 'when given default arg' do
        let(:argv) { %w[] }

        it { is_expected.to eq(false) }
      end

      context 'when given -m arg' do
        let(:argv) { %w[-m] }

        it { is_expected.to eq(true) }
      end

      context 'when given --monthly arg' do
        let(:argv) { %w[--monthly] }

        it { is_expected.to eq(true) }
      end

      context 'when given not monthly arg' do
        let(:argv) { %w[-w] }

        it { is_expected.to eq(false) }
      end
    end

    describe '#has?' do
      context 'when exists key name' do
        include_context 'set command line args'
        let(:argv) { %w[] }

        subject { described_class.new.has?(:target) }

        it { is_expected.to eq(true) }
      end

      context 'when exists key name' do
        include_context 'set command line args'
        let(:argv) { %w[] }

        subject { described_class.new.has?(:hoge) }

        it { is_expected.to eq(false) }
      end
    end

    describe '#get' do
      context 'when exists key name' do
        include_context 'set command line args'
        let(:argv) { %w[] }

        subject { described_class.new.get(:target) }

        it { is_expected.to eq('daily') }
      end

      context 'when exists key name' do
        include_context 'set command line args'
        let(:argv) { %w[] }

        subject { described_class.new.get(:hoge) }

        it { is_expected.to eq('') }
      end
    end
  end
end
