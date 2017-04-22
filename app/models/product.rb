class Product < ActiveRecord::Base
  belongs_to :branch
  belongs_to :category

  delegate :name, prefix: true, to: :category

  validates :name, :price, :details, :category_id, :branch_id, presence: true


  scope :recent, -> { order("id DESC") }

  class << self
    def search_product(params)
      if params.blank? then all
      else
        self.by_text(params[:text])
        .by_category(params[:category_id])
        .by_branch(params[:branch_id])
      end.recent
    end

    def by_text(text)
      text.blank? ? all : where("name LIKE :text OR details LIKE :text", text: "%#{text}%")
    end

    def by_category(category_id)
      category_id.blank? ? all : where(category_id: category_id)
    end

    def by_branch(branch_id)
      branch_id.blank? ? all : where(branch_id: branch_id)
    end
  end
end
