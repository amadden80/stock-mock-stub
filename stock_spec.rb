require_relative 'stock'

describe 'Stock'  do
  describe '.quote' do
    it 'returns stock quote' do
      symbol = 'AAPL'
      YahooFinance.should_receive(:get_quotes).with(YahooFinance::StandardQuote, symbol).and_return(quotes)
      Stock.quote(symbol).should eq 5
    end
  end
  describe '#position' do
    it 'returns the position of the stock' do
      Stock.stub(:quote).and_return(5)
      stock = Stock.new('AAPL', 20)
      stock.position.should eq 100
    end
  end

  def quotes
    {
      'AAPL' => YahooFinance::StandardQuote.new(['','', 5])
    }
  end
end
