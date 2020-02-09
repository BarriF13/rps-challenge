require 'spec_helper'
# As a marketeer
# So that I can enjoy myself away from the daily grind
# I would like to be able to play rock/paper/scissors
feature 'Play the game' do
  PLAY_SEED = 221563
  before do
    visit('/')
    fill_in 'name', with: 'Barri'
    click_button 'Submit'
  end
  # the marketeer will be presented the choices (rock, paper and scissors
  scenario 'Can see options : Rock paper scissors' do
    expect(page).to have_button "Rock"
    expect(page).to have_button "Paper"
    expect(page).to have_button "Scissors"
    end
   # the marketeer can choose one option
   scenario 'Player can choose an options : Rock paper scissors' do
    click_button "Rock"
    expect(page).to have_content 'You chose Rock!'
  end
  #the game will choose a random option
  scenario ' game choose "Rock' do
    click_button 'Rock'

    message = find(:css, "#opponent").text

    expect(possible_messages).to include message
  end
  # i want the game to choose a random option
  scenario 'game choose a random option' do
    srand(PLAY_SEED)
    click_button "Rock"
    expect(page).to have_content "Opponent chose Scissors!"
  end
  # we now set possible messages  for the computer to choose
  def possible_messages
    [:rock, :paper, :scissors].map { |shape| "Opponent chose #{shape.to_s.capitalize}!" }
  end
end
