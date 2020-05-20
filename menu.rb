class Menus
  attr_reader :id, :name, :price, :time
  def initialize(**params)
    @id = params[:id]
    @name = params[:name]
    @price = params[:price]
    @time = params[:time]
  end
end