require 'yahoofinance'

class Stock
  attr_accessor :symbol, :shares

  def initialize(symbol, shares)
    @symbol = symbol
    @shares = shares
  end

  def buy(shares)
    @shares += shares
  end

  def sell(shares)
    @shares -= shares if shares <= @shares
  end

  def position
     Stock.quote(@symbol) * @shares
  end

  def to_s
    "Purchased #{@shares} shares of #{@symbol} worth $#{position.round}"
  end

  def Stock.quote(symbol)
    YahooFinance::get_quotes(YahooFinance::StandardQuote, symbol)[symbol].lastTrade
  end
end
