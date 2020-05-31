class Menus
  attr_reader :id, :name, :price, :time,:genre
  def initialize(**params)
    @id = params[:id]
    @name = params[:name]
    @price = params[:price]
    @time = params[:time]
    @genre = params[:genre]
  end
end

