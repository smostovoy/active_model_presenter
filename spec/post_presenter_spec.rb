require 'spec_helper'

describe PostPresenter do
  subject { described_class.show(Post.new) }

  it 'allows to call attributes as methods' do
    expect(subject.name).to eq('test')
  end

  it 'allows to call custom attributes as methods' do
    expect(subject.bar).to eq('bar value')
  end

  it 'raises exception when attribute does not exist' do
    expect { subject.foo }.to raise_exception(NoMethodError)
  end

  context 'when method contains nested elements' do
    subject { described_class.list([Post.new, Post.new]) }

    it 'returns an object with nested attributes' do
      subject.each do |post|
        expect(post.name).to eq('test')
        comment = post.comments.first
        expect(comment.message).to eq('test')
      end
    end
  end

  describe '#inspect' do
    subject { described_class.show(Post.new).inspect }

    it { is_expected.to start_with('#<PostPresenter') }
  end

  describe '#to_h' do
    it 'coverts to a hash' do
      expect(subject.to_h.class).to be Hash
      expect(subject.to_h[:name]).to eq('test')
    end
  end

  describe '#is_a?' do
    subject { described_class.show(Post.new).method(:is_a?) }

    it do
      expect(subject.(PostPresenter)).to be true
      expect(subject.(ActiveModelPresenter::Base)).to be true
      expect(subject.(Hash)).to be false
    end
  end
end