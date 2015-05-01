class Definition
  @@all_def = []

  define_method(:initialize) do |word_def|
    @word_def = word_def
  end

  define_method(:word_def) do
    @word_def
  end

  define_singleton_method(:all) do
    @@all_def
  end

  define_method(:save) do
    @@all_def.push(self)
  end

  define_singleton_method(:clear) do
    @@all_def = []
  end
end
