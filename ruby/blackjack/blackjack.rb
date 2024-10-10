module Blackjack

  CARDS = {
    'ace' => 11,
    'two' => 2,
    'three' => 3,
    'four' => 4,
    'five' => 5,
    'six' => 6,
    'seven' => 7,
    'eight' => 8,
    'nine' => 9,
    'ten' => 10,
    'jack' => 10,
    'queen' => 10,
    'king' => 10
  }.freeze

  private_constant :CARDS

  class << self

    def parse_card(card)
      CARDS.fetch(card, 0)
    end

    def card_range(card1, card2)
      case parse_card(card1) + parse_card(card2)
      when 4..11 then 'low'
      when 12..16 then 'mid'
      when 17..20 then 'high'
      when 21 then 'blackjack'
      when 22 then 'two aces'
      end
    end

    def first_turn(card1, card2, dealer_card)
      case card_range(card1, card2)
      when 'two aces'
        'P'  # Split
      when 'low'
        'H'  # Hit
      when 'high'
        'S'  # Stand
      when 'mid'
        parse_card(dealer_card) >= 7 ? 'H' : 'S'
      when 'blackjack'
        parse_card(dealer_card) < 10 ? 'W' : 'S'
      end
    end

  end

end
