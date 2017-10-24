require "rails_helper"

RSpec.describe "posts/show", type: :view do
  it "displays all fields" do
    assign(:post, Post.create!(:title => "slicer"))

    render

    expect(rendered).to match /slicer/
  end
end