# Circle Of Friend

# アプリケーション概要
- 概要  
共通の趣味を持つ仲間を作りたいと言う人にむけたアプリです。

# URL
https://circle-of-friend.herokuapp.com/

# テスト用アカウント
- ユーザー名  
admin
- パスワード  
28308

# 利用方法
- ユーザー作成  
新規登録より、必要なユーザー情報を記入することで作成できます。画像をアップするとプレビューすることができます。
- サークル作成  
トップページの「早速作成する」のボタンをクリックするとサークルを立ち上げることができます。必要な情報を記入し、最後に所属させたいユーザーを選択することができます。画像を選択する時に、プレビューすることができます。
- サークルに加入、退会する  
興味のあるサークルの詳細ページへと移動し、加入、もしくは退会のボタンをクリックすることでサークルの所属有無を切り替えることができます。
- 活動日誌  
サークルに所属していれば、サークルの活動日誌を作成できます。概要の写真はプレビューできます。また、テキストの途中に画像を挿入することができます。作成できたら、サークル詳細ページに一覧としてタイトルが表示されます。タイトルをクリックすると、投稿した記事を参照することができます。
- スケジュール機能  
サークルに所属していれば、サークルのスケジュールをカレンダーでみることができます。また、イベントを作成することができます。作成が完了したら、カレンダーにイベント名が表示されるので、それをクリックするとイベントの詳細を確認できます。また、詳細ではイベントへの出欠を登録することもできます。
- 検索
トップページの上部にあるテキストボックス、もしくはセレクトボックスでサークルの絞り込みを行えます。また、トップページ下部にあるジャンル一覧をクリックすることにより、ジャンルごとに検索を一発でできます。

# 課題解決
- 対象  
学生、社会人など立場関係なく、同じ趣味を持つ仲間を作りたい人へむけたものです。
- 作成背景  
私自身、社会人になっても同じ趣味を持つ仲間が欲しいと考えていたため、自分自身を使用者と定めて作成しました。
- 解決したかった課題  
1.自分の理想とするサークルを見つけやすいサイトが欲しい  
2.どんな活動をしているのか、どんな雰囲気なのか画像を多めで知りたい  
3.スケジュールをカレンダーで見やすく見たい  
- 解決したこと  
1.ジャンル検索やキーワード検索など多くの検索方法を用意したことで自分が理想とするサークルを検索しやすくしました。また、自分の都道府県がトップページの上部に表示されるように実装して見つけやすくしました。  
2.活動日誌のテキストの途中で画像を挿入できるようにしたことで、リアルな活動風景を見せられるようにしました。  
3.詳細ページにカレンダーを用意して、一眼でスケジュールを把握できるようにしました。  

# 洗い出した要件
- 実装機能一覧
	- サークルを立ち上げる機能
		- 目的  
		サークルを立ち上げて、仲間を増やすこと
		- 詳細  
		サークル名、何のサークルなのか紹介、年齢層、活動頻度、ジャンル。chatappのルーム機能を参考にする
		- ユースケース  
		ログイン後、トップページより立ち上げページに移動。サークル名、サークルの紹介を記入。
		- 見積もり
		5h
	- サークルの一覧を表示する機能
		- 目的  
		自分の目的にあったサークルを探すこと
		- 詳細  
		トップページ。サイトの説明と新規登録順のサークル。フリマアプリのトップページを参考にする
		- ユースケース  
		サイト自体の説明を見ることができる。サークルの新規順に見ることができる。検索を行い、見たいサークルを絞り込むことができる。
		- 見積もり
		3h
	- サークルを編集する機能
		- 目的  
		サークルの登録内容を変更すること
		- 詳細  
		サークル名、サークルの紹介文を編集できる
		- ユースケース  
		立ち上げの際に登録した情報を編集できる。立ち上げた本人（リーダー）出ないと編集できない
		- 見積もり
		4h
	- サークルを削除する機能
		- 目的  
		サークルが必要なくなった時に削除すること
		- 詳細  
		サークルを削除する。対応する中間テーブルも削除する。確認するようにalertを出す
		- ユースケース  
		リーダーでないと削除できない。
		- 見積もり
		4h
	- ユーザーを作成する機能
		- 目的  
		サークルを立ち上げたり操作をする上で必要となるため
		- 詳細  
		サークルを立ち上げたりログインしたり、様々な作業をする上で必要な機能。ニックネーム、email、パスワードを登録する。deviseを用いて作成する
		- ユースケース  
		新規登録ボタンを押すと左記の情報で登録を行う。ログインボタンではemailとパスワードでログインできる
		- 見積もり
		3h
	- レポートを作成する機能
		- 目的  
		サークルがどのような活動を行っているのか可視化するため
		- 詳細  
		ツイートのように投稿することができる。レポートのタイトル、内容を登録。ピックツイートを参考にする
		- ユースケース  
		作成ページで投稿できる。投稿できるのはそのサークルに所属しているユーザーのみ。左記の情報で登録できるようにする。画像をテンプルすることもできる。作成できるのはサークルに所属しているユーザーのみ
		- 見積もり
		4h
	- レポート詳細ページ
		- 目的  
		サークルの活動内容を見れる
		- 詳細  
		作成したレポートを見ることができる
		- ユースケース  
		サークル詳細ページからアクセスすることができる。誰でも閲覧可能
		- 見積もり
		4h
	- レポートを編集する機能
		- 目的  
		レポートの内容を編集するため
		- 詳細  
		レポートの内容を編集できるようにする
		- ユースケース  
		投稿したレポートを編集できる。編集できるのはレポートを投稿した本人のみ
		- 見積もり
		4h
	- レポートを削除する機能
		- 目的  
		レポートを削除するため
		- 詳細  
		レポートを削除する
		- ユースケース  
		投稿したレポートを削除できる。削除できるのは、レポートを投稿した本人のみ
		- 見積もり
		4h
	- 検索機能
		- 目的  
		目的にあったサークルを探しやすくするため
		- 詳細  
		ransackを使用して簡易的に実装
		- ユースケース  
		トップページでタグを検索できる。ジャンル一覧のジャンルをクリックするとジャンルごとに絞り込める。
		- 見積もり
		5h
	- スケジュール作成機能
		- 目的  
		サークルの活動をカレンダー形式でみれるようにするため
		- 詳細  
		重要度を選択する。活動内容のタイトルを記載する。活動内容の詳細を記載する
		- ユースケース  
		スケジュール作成をクリックすると作成ページへ遷移。タイトル、詳細、重要度を選択する
		- 見積もり
		5h
	- スケジュール閲覧機能
		- 目的  
		サークルの活動日程をカレンダー形式でみれる
		- 詳細  
		カレンダーを導入して、重要度によって色分けしてみれるようにする
		- ユースケース  
		サークル詳細ページに一覧が記載されている。スケジュールはサークルのメンバーの見れる
		- 見積もり
		5h
	- スケジュール詳細機能
		- 目的  
		サークルの活動予定の詳細を見れる
		- 詳細  
		活動内容の詳細を見れる。イベントへの参加する人を表示する
		- ユースケース  
		一覧のスケジュールをクリックすると遷移できる。非同期で参加の有無をチェックできる。
		- 見積もり
		4h	
	- スケジュール削除機能
		- 目的  
		サークルの活動予定を削除できる
		- 詳細  
		活動予定を削除できる
		- ユースケース  
		スケジュールを削除する。登録者だけができる
		- 見積もり
		3h
	- サークル加入機能
		- 目的  
		ユーザーがサークルに加入、退会できる
		- 詳細  
		circleのusersに値を入れる。
		- ユースケース  
		詳細ページの加入を押すとサークルに所属できる。また、退会を押すと退会できる。
		- 見積もり
		5h

