class Recipe < ApplicationRecord
  has_many :favorites, dependent: :destroy
  has_many :steps, dependent: :destroy
  has_many :ingredients, dependent: :destroy
  has_many :recipe_mikans, dependent: :destroy
  accepts_nested_attributes_for :ingredients, allow_destroy: true
  accepts_nested_attributes_for :steps, allow_destroy: true
  accepts_nested_attributes_for :recipe_mikans, allow_destroy: true
  
  # belongs_to :recipe_tag
  belongs_to :user
  has_many :recipe_tags, dependent: :destroy
  has_many :tags, through: :recipe_tag
  has_many_attached :image
   enum genre: { 'おかず': 0, 'デザート': 1, 'その他': 2 }
   
  def save_tags(tags)
    # タグをスペース区切りで分割し配列にする
    #   連続した空白も対応するので、最後の“+”がポイント
    tag_list = tags.split(/[[:blank:]]+/)
    # 自分自身に関連づいたタグを取得する
    current_tags = self.tags.pluck(:name)
    #   -- 記事更新時に削除されたタグ
    old_tags = current_tags - tag_list
    
    # (2) 投稿されたタグと元々自分に紐付いていたタグの差分を抽出
    #   -- 新規に追加されたタグ
    new_tags = tag_list - current_tags
    # tag_mapsテーブルから、(1)のタグを削除
    #   tagsテーブルから該当のタグを探し出して削除する
    old_tags.each do |old|
      # tag_mapsテーブルにあるrecipe_idとtag_idを削除
      #   後続のfind_byでtag_idを検索
      self.tags.delete Tag.find_by(name: old)
    end
    # tagsテーブルから(2)のタグを探して、recipe_tagsテーブルにtag_idを追加する
    new_tags.each do |new|
      # 条件のレコードを初めの1件を取得し1件もなければ作成する
      # find_or_create_by : https://railsdoc.com/page/find_or_create_by
      new_recipe_tag = Tag.find_or_create_by(name: new)

      # recipe_tagsテーブルにpost_idとtag_idを保存
      #   配列追加のようにレコードを渡すことで新規レコード作成が可能
      self.tags << new_recipe_tag
    end    
  end
  
 
  
  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end
end
