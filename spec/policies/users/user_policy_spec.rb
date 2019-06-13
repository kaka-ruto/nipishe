# frozen_string_literal: true

describe Users::UserPolicy do
  let(:policy) { described_class.new(user, user: user) }

  let(:user) { build_stubbed(:user) }

  describe "#show?" do
    subject { policy.apply(:show?) }

    context "when the user is the current user" do
      it { is_expected.to eq true }
    end
  end
end

