class ItemsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index

    # 商品一覧表示をする為に、
    # モデルに定義したメソッドを使用し
    # カテゴリー毎のインスタンス変数の作成
    # limit(4)は４つ表示するということ
    
    @ladies_item = Item.set_index(category_id: 150..336)
    @ladies_items_image = Image.where(item_id: @ladies_item.ids).order("id DESC")
    @mens_item = Item.set_index(category_id: 337..466)
    @mens_items_image = Image.where(item_id: @mens_item.ids).order("id DESC")
    @kids_item = Item.set_index(category_id: 467..585)
    @kids_items_image = Image.where(item_id: @kids_item.ids).order("id DESC")
    @cosme_item = Item.set_index(category_id: 865..952)
    @cosme_items_image = Image.where(item_id: @cosme_item.ids).order("id DESC")

    @shanel_item = Item.set_index(brand_id: 2)
    @shanel_items_image = Image.where(item_id: @shanel_item.ids).order("id DESC")
    @vuitton_item = Item.set_index(brand_id: 3)
    @vuitton_items_image = Image.where(item_id: @vuitton_item.ids).order("id DESC")
    @supreme_item = Item.set_index(brand_id: 4)
    @supreme_items_image = Image.where(item_id: @supreme_item.ids).order("id DESC")
    @nike_item = Item.set_index(brand_id: 5)
    @nike_items_image = Image.where(item_id: @nike_item.ids).order("id DESC")
    
  end

  def new
    @item = Item.new
    @item.images.build
    @category = Category.eager_load(children: :children).where(parent_id: nil) 
    @message = Message.new
  end

  def create
    @item = Item.new(item_params)
    if @item.price > 300 && @item.price < 999
      @item.pricegtlt_id = 1
    elsif @item.price > 1000 && @item.price < 4999
      @item.pricegtlt_id = 2
    elsif @item.price > 5000 && @item.price < 9999
      @item.pricegtlt_id = 3
    elsif @item.price > 10000 && @item.price < 29999
      @item.pricegtlt_id = 4
    elsif @item.price > 30000 && @item.price < 49999
      @item.pricegtlt_id = 5
    elsif @item.price > 50000
      @item.pricegtlt_id = 6
    end
    if @item.save!
      respond_to do |format|
        format.html {redirect_to root_path}
        format.json
      end
    end
  end

  def show
    @item_all = Item.all.includes(:user,:brand,:item_sold,:item_state,:prefecture,:category,:images)
    @item = @item_all.find(params[:id])
    @image = @item.images
    @category_gchild = @item.category
    @category_child = Category.find(@category_gchild.parent_id)
    @category = Category.find(@category_child.parent_id)
    @message = Message.new

    @user_items = Item.where(user_id: current_user.id).limit(6).order("created_at DESC")
    @user_images = Image.where(item_id: @user_items.ids).limit(6).order("id DESC")

    @another_items = Item.where(category_id: @item.category_id,brand_id: @item.brand_id).limit(6).order("created_at DESC")
    @another_images = Image.where(item_id: @another_items.ids).limit(6).order("id DESC")
  end

  def search
    if params[:q].present?
      @q = Item.ransack(params[:q])
      @brands = Brand.all
      @pricegtlt = Pricegtlt.all
      @items = @q.result(distinct: true).includes(:brand,:pricegtlt,:images)
    else
      params[:q] = {sorts: 'id desc'}
      @q = Item.ransack()
      @items = @q.result
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :description,:feewho,:shipment_day,:delivery,:size,:price,:prefecture_id,:brand_id,:category_id,:item_sold_id ,:item_state_id,:bland_id,images_attributes:[:name]).merge(user_id: current_user.id)
  end

  def message_params
    # params.require(:message).permit(:comment,:item_id).merge(user_id: current_user.id)
  end
end
