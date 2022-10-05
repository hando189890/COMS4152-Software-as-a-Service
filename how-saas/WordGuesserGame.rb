class WordGuesserGame
  
 
  # add the necessary class methods, attributes, etc. here
  # to make the tests in spec/wordguesser_game_spec.rb pass.

  # Get a word from remote "random word" service

  def initialize(word)
    @word = word
    @guesses = ''
    @wrong_guesses = ''
  end

  attr_accessor :word
  attr_accessor :guesses
  attr_accessor :wrong_guesses
  
  def guess(new_word) 
    if !new_word || new_word.empty? || !new_word.match(/[A-Za-z]/)
      raise ArgumentError 
    end
    
    new_word.downcase!
    
    if @guesses.include?(new_word) or @wrong_guesses.include?(new_word) 
      return false 
    elsif @word.include?(new_word)  
      @guesses += new_word
    else
      @wrong_guesses += new_word
    end 
  end

  def word_with_guesses
    track=''
    @word.each_char do |new_word|
      if @guesses.include?(new_word)
        track += new_word
      else
        track += '-'
      end
    end
    return track
  end


  def check_win_or_lose
    if @wrong_guesses.length >= 7
      return :lose 
    elsif word_with_guesses == @word
      return :win
    else
      return :play
    end
  end



  # You can test it by installing irb via $ gem install irb
  # and then running $ irb -I. -r app.rb
  # And then in the irb: irb(main):001:0> WordGuesserGame.get_random_word
  #  => "cooking"   <-- some random word
  def self.get_random_word
    require 'uri'
    require 'net/http'
    uri = URI('http://randomword.saasbook.info/RandomWord')
    Net::HTTP.new('randomword.saasbook.info').start { |http|
      return http.post(uri, "").body
    }
  end

end


-------
class WordGuesserGame
  
 
  # add the necessary class methods, attributes, etc. here
  # to make the tests in spec/wordguesser_game_spec.rb pass.

  # Get a word from remote "random word" service

 def initialize(word)
    @word = word
    @guesses = ''
    @wrong_guesses = ''
  end
  
  attr_accessor :word, :guesses, :wrong_guesses
  
  def guess(letter)
    # raise error if argument is invalid
    raise ArgumentError if (letter.to_s == '') or !(letter =~ /[[:alpha:]]/ )
    # we don't need case-sensitive check
    letter.downcase!
    # check letter and if it doesn't exist, add it in the corresponding variable
    if @word.include?(letter) 
      if @guesses.include?(letter)
        return false
      else
        @guesses += letter
      end
    else 
      if @wrong_guesses.include?(letter)
        return false
      else
        @wrong_guesses += letter 
      end
    end
    true
  end
  
  def word_with_guesses
    wwg=''
    @word.each_char do |letter|
      if @guesses.include?(letter)
        wwg += letter
      else
        wwg += '-'
      end
    end
    wwg
  end
  
  def check_win_or_lose
    if self.word_with_guesses == @word
      return :win
    elsif @wrong_guesses.length == 7
      return :lose
    else
      return :play
    end
  end



  # You can test it by installing irb via $ gem install irb
  # and then running $ irb -I. -r app.rb
  # And then in the irb: irb(main):001:0> WordGuesserGame.get_random_word
  #  => "cooking"   <-- some random word
  def self.get_random_word
    require 'uri'
    require 'net/http'
    uri = URI('http://randomword.saasbook.info/RandomWord')
    Net::HTTP.new('randomword.saasbook.info').start { |http|
      return http.post(uri, "").body
    }
  end

end

