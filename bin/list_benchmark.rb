require 'benchmark'
require_relative '../lib/list'

list = List::List.new(Fixnum)

list.add_last(1)
list.add_last(2)
list.add_last(3)
list.add_last(4)
list.add_last(5)
list.add_last(6)

arr = []
arr.push(11)
arr.push(12)
arr.push(13)
arr.push(14)
arr.push(15)
arr.push(16)

Benchmark.bm do |x|
  puts '  #add_last'
  x.report('insert to the end of list') { list.add_last(7) }
  x.report('insert to the end of array') { arr.push(17) }
  puts '  #add_first'
  x.report('insert to the begining of list') { list.add_first(0) }
  x.report('insert to the begining of array') { arr.insert(0, 0) }
  puts '  #add_at'
  x.report('insert in second place of list') { list.add_at(1, 1) }
  x.report('insert in second place of array') { arr.insert(1, 1) }
  x.report('insert in last place of list') { list.add_at(list.count, 1) }
  x.report('insert in last place of array') { arr.insert(arr.count, 1) }
  puts '  #remove'
  x.report('delete 0 from list') { list.remove(0) }
  x.report('delete 0 from array') { arr.delete(0) }
  x.report('delete 6 from list') { list.remove(6) }
  x.report('delete 16 from array') { arr.delete(16) }
  puts '  #remove_at'
  x.report('delete first element from list') { list.remove_at(0) }
  x.report('delete first element from array') { arr.delete_at(0) }
  puts '  #get_at'
  x.report('get second element from list') { list.get_at(1) }
  x.report('get second element from array') { arr[1] }
  puts '  #get_index'
  x.report('get index of 5 from list') { list.get_index(5) }
  x.report('get index of 15 from array') { arr.index(15) }
  puts '  #count'
  x.report('get length of list') { list.count }
  x.report('get length of array') { arr.length }
end
