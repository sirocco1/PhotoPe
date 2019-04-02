# ポートフォリオ制作

DMMWEBCAMP 3ヶ月目の学習　ポートフォリオ制作です。ノンレスポンシブです。

・サイト名

「 PhotoPe 」

・どんなサイトか？

動物好きのSNSサービス（イメージは動物投稿専用のインスタグラム）

・制作理由

2ヶ月間のプログラミング学習で学んだスキルを存分に生かせ、新しい知識も多く学べるサイトを作りたいと思い...
その両方を満たせそうかなと考えて､SNS制作に決めました｡
SNS制作に決めた後テーマを動物特化型にしたのは､動物好きが集まり､投稿し合い､繋がるコミュニティがあったら､
楽しそうだなという思いと､同じように感じている人もいるかも知れないという想いから､このテーマにしました｡

・制作期間

2019年3月1日〜3月31日　丸1ヶ月間

・制作時のスキル

プログラミング学習を初めてから3ヶ月目

・導入機能

ユーザ管理機能

:ユーザ登録/編集/削除機能

:ログイン/ユーザ認証機能

投稿機能

:画像投稿/削除機能

:動画投稿/削除機能

:モーダルウィンドウ表示

:ヘッダー表示でどのページからでも投稿可

検索機能

:ジャンル検索機能

:ユーザ検索機能

:ユーザ検索はヘッダー表示でどのページからでも可

いいね機能

:いいね登録/解除機能

:非同期通信化

:いいねをくれた人の一覧をモーダルウィンドウ表示

フォローフォロワー機能

:フォロー登録/解除機能

コメント機能

:コメント投稿/削除機能

:非同期通信化

ダイレクトメッセージ機能

:メッセージ投稿/削除機能 (投稿者には即時反映/双方向通信は未対応)

管理機能

:各項目の管理機能を実装

ページャ機能

:ユーザ一覧/マイページの投稿/フォロー/フォロワー/いいねページに実装

無限スクロール機能

:投稿一覧ページに実装

リアルタイム文字数カウント機能

:ユーザ情報編集/投稿/コメント入力欄に実装

・使用したGEM

gem 'pry-rails' (デバック効率up)

gem 'devise' (新規登録/ログイン/ユーザ認証)

gem 'bootstrap-sass'

gem 'jquery-rails'

gem 'carrierwave' (画像/動画投稿)

gem 'mini_magick' (ファイルのリサイズ)

gem 'font-awesome-rails' (アイコン使用)

gem "jquery-turbolinks"

gem "kaminari" (ページャ機能/無限スクロール機能に使用)

gem 'ransack' (検索機能)

gem 'rails_admin' (管理者ページ作成)

gem 'cancancan' (管理者権限)