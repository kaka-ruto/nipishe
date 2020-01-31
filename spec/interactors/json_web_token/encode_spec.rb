# frozen_string_literal: true

require "rails_helper"

RSpec.describe JsonWebToken::Encode, type: :interactor do
  describe ".call" do
    it "provides the token" do
      user = build_stubbed(:user)

      result = described_class.call(payload: user.id)

      expect(result.token).not_to be_nil
    end
  end
end
