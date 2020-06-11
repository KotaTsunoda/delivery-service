class Menus
  attr_reader :id, :name, :price, :time,:genre

  def initialize(id:, name:, price:, time:, genre:)
    @id = id
    @name = name
    @price = price
    @time = time
    @genre = genre
  end
end

