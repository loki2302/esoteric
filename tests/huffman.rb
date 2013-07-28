require 'test/unit'

class Huffman < Test::Unit::TestCase
  def test
    s = "aabc"
    puts huffman_encode(s.bytes.to_a)
  end
end

def huffman_encode(input_sequence)
  frequencies = Hash.new(0)
  input_sequence.each { |val|
    frequencies[val] += 1
  }

  nodes = []
  node_map = {}
  frequencies.each { |val, frequency|
    node = LeafNode.new(val, frequency)
    nodes.push(node)

    node_map[val] = node
  }

  while nodes.length > 1
    nodes.sort_by! { |node| node.frequency }
    left = nodes[0]
    right = nodes[1]
    nodes = nodes.drop(2)

    node = NonLeafNode.new(left, right)
    nodes.push(node)

    left.parent = node
    right.parent = node
  end

  codes = {}
  root = nodes.first
  node_map.each { |val, node|
    code = ""
    n = node
    while n != root
      p = n.parent
      if p.left == n
        code = "1" + code
      else
        code = "0" + code
      end
      n = p
    end

    codes[val] = code
  }

  input_sequence.map { |val| codes[val] }.join
end

def huffman_decode(in_bytes)
end

class Node
  attr_accessor :parent
  attr_reader :frequency

  def initialize(frequency)
    @frequency = frequency
  end
end

class LeafNode < Node
  def initialize(val, frequency)
    super(frequency)
    @val = val
  end

  def to_s
    "leaf{val=#{@val},freq=#{@frequency}}"
  end
end

class NonLeafNode < Node
  attr_reader :left
  attr_reader :right

  def initialize(left, right)
    super(left.frequency + right.frequency)
    @left = left
    @right = right
  end

  def to_s
    "non-leaf{freq=#{@frequency}}"
  end
end
