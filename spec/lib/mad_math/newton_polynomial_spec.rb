require 'spec_helper'

RSpec.describe MadMath::NewtonPolynomial do
  describe '#value_for' do
    shared_examples 'predictive value' do |value, expected, data|
      subject { described_class.new data }

      context "given data: #{data.inspect}" do
        context "given value #{value.inspect}" do
          it "returns #{expected.inspect}" do
            expect(subject.value_for(value)).to eq expected
          end
        end
      end
    end

    # y = x
    it_behaves_like 'predictive value', 4, 4, [[0, 0], [1, 1], [2, 2]]
    it_behaves_like 'predictive value', 4, 4, [[0, 0], [1, 1], [8, 8]]
    it_behaves_like 'predictive value', 1000, 1000, [[0, 0], [1, 1], [8, 8]]

    # y = x^3 + x + 3
    it_behaves_like 'predictive value', 4, 4 ** 3 + 7,
      [[0, 3], [1, 5], [2, 13], [3, 33]]
    it_behaves_like 'predictive value', 5, 5 ** 3 + 8,
      [[0, 3], [1, 5], [2, 13], [3, 33]]

    # y = tan(x)
    #it_behaves_like 'predictive value', 1.5, 14.1014, [
    #  [-1.5, -14.1014],
    #  [-0.75, -0.931596],
    #  [0, 0],
    #  [0.75, 0.931596],
    #  [1.5, 14.1014]
    #]
  end
end
