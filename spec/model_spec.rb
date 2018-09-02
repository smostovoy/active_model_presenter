require 'spec_helper'

describe ActiveModelPresenter::Model do
  subject { described_class.new(Item.new) }

  it 'allows to call attributes as methods' do
    expect(subject.name).to eq('test')
  end

  it 'allows to call custom attributes as methods' do
    expect(subject.bar).to eq('bar value')
  end

  it 'raises exception when attribute does not exist' do
    expect { subject.foo }.to raise_exception(NoMethodError)
  end

  it 'allows to call attributes as hash attributes' do
    expect(subject.to_h[:name]).to eq('test')
  end

  describe '#inspect' do
    subject { described_class.new(Item.new).inspect }

    it { is_expected.to start_with('#<ActiveModelPresenter::Model') }
  end

  describe '#attributes' do
    subject { described_class.new(Item.new).attributes }

    it { is_expected.to eq([:name, :bar]) }

    context 'when fields are filtered' do
      subject { described_class.new(Item.new, {fields: [:bar]}).attributes }

      it { is_expected.to eq([:bar]) }
    end
  end
end