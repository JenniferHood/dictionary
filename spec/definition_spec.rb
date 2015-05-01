require('rspec')
require('definition')

describe('Definition') do
  before do
    Definition.clear()
  end

  describe('#word_def') do
    it('user enteres the definition of a selected word') do
      test_def = Definition.new('a cat is an domesticated animal.')
      expect(test_def.word_def()).to(eq('a cat is an domesticated animal.'))
    end
  end

  describe('.all') do
    it('is empty at first') do
      expect(Definition.all()).to(eq([]))
    end
  end

  describe('#save') do
    it('adds the definition to the array of saved words') do
      test_def = Definition.new('a mouse is a rodent.')
      test_def.save()
      expect(Definition.all()).to(eq([test_def]))
    end
  end

  describe('.clear') do
    it('empties out all of the saved definitions') do
      Definition.new('a mouse is a rodent').save()
      Definition.clear()
      expect(Definition.all()).to(eq([]))
    end
  end
end
