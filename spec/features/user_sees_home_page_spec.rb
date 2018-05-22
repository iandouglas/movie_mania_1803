require 'rails_helper'

describe 'User' do
  it 'sees a nav bar' do
    visit root_path

    expect(page).to have_link(href: new_director_path)
    expect(page).to have_link(href: new_actor_path)
  end
end
