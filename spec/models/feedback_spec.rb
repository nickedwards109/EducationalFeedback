require 'rails_helper'

RSpec.describe Feedback, type: :model do
  it 'has content and belongs to a Tutorial' do
    tutorial = create(:tutorial)

    feedback = Feedback.create(
      content: "I had trouble in the setup section of the tutorial. Once I got the setup correct, everything else went smoothly.",
      tutorial_id: tutorial.id
    )

    expect(feedback).to be_valid
    expect(feedback.tutorial).to eq(tutorial)
  end

  it 'validates for the presence of a foreign key relation to a Tutorial' do
    feedback = Feedback.create(
      content: "I had trouble in the setup section of the tutorial. Once I got the setup correct, everything else went smoothly."
    )

    expect(feedback).to be_invalid
  end
end
