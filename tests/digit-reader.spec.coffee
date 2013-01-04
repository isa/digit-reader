{DigitReader} = require '../src/digit-reader'

describe 'Digit Reader', ->

   it 'should return text equivalent of a single-digit number', ->
      dr = new DigitReader

      zero = dr.read(0)
      one = dr.read(1)
      two = dr.read(2)
      three = dr.read(3)
      four = dr.read(4)
      five = dr.read(5)
      six = dr.read(6)
      seven = dr.read(7)
      eight = dr.read(8)
      nine = dr.read(9)

      zero.should.equal 'sıfır'
      one.should.equal 'bir'
      two.should.equal 'iki'
      three.should.equal 'üç'
      four.should.equal 'dört'
      five.should.equal 'beş'
      six.should.equal 'altı'
      seven.should.equal 'yedi'
      eight.should.equal 'sekiz'
      nine.should.equal 'dokuz'

   it 'should return text equivalent of a two-digit whole number', ->
      dr = new DigitReader

      ten = dr.read(10)
      twenty = dr.read(20)
      thirty = dr.read(30)
      fourty = dr.read(40)
      fifty = dr.read(50)
      sixty = dr.read(60)
      seventy = dr.read(70)
      eighty = dr.read(80)
      ninety = dr.read(90)

      ten.should.equal 'on'
      twenty.should.equal 'yirmi'
      thirty.should.equal 'otuz'
      fourty.should.equal 'kırk'
      fifty.should.equal 'elli'
      sixty.should.equal 'altmış'
      seventy.should.equal 'yetmiş'
      eighty.should.equal 'seksen'
      ninety.should.equal 'doksan'

   it 'should return text equivalent of a two-digit tens number', ->
      dr = new DigitReader

      eleven = dr.read(11)

      eleven.should.equal 'on bir'

   it 'should return text equivalent of any two-digit number', ->
      dr = new DigitReader

      eighteen = dr.read(18)
      seventy_six = dr.read(76)
      ninety_nine = dr.read(99)

      eighteen.should.equal 'on sekiz'
      seventy_six.should.equal 'yetmiş altı'
      ninety_nine.should.equal 'doksan dokuz'

   it 'should return text equivalent for zeros', ->
      dr = new DigitReader

      eight = dr.read('00')

      eight.should.equal 'sıfır'

   it 'should return text equivalent of two-digit numbers starting with zero', ->
      dr = new DigitReader

      eight = dr.read('08')

      eight.should.equal 'sekiz'

   it 'should return text equivalent of three-digit whole number for hundred', ->
      dr = new DigitReader

      hundred = dr.read(100)

      hundred.should.equal 'yüz'

   it 'should return text equivalent of three-digit numbers starting with zero', ->
      dr = new DigitReader

      eighty = dr.read('080')

      eighty.should.equal 'seksen'

   it 'should return text equivalent of three-digit any number in hundreds', ->
      dr = new DigitReader

      hundred_seventy_three = dr.read(173)
      hundred_and_three = dr.read(103)
      three_hundred_sixty_eight = dr.read(368)

      hundred_seventy_three.should.equal 'yüz yetmiş üç'
      hundred_and_three.should.equal 'yüz üç'
      three_hundred_sixty_eight.should.equal 'üç yüz altmış sekiz'

   it 'should return text equivalent of four-digit whole number for thousand', ->
      dr = new DigitReader

      thousand = dr.read(1000)

      thousand.should.equal 'bin'

   it 'should return text equivalent of four-digit number starting with zero', ->
      dr = new DigitReader

      hundred = dr.read('0100')

      hundred.should.equal 'yüz'

   it 'should return text equivalent of four-digit any number in thousands', ->
      dr = new DigitReader

      thousand_and_three = dr.read(1003)
      thousand_and_thirty = dr.read(1030)
      thousand_and_three_hundred = dr.read(1300)
      thousand_and_three_hundred_and_seven = dr.read(1307)
      four_thousand_and_three_hundred_and_seventy_five = dr.read(4375)

      thousand_and_three.should.equal 'bin üç'
      thousand_and_thirty.should.equal 'bin otuz'
      thousand_and_three_hundred.should.equal 'bin üç yüz'
      thousand_and_three_hundred_and_seven.should.equal 'bin üç yüz yedi'
      four_thousand_and_three_hundred_and_seventy_five.should.equal 'dört bin üç yüz yetmiş beş'

   it 'should return text equivalent of five-digit number whole number', ->
      dr = new DigitReader

      ten_thousand = dr.read('10000')

      ten_thousand.should.equal 'on bin'

   it 'should return text equivalent of any five-digit number', ->
      dr = new DigitReader

      seventy_thousand_and_three = dr.read('70003')
      eighty_nine_thousand_and_hundred_and_fifty_six = dr.read('89156')

      seventy_thousand_and_three.should.equal 'yetmiş bin üç'
      eighty_nine_thousand_and_hundred_and_fifty_six.should.equal 'seksen dokuz bin yüz elli altı'

   it 'should return text equivalent of five-digit number starting with zero', ->
      dr = new DigitReader

      thousand = dr.read('01000')

      thousand.should.equal 'bin'

