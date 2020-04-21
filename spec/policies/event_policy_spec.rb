require 'rails_helper'

RSpec.describe EventPolicy do
  subject { described_class }

  context 'whith anonymous user' do
    let(:event) { FactoryBot.build_stubbed(:event) }

    permissions :show? do
      it { is_expected.to permit(nil, event) }
    end

    permissions :create?, :update?, :edit?, :destroy? do
      it { is_expected.not_to permit(nil, event) }
    end
  end

  context 'whith athorized user' do
    let(:user) { FactoryBot.build_stubbed(:user) }
    let(:event) { FactoryBot.build_stubbed(:event) }

    permissions :show?, :create? do
      it { is_expected.to permit(user, event) }
    end

    permissions :update?, :edit?, :destroy? do
      it { is_expected.not_to permit(nil, event) }
    end
  end

  context 'when user is owner of event' do
    let(:user) { FactoryBot.build_stubbed(:user) }
    let(:event) { FactoryBot.build_stubbed(:event, user: user) }

    permissions :show?, :create?, :update?, :edit?, :destroy? do
      it { is_expected.to permit(user, event) }
    end
  end
end
