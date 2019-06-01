class ItemsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    # 商品一覧表示をする為に、
    # モデルに定義したメソッドを使用し
    # カテゴリー毎のインスタンス変数の作成
    @ladies_item = 
  end

  def new
    @item = Item.new
    @category = Category.eager_load(children: :children).where(parent_id: nil)  
  end

  def create
    @item = Item.new(item_params)
    #Itemテーブルに紐づいているImageテーブルを引っ張れるようにする
    @item_image = @item.images.build 
    # JSより送られてきたimages[data[]]の配列をstrongparameterで許可をし、
    # params[:images][:data].each do |pic|で配列の個数分@item_image[:data] = pic.read.delete("\000")を繰り返す
    params[:images][:data].each do |pic|
      # pic.readで画像データのバイナリを読み込み,.delete("\000")でデータ内のnull文字を削除する。
      # null文字を消さないと、Argumenterror(path name contains null byte)が出る
      # 読み込んだ画像データをimageテーブルのdataカラムに渡す
      @item_image[:data] = pic.read.delete("\000")
    end
    if @item.save!
      respond_to do |format|
        format.html {redirect_to root_path}
        format.json 
      end
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :description,:feewho,:shipment_day,:delivery,:size,:price,:prefecture_id,:brand_id,:category_id,:item_sold_id ,:item_state_id,:bland_id,images_attributes:[:id,:item_id,:data]).merge(user_id: current_user.id)
  end
end
