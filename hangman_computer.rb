

class Computer_ai

  attr_accessor :dict, :guessed_letters
  def initialize(length)
    @guessed_letters = []
    @dict = []
    @alphabet = {}
     ("a".."z").each {|key| @alphabet[key] = 0 }
    regex_string = "."*length

    #dict is just the words that are the right size.
    File.readlines('dict.txt').each {|line| @dict << line.chomp if line.length-1 == length }
# match(/#{regex_string}/)
   # guess_order_hash = letter_priority(regex_string, @dict)

  end #method

  #the regex represents the word
  def most_frequent_letter(regex)
    temp_dict = []
    @dict.each {|word| temp_dict << word if word.match(/#{regex}/)}
    #p temp_dict
    flattened_dic = flatten_dict(temp_dict)

    @alphabet.keys.each do |letter|
      @alphabet[letter] =flattened_dic.count(letter)
    end

    @guessed_letters.each { |char| @alphabet.delete(char) } #delete all the @guessed_letters
    #puts "guessed letter below"
    guessed_letter = @alphabet.key(@alphabet.values.max)
    #p guessed_letter
    @guessed_letters << guessed_letter
    return guessed_letter
    #p @alphabet
  end #method


  def flatten_dict(dict)
     dict.join("").split("")
  end




end #class