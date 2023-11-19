# frozen_string_literal: true

require "rspec"
require "tick_tack_toe"

::RSpec.describe ::TickTackToe do
  describe ".sign2mark" do
    let(:call) { described_class.sign2mark(sign) }

    shared_examples "sign to mark conversion" do |sign_param, mark, name|
      context "with #{name} sign (`#{sign_param}`)" do
        let(:sign) { sign_param }

        it "returns #{name} cell mark (`#{mark}`)" do
          expect(call).to eq(mark)
        end
      end # with #{name} sign (`#{sign_param}`)
    end # sign to mark conversion

    it_behaves_like \
      "sign to mark conversion",
      ::TickTackToe::EMPTY_SIGN,
      ::TickTackToe::EMPTY_BOARD_CELL_MARK,
      "empty"

    it_behaves_like \
      "sign to mark conversion",
      ::TickTackToe::CROSS_SIGN,
      ::TickTackToe::CROSS_BOARD_CELL_MARK,
      "cross"

    it_behaves_like \
      "sign to mark conversion",
      ::TickTackToe::ZERO_SIGN,
      ::TickTackToe::ZERO_BOARD_CELL_MARK,
      "zero"
  end # .sign2mark

  describe ".mark2sign" do
    let(:call) { described_class.mark2sign(mark) }

    shared_examples "mark to sign conversion" do |mark_param, sign, name|
      context "with #{name} mark (`#{mark_param}`)" do
        let(:mark) { mark_param }

        it "returns #{name} sign (`#{sign}`)" do
          expect(call).to eq(sign)
        end
      end # with #{name} mark (`#{mark_param}`)
    end # mark to sign conversion

    it_behaves_like \
      "mark to sign conversion",
      ::TickTackToe::EMPTY_BOARD_CELL_MARK,
      ::TickTackToe::EMPTY_SIGN,
      "empty"

    it_behaves_like \
      "mark to sign conversion",
      ::TickTackToe::CROSS_BOARD_CELL_MARK,
      ::TickTackToe::CROSS_SIGN,
      "cross"

    it_behaves_like \
      "mark to sign conversion",
      ::TickTackToe::ZERO_BOARD_CELL_MARK,
      ::TickTackToe::ZERO_SIGN,
      "zero"
  end # .mark2sign
end # ::TickTackToe
