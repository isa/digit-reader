class DigitReader
   constructor: () ->
      @digits = ['sıfır', 'bir', 'iki', 'üç', 'dort', 'beş', 'altı', 'yedi', 'sekiz', 'dokuz']
   read: (number) ->
      @digits[number]

root = exports ? window
root.DigitReader = DigitReader
