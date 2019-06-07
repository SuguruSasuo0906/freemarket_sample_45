class ItemsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    # 商品一覧表示をする為に、
    # モデルに定義したメソッドを使用し
    # カテゴリー毎のインスタンス変数の作成
    # limit(4)は４つ表示するということ    
    @ladies_items = Item.set_index(category_id: 150..336)
    @ladies_items_images = Image.where(item_id: @ladies_items.ids).order("id DESC")
    @mens_items = Item.set_index(category_id: 337..466)
    @mens_items_images = Image.where(item_id: @mens_items.ids).order("id DESC")
    @kids_items = Item.set_index(category_id: 467..585)
    @kids_items_images = Image.where(item_id: @kids_items.ids).order("id DESC")
    @cosme_items = Item.set_index(category_id: 865..952)
    @cosme_items_images = Image.where(item_id: @cosme_items.ids).order("id DESC")

    @shanel_items = Item.set_index(brand_id: 2)
    @shanel_items_images = Image.where(item_id: @shanel_items.ids).order("id DESC")
    @vuitton_items = Item.set_index(brand_id: 3)
    @vuitton_items_images = Image.where(item_id: @vuitton_items.ids).order("id DESC")
    @supreme_items = Item.set_index(brand_id: 4)
    @supreme_items_images = Image.where(item_id: @supreme_items.ids).order("id DESC")
    @nike_items = Item.set_index(brand_id: 5)
    @nike_items_images = Image.where(item_id: @nike_items.ids).order("id DESC")



  end

  def new
    @item = Item.new
    @item.images.build
    @category = Category.eager_load(children: :children).where(parent_id: nil)  
  end

  def create
    @item = Item.new(item_params)
    if @item.save!
      respond_to do |format|
        format.html {redirect_to root_path}
        format.json
      end
    end
  end

  def show
    
  end

  private

  def item_params
    params.require(:item).permit(:name, :description,:feewho,:shipment_day,:delivery,:size,:price,:prefecture_id,:brand_id,:category_id,:item_sold_id ,:item_state_id,:bland_id,images_attributes:[:name]).merge(user_id: current_user.id)
  end
end
