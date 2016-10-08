require 'spec_helper'

RSpec.describe MadMath::Stats do
  let(:instance) { described_class.new data }

  describe '#average' do
    subject { instance }

    shared_examples 'average' do |sample, expected|
      let(:data) { sample }

      context "given #{sample.inspect}" do
        it "returns #{expected.inspect}" do
          if expected.is_a?(Float)
            expect(subject.average).to be_a Float
            expect(subject.average).to be_within(0.001).of expected
          else
            expect(subject.average).to eq expected
          end
        end
      end
    end

    it_behaves_like 'average', [1, 1, 1], 1.0
    it_behaves_like 'average', [1, 2, 3], 2.0
    it_behaves_like 'average', [7, 1, 3], 3.666
  end

  describe '#sum' do
    subject { instance }

    shared_examples 'sum' do |sample, expected|
      let(:data) { sample }

      context "given #{sample.inspect}" do
        it "returns #{expected.inspect}" do
          expect(subject.sum).to eq expected
        end
      end
    end

    it_behaves_like 'sum', [1, 1, 1], 3
    it_behaves_like 'sum', [1, 2, 3], 6
    it_behaves_like 'sum', [7, 1, 3], 11
    it_behaves_like 'sum', [3.3, 1, 3], 7.3
  end

  shared_examples 'standard deviation' do |method, sample, expected|
    subject { instance }

    describe "#{method}" do
      context "given #{sample.inspect}" do
        let(:data) { sample }

        it "returns #{expected.inspect}" do
          expect(subject.send(method)).to be_a Float
          expect(subject.send(method)).to be_within(0.001).of expected
        end
      end
    end
  end

  it_behaves_like 'standard deviation', :stdev, [1, 1, 1], 0
  it_behaves_like 'standard deviation', :stdev, [9, 2, 5, 4, 12, 7], 3.619

  it_behaves_like 'standard deviation', :stdevp, [
    9, 2, 5, 4, 12, 7, 8, 11, 9, 3, 7, 4, 12, 5, 4, 10, 9, 6, 9, 4], 2.983

  describe '#sum_of_squares' do
    subject { instance }

    shared_examples 'sum of squares' do |sample, expected|
      let(:data) { sample }

      context "given #{sample.inspect}" do
        it "returns #{expected.inspect}" do
          expect(subject.sum_of_squares).to be_a Float
          expect(subject.sum_of_squares).to be_within(0.001).of expected
        end
      end
    end

    it_behaves_like 'sum of squares', [1, 1, 1], 0
    it_behaves_like 'sum of squares', [1, 2, 3], 2
    it_behaves_like 'sum of squares', [7, 1, 3], 18.666
  end
end
