defmodule KitchenCalculator do
  def get_volume(volume_pair) do
    {_, volume} = volume_pair
    volume
  end

  def to_milliliter({:cup, _} = volume_pair) do
    {:milliliter, get_volume(volume_pair) * 240}
  end

  def to_milliliter({:fluid_ounce, _} = volume_pair) do
    {:milliliter, get_volume(volume_pair) * 30}
  end

  def to_milliliter({:teaspoon, _} = volume_pair) do
    {:milliliter, get_volume(volume_pair) * 5}
  end

  def to_milliliter({:tablespoon, _} = volume_pair) do
    {:milliliter, get_volume(volume_pair) * 15}
  end

  def to_milliliter({:milliliter, _} = volume_pair) do
    volume_pair
  end



  def from_milliliter(volume_pair, :cup = unit) do
    {unit, get_volume(volume_pair) / 240}
  end


  def from_milliliter(volume_pair, :fluid_ounce = unit) do
    {unit, get_volume(volume_pair) / 30}
  end


  def from_milliliter(volume_pair, :teaspoon = unit) do
    {unit, get_volume(volume_pair) / 5}
  end


  def from_milliliter(volume_pair, :tablespoon = unit) do
    {unit, get_volume(volume_pair) / 15}
  end


  def from_milliliter(volume_pair, :milliliter = _unit) do
    volume_pair
  end

  def convert(volume_pair, unit) do
    from_milliliter(to_milliliter(volume_pair), unit)
  end
end
