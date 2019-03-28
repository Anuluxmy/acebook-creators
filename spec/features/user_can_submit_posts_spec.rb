require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "Can submit posts and view them" do
    visit "/posts"
    fill_in_form("Hello world!")
    expect(page).to have_content("Hello world!")
  end

  scenario "Can see the newest post first" do
    visit "/posts"
    fill_in_form("Hello World")
    fill_in_form("Good morning")
    expect(page_content).to have_content("Good morning")
  end

  scenario "Can see the post with date and time" do
    post = Post.create(message: "Hello")
    time = post[:created_at].strftime("%B %d %Y, %l:%M%P")
    visit "/posts"
    expect(page_content).to have_content("#{time}")
  end
end
