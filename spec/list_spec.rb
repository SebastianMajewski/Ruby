require 'simplecov'
SimpleCov.start

require 'list'

RSpec.describe 'list.rb' do
  let(:list) { List::List.new(Fixnum) }
  describe '#constructor' do
    it 'is defined' do
      expect { List::List.new(Fixnum) }.not_to raise_error
    end
    it 'init with good type' do
      expect(list.type).to eq Fixnum
    end
    it 'init with no value' do
      expect(list.start).to eq nil
    end
  end
  describe '#add_last' do
    it 'should add one if empty' do
      list.add_last(2)
      expect(list.count).to eq 1
    end
    it 'should add 3 as first' do
      list.add_last(3)
      expect(list.start.node).to eq 3
    end
    it 'should add 1 as first' do
      list.add_last(1)
      list.add_last(2)
      expect(list.start.node).to eq 1
    end
  end
  describe '#add_first' do
    it 'should add one if empty' do
      list.add_first(1)
      expect(list.count).to eq 1
    end
    it 'should add 3 as first' do
      list.add_first(3)
      expect(list.start.node).to eq 3
    end
    it 'should add 2 as first' do
      list.add_first(1)
      list.add_first(2)
      expect(list.start.node).to eq 2
    end
  end
  describe '#add_at' do
    it 'should raise error if index is wrong' do
      expect { list.add_at(1, 1) }.to raise_error('Nieprawidlowy index')
    end
    it 'should not to raise error if index is right' do
      expect { list.add_at(1, 0) }.not_to raise_error
    end
    it 'should add 2 as second' do
      list.add_at(1, 0)
      list.add_at(3, 1)
      list.add_at(2, 1)
      expect(list.start.next.node).to eq 2
    end
    it 'should add one if empty' do
      list.add_at(1, 0)
      expect(list.count).to eq 1
    end
  end
  describe '#remove' do
    it 'should not to raise error when empty' do
      expect { list.remove(2) }.not_to raise_error
    end
    it 'should not to raise error when element is not in not empty list ' do
      list.add_first(1)
      expect { list.remove(2) }.not_to raise_error
    end
    it 'should remove one if element is in list' do
      list.add_first(2)
      list.add_first(1)
      list.remove(2)
      expect(list.count).to eq 1
    end
    it 'should be 3 as second when delete 2' do
      list.add_last(1)
      list.add_last(2)
      list.add_last(3)
      list.remove(2)
      expect(list.start.next.node).to eq 3
    end
  end
  describe '#remove_at' do
    it 'should raise error when index is wrong' do
      expect { list.remove_at(2) }.to raise_error('Nieprawidlowy index')
    end
    it 'should not to raise error when index is right' do
      list.add_last(1)
      list.add_last(2)
      list.add_last(3)
      expect { list.remove_at(2) }.not_to raise_error
    end
    it 'should should be 3 as second when delete second element' do
      list.add_last(1)
      list.add_last(2)
      list.add_last(3)
      list.remove_at(1)
      expect(list.start.next.node).to eq 3
    end
    it 'should remove one if index is right' do
      list.add_first(2)
      list.add_first(1)
      list.remove_at(1)
      expect(list.count).to eq 1
    end
  end
end
