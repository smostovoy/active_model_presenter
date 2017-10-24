require 'rails_helper'

describe PostsController, :type => :controller do
  render_views

  context '#show' do
    let!(:post) { Post.create(title: 'test title') }
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
        expect(response.body).to include('test title')
      end
    end
  end
end
