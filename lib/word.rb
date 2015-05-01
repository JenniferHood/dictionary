class Word
  @@all_words = []

   define_method(:initialize) do |entered_word|
     @entered_word = entered_word
   end

   define_method(:entered_word) do
     @entered_word
  end

  define_singleton_method(:all) do
    @@all_words
  end

  define_method(:save) do
    @@all_words.push(self)
  end

  define_singleton_method(:clear) do
    @@all_words = []
  end
end
