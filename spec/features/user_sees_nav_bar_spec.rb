require 'rails_helper'

describe 'User' do
  it 'sees a nav bar' do
    visit root_path

    expect(page).to have_link(href: root_path)
    expect(page).to have_link(href: directors_path)
    expect(page).to have_link(href: actors_path)
    expect(page).to have_link(href: movies_path)
  end
end
