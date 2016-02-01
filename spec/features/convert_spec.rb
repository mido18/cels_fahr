require 'rails_helper'


RSpec.feature 'Convert interface' do

  scenario 'convert_celsius' do
    @celsius = create(:celsius_definition)
    visit root_path

    fill_in 'Celsius',with: '5'
    click_button 'Convert'

    expect(current_path).to eq(convert_path)

    expect(page).to have_field('Fahrenheit',with: '41')
  end

  scenario 'convert_fahrenheit' do
    @celsius = create(:fahrenheit_definition)
    visit root_path

    fill_in 'Fahrenheit',with: '41'
    click_button 'Convert'

    expect(current_path).to eq(convert_path)

    expect(page).to have_field('Celsius',with: '5')
  end
end