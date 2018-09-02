require 'spec_helper'

describe ActiveModelPresenter::Collection do
  subject { described_class.new([model, model2], ItemPresenter, {serializer: ItemSerializer}) }

  let(:model) { Item.new }
  let(:model2) { Item.new }

  it 'returns an array' do
    expect(subject[0].name).to eq('test')
    expect(subject[1].name).to eq('test')
  end

  describe 'pagination' do
    it 'methods are defined' do
      expect { subject.total_pages }.to_not raise_exception
      expect { subject.current_page }.to_not raise_exception
      expect { subject.limit_value }.to_not raise_exception
    end
  end
end