# DigitReader = require '../src/digit-reader'
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

   it 'should return text equivalent of two-digit numbers starting with zero', ->
      dr = new DigitReader

      eight = dr.read('08')

      eight.should.equal 'sekiz'

   it 'should return text equivalent for two zeros', ->
      dr = new DigitReader

      eight = dr.read('00')

      eight.should.equal 'sıfır'

   it 'should return text equivalent of three-digit whole number for hundred', ->
      dr = new DigitReader

      hundred = dr.read(100)

      hundred.should.equal 'yüz'

   it 'should return text equivalent of three-digit any number in hundreds', ->
      dr = new DigitReader

      hundred_seventy_three = dr.read(173)
      three_hundred_sixty_eight = dr.read(368)

      hundred_seventy_three.should.equal 'yüz yetmiş üç'
      three_hundred_sixty_eight.should.equal 'üç yüz altmış sekiz'

