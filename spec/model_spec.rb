require 'spec_helper'

describe ActiveModelPresenter::Base do
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

    it { is_expected.to start_with('#<ActiveModelPresenter::Base') }
  end

  describe '#attributes' do
    subject { described_class.new(Item.new).attributes }

    it { is_expected.to eq([:name, :bar]) }

    context 'when fields are filtered' do
      subject { described_class.new(Item.new, {fields: [:bar]}).attributes }

      it { is_expected.to eq([:bar]) }
    end
  end

  describe '.present' do
    context 'when items are multiple' do
      subject { described_class.present([Item.new, Item.new]) }

      it 'returns a collection' do
        expect(subject.class).to eq(ActiveModelPresenter::Collection)
        expect(subject.first.class).to eq(ActiveModelPresenter::Base)
      end
    end
  end
end