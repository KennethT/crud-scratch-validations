require 'rails_helper'

describe 'user can create status posts and add likes' do

  scenario 'User can crud a status update' do

    visit '/'

    click_on "New Post"

    fill_in 'status[user]', :with => "Dog"
    fill_in 'status[status]', :with => "Bark"


    click_on "Create Status"

    expect(page).to have_content("Dog")
    expect(page).to have_content("Bark")
  end

  scenario 'User can edit an status' do
    @status = Status.create(user: "Dog", status: "Bark")
    visit "/statuses/#{@status.id}/edit"

    #filling out form for task
    fill_in 'status[status]', :with => "Cow"

    #submitting form to create a task
    click_on "Update Status"

    #now we expect the index page to have the description of the task we created.
    expect(page).to have_content("Cow")
    # expecting the flash notification
    expect(page).to have_content("Status was updated")

  end


  scenario 'User can delete an status' do

    @status = Status.create(user: "Dog", status: "Bark")
    visit "/"

    #click on Delete
    click_on "Delete"

    # expecting the flash notification (code says Location but should say Event)
    # test works but base code needs to be fixed
    expect(page).to have_content("Status destroyed")

  end

  scenario 'User can like a status update' do
  @status = Status.create(user: "Dog", status: "Bark")

  visit '/'

  click_button("Like")

  expect(page).to have_content("1")

  end


end
