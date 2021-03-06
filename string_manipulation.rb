require 'pry'

# A method to reverse a string in place.
def string_reverse(my_string)
  i = 0
  j = my_string.length - 1

  while i < j
    temp = my_string[i]
    my_string[i] = my_string[j]
    my_string[j] = temp
    i += 1
    j -= 1
  end
end

# A method to reverse each word in a sentence, in place.
def reverse_words(my_words)
  i = 0
  sub_start = 0
  sub_end = 0
  while i < my_words.length
    if my_words[i] != " "
      until my_words[i] == " " || i == my_words.length
        i += 1
      end

      sub_end = i - 1

      while sub_start <= sub_end && i <= my_words.length
        temp = my_words[sub_start]
        my_words[sub_start] = my_words[sub_end]
        my_words[sub_end] = temp
        sub_end -= 1
        sub_start += 1
      end

      sub_start = i

    else
      i += 1
      sub_start += 1
    end
  end
end

# A method to reverse the words in a sentence, in place.
def reverse_sentence(my_sentence)
  i = 0
  j = my_sentence.length - 1

  while i < j
    temp = my_sentence[i]
    my_sentence[i] = my_sentence[j]
    my_sentence[j] = temp
    i += 1
    j -= 1
  end

  i = 0
  sub_start = 0
  sub_end = 0

  while i < my_sentence.length
    if my_sentence[i] == " "
      i += 1
      sub_start += 1
    else
      until my_sentence[i] == " " || i == my_sentence.length
        i += 1
      end

      sub_end = i - 1

      while sub_start <= sub_end && i <= my_sentence.length
        temp = my_sentence[sub_start]
        my_sentence[sub_start] = my_sentence[sub_end]
        my_sentence[sub_end] = temp
        sub_end -= 1
        sub_start += 1
      end

      sub_start = i
    end
  end
end



# A method to check if the input string is a palindrome.
# Return true if the string is a palindrome. Return false otherwise.
def palindrome_check(my_phrase)
  forwards = ""
  backwards = ""

  j = 0
  while j < my_phrase.length
    unless my_phrase[j] == " "
      forwards << my_phrase[j]
    end
    j += 1
  end

  i = my_phrase.length - 1

  while i >= 0
    unless my_phrase[i] == " "
      backwards << my_phrase[i]
    end
    i -= 1
  end

  if forwards == backwards
    return true
  else
    return false
  end
end

# A method that updates the string by replacing consecutive repeating characters
# with a number representing the frequncy. The replacement is done only if the
# string length will get reduced by the process.
def encode_repeating(my_string)
  first = my_string[0]
  i = 0
  count = 0
  while i < my_string.length
    until my_string[i] != first || i == my_string.length
      i += 1
      count += 1
    end

    if count > 2
      my_string[i - count] = first
      my_string[i - count + 1] = count.to_s

      (count - 2).times do
        my_string[i - 1] = ""
        i -= 1
      end
    end

    first = my_string[i]
    count = 0
  end
end

### ---- END OF METHODS
puts "Test 1: reverse a string"
my_string = "Lovelace"
puts "Original string: #{my_string}"
reversed_string = "ecalevoL"
string_reverse(my_string)
if my_string == reversed_string
  puts "String reversed correctly. Reversed string: #{reversed_string}"
else
  puts "BUG! The reversed string should be '#{reversed_string}' and not '#{my_string}'"
end

puts "Test 2: reversed words"
my_words = "I can be an  engineer"
puts "Original: #{my_words}"
reversed_words = "I nac eb na  reenigne"
reverse_words(my_words)
if my_words == reversed_words
  puts "Words reversed correctly. Reversed words: #{reversed_words}"
else
  puts "BUG! The reversed words should be '#{reversed_words}' and not '#{my_words}'"
end

puts "Test 3: reversed sentence"
sentence = "Yoda  is   awesome"
puts "Original: #{sentence}"
reversed_sentence = "awesome   is  Yoda"
reverse_sentence(sentence)
if sentence == reversed_sentence
  puts "Sentence reversed correctly. Reversed sentence: '#{reversed_sentence}'"
else
  puts "BUG! The reversed sentence should be '#{reversed_sentence}' and not '#{sentence}'"
end

puts "Test 4: Palindrome check"
phrase = "madam"
puts "BUG: madam is a palindrome and should return true" if palindrome_check(phrase) != true
phrase = "empty"
puts "BUG: empty is not a palindrome and should return false" if palindrome_check(phrase) != false
# optional challenge
phrase = "nurses run"
puts "BUG: 'nurses run' is a palindrome and should return true" if palindrome_check(phrase) != true
puts "Palindrome test complete."

# Optional Question #5
puts "Test 5: Encode test"
test1 = "aaabbbbbcccc"
encode_repeating(test1)
if test1 != "a3b5c4"
  puts "BUG! 'aaabbbbbcccc' should get encoded to 'a3b5c4', not '#{test1}'"
end

test2 = "xxxyttttgeee"
encode_repeating(test2)
if test2 != "x3yt4ge3"
  puts "BUG! 'xxxyttttgeee' should get encoded to 'x3yt4ge3', not '#{test2}'"
end

test3 = "ddbbfffgjjjj"
encode_repeating(test3)
if test3 != "ddbbf3gj4"
  puts "BUG! 'ddbbfffgjjjj' should get encoded to 'ddbbf3gj4', not '#{test3}'"
end
puts "Encode test complete."
