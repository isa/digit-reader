class DigitReader
   constructor: () ->
      @digits = ['bir', 'iki', 'üç', 'dört', 'beş', 'altı', 'yedi', 'sekiz', 'dokuz']
      @tens = ['on', 'yirmi', 'otuz', 'kırk', 'elli', 'altmış', 'yetmiş', 'seksen', 'doksan']
      @zero = 'sıfır'
      @hundred = 'yüz'
      @thousand = 'bin'

   read: (number) ->
      [whole_number, precision_number] = new String(number).split ','
      whole = @read_whole whole_number
      precision = @read_whole precision_number

      "#{whole} lira #{precision} kuruş"

   read_whole: (whole_number) ->
      return @zero if Math.abs(whole_number) is 0
      return (@single_digit "#{whole_number}").trim() if Math.abs(whole_number) < 10
      return (@two_digit "#{whole_number}").trim() if Math.abs(whole_number) < 100
      return (@three_digit "#{whole_number}").trim() if Math.abs(whole_number) < 1000

      (@more_digits "#{whole_number}").trim()

   single_digit: (number) ->
      @digits[Math.abs(number) - 1]

   two_digit: (number) ->
      return '' if parseInt(number, 10) is 0
      number = new String(Math.abs(number)) if number.length > 2

      [first, second] = number

      return @single_digit second if parseInt(number, 10) < 10
      return @tens[first - 1] if parseInt(second) is 0
      @tens[first - 1] + ' ' + @single_digit parseInt(second)

   three_digit: (number) ->
      return '' if parseInt(number, 10) is 0
      number = new String(Math.abs(number)) if number.length > 3

      [first, second, third] = number

      return @two_digit "#{second}#{third}" if parseInt(number, 10) < 100
      return @hundred + ' ' + @two_digit "#{second}#{third}" if parseInt(first) is 1

      hundreds = (@single_digit first) + " #{@hundred} "
      return hundreds + @two_digit "#{second}#{third}"

   more_digits: (number) ->
      reverse_number = number.split('').reverse().join('')
      digits = @group_by_digits reverse_number
      [first, rest...] = digits

      return @thousand + ' ' + @three_digit "#{rest}" if parseInt(first) is 1

      thousands = (@read_whole first) + " #{@thousand} "

      return thousands + @three_digit "#{rest}"

   group_by_digits: (reverse_number) ->
      digits = []
      for e, i in reverse_number by 3
         digits.push (reverse_number[i .. i+2]).split('').reverse().join('')

      digits.reverse()


root = exports ? window
root.DigitReader = DigitReader