-----
class WordGuesserGame
  
 
  # add the necessary class methods, attributes, etc. here
  # to make the tests in spec/wordguesser_game_spec.rb pass.

  # Get a word from remote "random word" service

  def initialize(word)
    @word = word
    @guesses = ''
    @wrong_guesses = ''
  end

  attr_accessor :word
  attr_accessor :guesses
  attr_accessor :wrong_guesses
  
  def guess(new_word)
    if !new_word || new_word.empty? || !new_word.match(/[A-Za-z]/)
      raise ArgumentError 
    end
    
    new_word.downcase!
    
    if @guesses.include?(new_word) or @wrong_guesses.include?(new_word) 
      return false 
    elsif @word.include?(new_word)  
      @guesses += new_word
    else
      @wrong_guesses += new_word
    end 
  end

  def word_with_guesses
    track=''
    @word.each_char do |new_word|
      if @guesses.include?(new_word)
        track += new_word
      else
        track += '-'
      end
    end
    return track
  end


  def check_win_or_lose
    if @wrong_guesses.length >= 7
      return :lose 
    elsif self.word_with_guesses == @word
      return :win
    else
      return :play
    end
  end



  # You can test it by installing irb via $ gem install irb
  # and then running $ irb -I. -r app.rb
  # And then in the irb: irb(main):001:0> WordGuesserGame.get_random_word
  #  => "cooking"   <-- some random word
  def self.get_random_word
    require 'uri'
    require 'net/http'
    uri = URI('http://randomword.saasbook.info/RandomWord')
    Net::HTTP.new('randomword.saasbook.info').start { |http|
      return http.post(uri, "").body
    }
  end

end

------

class WordGuesserGame
  
 
  # add the necessary class methods, attributes, etc. here
  # to make the tests in spec/wordguesser_game_spec.rb pass.

  # Get a word from remote "random word" service

attr_accessor :word, :guesses, :wrong_guesses
  
  def initialize(word)
    @word, @guesses, @wrong_guesses = word, '', ''
  end

  def guess(letter)
    raise ArgumentError if !letter || letter.empty? || !letter.match(/[A-Za-z]/)
  
    letter.downcase!
    
    return false if @guesses.index(letter) || @wrong_guesses.index(letter)
    
    if word.index(letter)
      @guesses << letter
    else
      @wrong_guesses << letter
    end 
  end

  def word_with_guesses
    displayed = ''
    @word.each_char do |letter|
      if @guesses.index(letter)
        displayed << letter
      else
        displayed << '-'
      end
    end
    displayed
  end

  def check_win_or_lose
    return :lose if @wrong_guesses.length >= 7
    return :win if !word_with_guesses.index('-')  
    :play
  end



  # You can test it by installing irb via $ gem install irb
  # and then running $ irb -I. -r app.rb
  # And then in the irb: irb(main):001:0> WordGuesserGame.get_random_word
  #  => "cooking"   <-- some random word
  def self.get_random_word
    require 'uri'
    require 'net/http'
    uri = URI('http://randomword.saasbook.info/RandomWord')
    Net::HTTP.new('randomword.saasbook.info').start { |http|
      return http.post(uri, "").body
    }
  end

end
-----
class WordGuesserGame
  
 
  # add the necessary class methods, attributes, etc. here
  # to make the tests in spec/wordguesser_game_spec.rb pass.

  # Get a word from remote "random word" service

attr_accessor :word, :guesses, :wrong_guesses
  
  def initialize(word)
    @word, @guesses, @wrong_guesses = word, '', ''
  end

  def guess(letter)
    raise ArgumentError if !letter || letter.empty? || !letter.match(/[A-Za-z]/)
  
    letter.downcase!
    
    return false if @guesses.index(letter) || @wrong_guesses.index(letter)
    
    if word.index(letter)
      @guesses << letter
    else
      @wrong_guesses << letter
    end 
  end

  def word_with_guesses
    displayed = ''
    @word.each_char do |letter|
      if @guesses.index(letter)
        displayed << letter
      else
        displayed << '-'
      end
    end
    displayed
  end

  def check_win_or_lose
    return :lose if @wrong_guesses.length >= 7
    return :win if !word_with_guesses.index('-')  
    :play
  end



  # You can test it by installing irb via $ gem install irb
  # and then running $ irb -I. -r app.rb
  # And then in the irb: irb(main):001:0> WordGuesserGame.get_random_word
  #  => "cooking"   <-- some random word
  def self.get_random_word
    require 'uri'
    require 'net/http'
    uri = URI('http://randomword.saasbook.info/RandomWord')
    Net::HTTP.new('randomword.saasbook.info').start { |http|
      return http.post(uri, "").body
    }
  end

end