require('capybara/rspec')
require('./app')
require('pry')
Capybara.app = Sinatra::Application

describe('Your Personal Dictionary', :type => :feature) do
  before do
    Word.clear()
  end

  describe('/ path')
  it('laods the home page') do
    expect(page).to(have_content('Your Peronsal Dictionary'))
  end

  describe('/words path') do
    it('shows the message when no words have not been stored yet')do
    expect(page).to(have_content('No words exist yet.'))
  else
    it('shows a list of the stored words') do
      clink_link('Add a new word')
      fill_in('entered_word', :with => 'cat')
      click_button('Submit!')

      excpect(page).to(have_content('cat'))
    end
  end

  describe('/words/:id path') do
    it('shows the details of the entered word')do
      click_link('Add a new word')
      fill_in('entered_word', :with => 'cat')
      click_button('Submit!')
      click_link('cat')
      expect(page).to(have_content('cat definition'))
    end
  end

  describe('/words/:id/definition') do
    it('shows the definition of the selected word') do
      click_link('Add a new word')
      fill_in('entered_word',:with => 'mouse')
      click_button('Submit!')
      click_link('mouse')
      click_link('Please add a definition for mouse')
      fill_in('word_def', :with => 'a small rodent')
      click_button('Submit!')
      click_link('mouse')
      expect(page).to(have_content('mouse: a small rodent'))
    end
  end
end
