require('rspec')
require('word')

describe(Word) do
  before() do
    Word.clear()
  end
  
  describe('#entered_word') do
    it('user enters a word and program returns the same word') do
      test_word = Word.new('cat')
      expect(test_word.entered_word()).to(eq('cat'))
    end
  end

  describe('.all') do
    it('is empty at first') do
      expect(Word.all()).to(eq([]))
    end
  end

  describe('#save') do
    it('adds a word tot he array of saved words') do
      test_word = Word.new('mouse')
      test_word.save()
      expect(Word.all()).to(eq([test_word]))
    end
  end

  describe('.clear') do
    it('empties out all of the saved words') do
      Word.new('mouse').save()
      Word.clear()
      expect(Word.all()).to(eq([]))
    end
  end
end
