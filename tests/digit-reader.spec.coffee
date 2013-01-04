{DigitReader} = require '../src/digit-reader'

describe 'Digit Reader', ->

   it 'should return text equivalent of a single-digit number', ->
      dr = new DigitReader

      zero = dr.read_whole(0)
      one = dr.read_whole(1)
      two = dr.read_whole(2)
      three = dr.read_whole(3)
      four = dr.read_whole(4)
      five = dr.read_whole(5)
      six = dr.read_whole(6)
      seven = dr.read_whole(7)
      eight = dr.read_whole(8)
      nine = dr.read_whole(9)

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

      ten = dr.read_whole(10)
      twenty = dr.read_whole(20)
      thirty = dr.read_whole(30)
      fourty = dr.read_whole(40)
      fifty = dr.read_whole(50)
      sixty = dr.read_whole(60)
      seventy = dr.read_whole(70)
      eighty = dr.read_whole(80)
      ninety = dr.read_whole(90)

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

      eleven = dr.read_whole(11)

      eleven.should.equal 'on bir'

   it 'should return text equivalent of any two-digit number', ->
      dr = new DigitReader

      eighteen = dr.read_whole(18)
      seventy_six = dr.read_whole(76)
      ninety_nine = dr.read_whole(99)

      eighteen.should.equal 'on sekiz'
      seventy_six.should.equal 'yetmiş altı'
      ninety_nine.should.equal 'doksan dokuz'

   it 'should return text equivalent for zeros', ->
      dr = new DigitReader

      eight = dr.read_whole('00')

      eight.should.equal 'sıfır'

   it 'should return text equivalent of two-digit numbers starting with zero', ->
      dr = new DigitReader

      eight = dr.read_whole('08')

      eight.should.equal 'sekiz'

   it 'should return text equivalent of three-digit whole number for hundred', ->
      dr = new DigitReader

      hundred = dr.read_whole(100)

      hundred.should.equal 'yüz'

   it 'should return text equivalent of three-digit numbers starting with zero', ->
      dr = new DigitReader

      eighty = dr.read_whole('080')

      eighty.should.equal 'seksen'

   it 'should return text equivalent of three-digit any number in hundreds', ->
      dr = new DigitReader

      hundred_seventy_three = dr.read_whole(173)
      hundred_and_three = dr.read_whole(103)
      three_hundred_sixty_eight = dr.read_whole(368)

      hundred_seventy_three.should.equal 'yüz yetmiş üç'
      hundred_and_three.should.equal 'yüz üç'
      three_hundred_sixty_eight.should.equal 'üç yüz altmış sekiz'

   it 'should return text equivalent of four-digit whole number for thousand', ->
      dr = new DigitReader

      thousand = dr.read_whole(1000)

      thousand.should.equal 'bin'

   it 'should return text equivalent of four-digit number starting with zero', ->
      dr = new DigitReader

      hundred = dr.read_whole('0100')

      hundred.should.equal 'yüz'

   it 'should return text equivalent of four-digit any number in thousands', ->
      dr = new DigitReader

      thousand_and_three = dr.read_whole(1003)
      thousand_and_thirty = dr.read_whole(1030)
      thousand_and_three_hundred = dr.read_whole(1300)
      thousand_and_three_hundred_and_seven = dr.read_whole(1307)
      four_thousand_and_three_hundred_and_seventy_five = dr.read_whole(4375)

      thousand_and_three.should.equal 'bin üç'
      thousand_and_thirty.should.equal 'bin otuz'
      thousand_and_three_hundred.should.equal 'bin üç yüz'
      thousand_and_three_hundred_and_seven.should.equal 'bin üç yüz yedi'
      four_thousand_and_three_hundred_and_seventy_five.should.equal 'dört bin üç yüz yetmiş beş'

   it 'should return text equivalent of five-digit number whole number', ->
      dr = new DigitReader

      ten_thousand = dr.read_whole(10000)

      ten_thousand.should.equal 'on bin'

   it 'should return text equivalent of any five-digit number', ->
      dr = new DigitReader

      seventy_thousand_and_three = dr.read_whole(70003)
      eighty_nine_thousand_and_hundred_and_fifty_six = dr.read_whole(89156)

      seventy_thousand_and_three.should.equal 'yetmiş bin üç'
      eighty_nine_thousand_and_hundred_and_fifty_six.should.equal 'seksen dokuz bin yüz elli altı'

   it 'should return text equivalent of five-digit number starting with zero', ->
      dr = new DigitReader

      thousand = dr.read_whole('01000')

      thousand.should.equal 'bin'

   it 'should return text equivalent of six-digit number whole number', ->
      dr = new DigitReader

      hundred_thousand = dr.read_whole(100000)

      hundred_thousand.should.equal 'yüz bin'

   it 'should return text equivalent of any six-digit number', ->
      dr = new DigitReader

      five_hundred_thousand_and_three = dr.read_whole('500003')
      nine_hundred_and_one_thousand_and_twenty_two = dr.read_whole('901022')

      five_hundred_thousand_and_three.should.equal 'beş yüz bin üç'
      nine_hundred_and_one_thousand_and_twenty_two.should.equal 'dokuz yüz bir bin yirmi iki'

   it 'should return text equivalent of any number less than 7 digits with precision', ->
      dr = new DigitReader

      actual = dr.read('432667,22')

      actual.should.equal 'dört yüz otuz iki bin altı yüz altmış yedi lira yirmi iki kuruş'

