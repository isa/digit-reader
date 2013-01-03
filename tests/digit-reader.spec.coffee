# DigitReader = require '../src/digit-reader'
{DigitReader} = require '../src/digit-reader'

describe 'Digit Reader', ->

   it 'should return text equivalent of a single digit number', ->
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
      four.should.equal 'dort'
      five.should.equal 'beş'
      six.should.equal 'altı'
      seven.should.equal 'yedi'
      eight.should.equal 'sekiz'
      nine.should.equal 'dokuz'
