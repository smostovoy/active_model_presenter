require 'spec_helper'

describe ItemPresenter do
  subject { described_class.show(Item.new) }

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
    subject { described_class.show(Item.new).inspect }

    it { is_expected.to start_with('#<ItemPresenter') }
  end

  describe '#is_a?' do
    subject { described_class.show(Item.new).method(:is_a?) }

    it do
      expect(subject.(ItemPresenter)).to be true
      expect(subject.(ActiveModelPresenter::Model)).to be true
      expect(subject.(Hash)).to be false
    end
  end
end