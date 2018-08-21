require 'rails_helper'

RSpec.describe Tutorial, type: :model do
  it 'has a name, as well as a slug to be used instead of the primary key in the URL' do
    tutorial = Tutorial.create(
      name: 'Hello World',
      slug: 'hello-world'
    )

    expect(tutorial).to be_valid
    expect(tutorial.name).to eq('Hello World')
    expect(tutorial.slug).to eq('hello-world')
  end

  it 'validates for the presence of the name and slug attributes' do
    no_name = Tutorial.create(
      slug: 'hello-world'
    )
    expect(no_name).to be_invalid

    no_slug = Tutorial.create(
      name: 'Hello World'
    )
    expect(no_slug).to be_invalid
  end
end
