class DigitReader
   constructor: () ->
      @digits = ['bir', 'iki', 'üç', 'dört', 'beş', 'altı', 'yedi', 'sekiz', 'dokuz']
      @tens = ['on', 'yirmi', 'otuz', 'kırk', 'elli', 'altmış', 'yetmiş', 'seksen', 'doksan']
      @zero = 'sıfır'
      @hundred = 'yüz'
      @thousand = 'bin'
      @million = 'milyon'

   read: (number) ->
      [whole_number, precision] = new String(number).split ','

      return @zero if Math.abs(whole_number) is 0
      return (@single_digit whole_number).trim() if Math.abs(whole_number) < 10
      return (@two_digit whole_number).trim() if Math.abs(whole_number) < 100
      return (@three_digit whole_number).trim() if Math.abs(whole_number) < 1000

   single_digit: (number) ->
      @digits[Math.abs(number) - 1]

   two_digit: (number) ->
      [first, second] = number

      return '' if parseInt(number, 10) is 0
      return @single_digit second if parseInt(number, 10) < 10
      return @tens[first - 1] if parseInt(second) is 0
      @tens[first - 1] + ' ' + @single_digit parseInt(second)

   three_digit: (number) ->
      [first, second, third] = number

      return @hundred + ' ' + @two_digit "#{second}#{third}" if parseInt(first) is 1

      hundreds = (@single_digit first) + " #{@hundred} "
      return hundreds + @two_digit "#{second}#{third}"

root = exports ? window
root.DigitReader = DigitReader
