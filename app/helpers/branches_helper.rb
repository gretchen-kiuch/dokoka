module BranchesHelper
  def all_stores
    Store.all.map { |s| [s.name, s.id] }
  end
end
