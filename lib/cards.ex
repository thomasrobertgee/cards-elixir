defmodule Cards do # module
  def create_deck do # method
    values = ["Ace", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine", "Ten", "Jack", "Queen", "King"]
    suits = ["Spades", "Clubs", "Hearts", "Diamonds"]

    for suit <- suits, value <- values do # multiple comprehensions
        "#{value} of #{suit}"
    end


  end

  def shuffle(deck) do # passing an arguement to a method (same as any other langauge)
    Enum.shuffle(deck)
  end

  def contains?(deck, card) do
    Enum.member?(deck, card)
  end

  def deal(deck, hand_size) do
    Enum.split(deck, hand_size)
  end

  def save(deck, filename) do
    binary = :erlang.term_to_binary(deck) # check out docs for erlang
    File.write(filename, binary)
  end

  def load(filename) do
    case File.read(filename) do
      {:ok, binary} -> :erlang.binary_to_term binary
      # :foo is an atom, used throughout elixir to handling status codes or messages or control flow - exactly like strings
      # something you would want to codify messages
      {:error, _reason}-> "That file does not exist"
    end
  end
end
