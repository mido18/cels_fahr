require 'rails_helper'


RSpec.feature 'Definition interface' do

  before do
    @celsius = create(:celsius_definition)
    @fahrenheit = create(:fahrenheit_definition)
  end

  scenario 'see definitions' do
    visit definitions_path

    expect(page).to have_content(@celsius.unit.name)
    expect(page).to have_content(@celsius.formula)
    expect(page).to have_content(@fahrenheit.formula)
    expect(page).to have_content(@fahrenheit.unit.name)

    expect(page).to have_link('Show')
    expect(page).to have_link('Edit')
    expect(page).to have_link('Destroy')
    expect(page).to have_link('New Definition')

    expect(current_path).to eq(definitions_path)
  end

  scenario 'see definition' do
    visit definition_path(@celsius)

    expect(page).to have_content(@celsius.unit.name)
    expect(page).to have_content(@celsius.formula)
    expect(page).to have_content(@celsius.converted_to.name)

    expect(page).to have_link('Edit')
    expect(page).to have_link('Back')

    expect(current_path).to eq(definition_path(@celsius))
  end

  scenario 'new definition' do
    visit new_definition_path

    expect(page).to have_field('definition_unit_id')
    expect(page).to have_field('definition_formula')
    expect(page).to have_field('definition_converted_to_id')

    expect(page).to have_button('Submit')
    expect(page).to have_link('Back')

    expect(current_path).to eq(new_definition_path)
  end

  scenario 'failed definition' do
    visit new_definition_path

    click_button 'Submit'

    expect(page).to have_content('3 errors prohibited this definition from being saved:')
    expect(page).to have_content("Formula can't be blank")
    expect(page).to have_content("Unit and converted to cannot be same")
    expect(page).to have_content("Unit full name or alias must be in the text")

  end
end