# データベース設計
[ER図](https://drive.google.com/file/d/1-WpVKz8Y8kmPg15aHCO6YipT_iajtOiK/view?usp=sharing)
## User

| Column | Type | Options |
| ------ | ---- | ------- |
| nickname | string | null:false |
| email | string | null:false |
| password | string | null:false |

## Association
- has_many :circles, through :user_circles
- has_many :user_circles
- has_many :articles
- has_many :events, through :user_events
- has_many :user_events
- has_one_attached :avatar

## Circle
| Column | Type | Options |
| ------ | ---- | ------- |
| name | string | null:false |
| phrase | string | null:false |
| description | text | null:false |
| genre_id | integer | null:false |
| activity |string | null:false |
| age_range | string | null:false |
| prefecture_id | integer | null:false |
| city | string | null:false |

## Association
- has_many :users, through :user_circles
- has_many :user_circles
- has_many :articles
- has_many :events
- has_one_attached :image

## UserCircle
| Column | Type | Options |
| ------ | ---- | ------- |
| user | references | null:false, foreign_key: true |
| circle | references | null:false, foreign_key: true |
| leader | boolean | default:false, null:false |

## Association
- belongs_to :user
- belongs_to :circle

## Article
| Column | Type | Options |
| ------ | ---- | ------- |
| title | string | null:false |
| user | references | null:false, foreign_key: true |
| circle | references | null:false, foreign_key: true |

## Association
- belongs_to :user
- belongs_to :circle
- has_rich_text :content
- has_one_attached :image

## Event
| Column | Type | Options |
| ------ | ---- | ------- |
| title | string | null:false |
| body | text | null:false |
| start_date | datetime | null:false |
| end_date | datetime | null:false |
| circle | references | null:false, foreign_key: true |

## Association
- has_many :users, through :user_events
- has_many :user_events
- belongs_to :circle

## UserEvent
| Column | Type | Options |
| ------ | ---- | ------- |
| user | references | null:false, foreign_key: true |
| event | references | null:false, foreign_key: true |
| author | boolean | default:false, null:false |

## Association
- belongs_to :user
- belongs_to :event

# ローカルでの動作方法
- 以下のコマンドでクローンを作成してください。
```
git clone https://github.com/miracle-halation/circle_of_friends.git
```
- データベースを作成してください
```
rails db:create
```

- データベースをマイグレートしてください
```
rails db:migrate
```

- 環境変数を格納してください  
ターミナル
```
% vim ~/.zshrc
# .zshrcを開いたら、「i」とタイプしてインサートモードに移行

# .zshrcの内部に次の記述を追加
export BASIC_AUTH_USER='admin'
export BASIC_AUTH_PASSWORD='2222'
# 記述を追加したら、escキーを押してインサートモードを抜け、 `:wq `と入力して保存して終了する

# .zshrcを再読み込みし、定義した環境変数を有効にする
% source ~/.zshrc
```

