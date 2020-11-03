class UsersController < ApplicationController
  def show
    # カード登録機能オミット中
    # Payjp.api_key = ENV["PAYJP_SECRET_KEY"] # 環境変数を読み込む
    # card = Card.find_by(user_id: current_user.id)

    # customer = Payjp::Customer.retrieve(card.customer_token) # 先程のカード情報を元に、顧客情報を取得
    # @card = customer.cards.first
  end
end
