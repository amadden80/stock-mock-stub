require_relative 'stock'

describe 'Stock'  do
  describe '.quote' do

  end
  describe '#position' do
    it 'returns the position of the stock' do
      Stock.stub(:quote).and_return(5)
      stock = Stock.new('AAPL', 20)
      stock.position.should eq 100
    end
  end
end
