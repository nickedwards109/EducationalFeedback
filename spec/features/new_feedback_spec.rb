require 'rails_helper'

RSpec.describe 'Creating a new Feedback record' do
  it 'allows a user to fill out a form for providing feedback' do

    # This creates a tutorial as test data.
    # The name and slug would already be set by FactoryBot by default,
    # but they are explicitly set here to avoid tight coupling between the
    # tests and an external FactoryBot configuration file.
    tutorial = create(:tutorial, name: 'Hello World', slug: 'hello-world')

    expect(tutorial.feedbacks.count).to eq(0)

    visit '/tutorials/hello-world/feedbacks/new'
    expect(page).to have_content('Hello World')
    fill_in 'feedback[content]', with: 'The tutorial was fabulous.'
    click_on 'Send Feedback'

    expect(page).to have_current_path('/tutorials/hello-world/feedbacks')
    expect(page).to have_content('Hello World')
    expect(page).to have_content('The tutorial was fabulous.')
    expect(tutorial.feedbacks.count).to eq(1)
  end
end
