require 'rails_helper'

RSpec.feature 'Task management', type: :feature do
  let(:task) { create(:task) }

  feature 'Task creation' do
    scenario 'User creates a new valid task' do
      visit '/tasks'

      fill_in 'Todo', with: 'This is a test task'
      click_button 'Save Task'

      expect(page).to have_text('Task successfully created')
    end

    scenario 'User creates a new invalid task' do
      visit '/tasks'
  
      click_button 'Save Task'
  
      expect(page).to have_text('Something went wrong!')
    end
  end

  feature 'Task editing' do
    scenario 'User edits a task' do
      visit "/tasks/#{task.id}/edit"

      fill_in 'Todo', with: 'This is a test task'
      click_button 'Update Task'

      expect(page).to have_text('Task successfully updated')
    end

    scenario 'User edits a task with invalid data 'do
      visit "/tasks/#{task.id}/edit"

      fill_in 'Todo', with: ' '
      click_button 'Update Task'

      expect(page).to have_text("Something went wrong!")
    end
  end

  feature 'Task deletion' do
    scenario 'User deletes a task' do
      create(:task)
      visit '/tasks'

      click_link 'D'

      expect(page).to have_text('Task successfully deleted')
    end
  end
end
