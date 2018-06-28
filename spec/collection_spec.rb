require 'spec_helper'

describe ActiveModelPresenter::Collection do
  subject { described_class.new([model, model2], ItemSerializer) }

  let(:model) { Item.new }
  let(:model2) { Item.new }

  it 'returns an array' do
    expect(subject[0].name).to eq('test')
    expect(subject[1].name).to eq('test')
  end
end