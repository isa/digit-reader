class DigitReader
   constructor: () ->
      @digits = ['sıfır', 'bir', 'iki', 'üç', 'dört', 'beş', 'altı', 'yedi', 'sekiz', 'dokuz']
      @tens = ['on', 'yirmi', 'otuz', 'kırk', 'elli', 'altmış', 'yetmiş', 'seksen', 'doksan']

   read: (number) ->
      [whole_number, precision] = new String(number).split ','

      return @single_digit whole_number if Math.abs(whole_number) < 10
      return @two_digit whole_number if Math.abs(whole_number) < 100

   single_digit: (number) ->
      console.log '>' + number
      @digits[number]

   two_digit: (number) ->
      console.log '>>' + number
      [first, second] = number
      return @tens[first - 1] if parseInt(second) is 0

      @tens[first - 1] + ' ' + @single_digit parseInt(second)

root = exports ? window
root.DigitReader = DigitReader
