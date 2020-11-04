class CategoriesController < ApplicationController

  def index
    @items = Item.all.order(updated_at: 'DESC')  # 全商品の情報を取得
  end

  def search
    if params_search[:category_id] != "1" # カテゴリーが選択されていない場合は全てとする条件分岐
    @items = Item.where(category_id: params_search[:category_id]).order(updated_at: 'DESC')
    else
    @items = Item.all.order(updated_at: 'DESC')
    end
  end

  private
  def params_search
    params.permit(:category_id, :price)  # 検索オブジェクトを生成
  end
end
