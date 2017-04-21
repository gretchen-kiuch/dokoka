module BranchManagersHelper
  def all_branches
    Branch.all.map { |b| [b.name, b.id] }
  end
end
