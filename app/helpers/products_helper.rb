module ProductsHelper
  def all_categories
    Category.all.map{ |c| [c.name, c.id] }
  end
end
