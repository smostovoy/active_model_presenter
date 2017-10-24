require 'rails_helper'

describe PostsController, :type => :controller do
  context '#show' do
    let!(:post) { Post.create(title: 'sfd') }
    let(:params) do
      {
        id: post.id
      }
    end

    subject { get(:show, params) }

    before { }

    describe 'when all parameters are valid' do
      it 'returns success' do
        subject
        expect(response).to be_success
      end
    end
  end
end
