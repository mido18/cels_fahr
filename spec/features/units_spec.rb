require 'rails_helper'


RSpec.feature 'Units interface' do

  before do
    @celsius = create(:unit)
    @fahrenheit = create(:fahrenheit)
  end

  scenario 'see units' do
    visit units_path

    expect(page).to have_content(@celsius.name)
    expect(page).to have_content(@fahrenheit.name)

    expect(page).to have_link('Show')
    expect(page).to have_link('Edit')
    expect(page).to have_link('Destroy')
    expect(page).to have_link('New Unit')

    expect(current_path).to eq(units_path)
  end

  scenario 'see unit' do
    visit unit_path(@celsius)

    expect(page).to have_content(@celsius.name)
    expect(page).to have_content(@celsius.short_name)

    expect(page).to have_link('Edit')
    expect(page).to have_link('Back')

    expect(current_path).to eq(unit_path(@celsius))
  end

  scenario 'new unit' do
    visit new_unit_path

    expect(page).to have_field('unit_name')
    expect(page).to have_field('unit_alias')

    expect(page).to have_button('Submit')
    expect(page).to have_link('Back')

    expect(current_path).to eq(new_unit_path)
  end

  scenario 'failed create unit' do
    visit new_unit_path

    click_button 'Submit'

    expect(page).to have_content('2 errors prohibited this unit from being saved:')
    expect(page).to have_content("Name can't be blank")
    expect(page).to have_content("Alias can't be blank")
  end

  scenario 'create unit' do
    visit new_unit_path

    fill_in 'Name',with: 'Test'
    fill_in 'Alias',with: 'T'

    click_button 'Submit'

    expect(page).to have_content('Unit was successfully created')
  end
end