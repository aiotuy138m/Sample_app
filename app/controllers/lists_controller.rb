class ListsController < ApplicationController
  def new
    @list=List.new
  end

  def create
    @list=List.new(list_params)
    if @list.save
      flash[:notice]="投稿が成功しました"
      redirect_to list_path(@list.id)
    else
      render:new
    end
  end

  def index
    @lists=List.all
    #すべてのレコードを取得するため
    #インスタンス変数を複数形で設定している。
  end

  def show
    @list=List.find(params[:id])
    #今回はレコード１件だけ取得するため単数形にしている。
  end

  def edit
    @list=List.find(params[:id])
  end
  
  def update
    list=List.find(params[:id])
    list.update(list_params)
    redirect_to list_path(list.id)
  end
  
  def destroy
    list=List.find(params[:id])
    list.destroy
    redirect_to '/lists'
  end
  
  private
  #ストロングパラメータ。マスアサインメント脆弱性を防ぐための仕組み
  def list_params
    params.require(:list).permit(:title, :body, :image)
  end
  
end
