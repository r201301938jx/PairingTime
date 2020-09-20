# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#管理者

Admin.create!(
  email: 'admin@test.com',
  password: 'password'
)

#会員10名

Customer.create!(
  last_name: "鈴木",
  first_name: "太郎",
  last_name_kana: "スズキ",
  first_name_kana: "タロウ",
  nickname: "タロー",
  profile_image: open("./app/assets/images/customer1.jpg") ,
  phone_number: "09011112222",
  email: "1@test.com",
  password: "password",
  created_at: 10.days.ago
)

Customer.create!(
  last_name: "田中",
  first_name: "恵美",
  last_name_kana: "タナカ",
  first_name_kana: "エミ",
  nickname: "エミ",
  profile_image: open("./app/assets/images/customer2.jpg") ,
  phone_number: "08033334444",
  email: "2@test.com",
  password: "password",
  created_at: 10.days.ago
)

Customer.create!(
  last_name: "久保",
  first_name: "太一",
  last_name_kana: "クボ",
  first_name_kana: "タイチ",
  nickname: "タイチ",
  profile_image: open("./app/assets/images/customer3.jpg") ,
  phone_number: "09055556666",
  email: "3@test.com",
  password: "password",
  created_at: 15.days.ago
)

Customer.create!(
  last_name: "本多",
  first_name: "梨沙",
  last_name_kana: "ホンダ",
  first_name_kana: "リサ",
  nickname: "リサ",
  profile_image: open("./app/assets/images/customer4.jpg") ,
  phone_number: "09077778888",
  email: "4@test.com",
  password: "password",
  created_at: 15.days.ago
)

Customer.create!(
  last_name: "坂本",
  first_name: "次郎",
  last_name_kana: "サカモト",
  first_name_kana: "ジロウ",
  nickname: "ジロー",
  profile_image: open("./app/assets/images/customer5.jpg") ,
  phone_number: "09011112222",
  email: "5@test.com",
  password: "password",
  created_at: 14.days.ago
)

Customer.create!(
  last_name: "大谷",
  first_name: "文子",
  last_name_kana: "オオタニ",
  first_name_kana: "フミコ",
  nickname: "フミ",
  profile_image: open("./app/assets/images/customer6.jpg") ,
  phone_number: "09011112222",
  email: "6@test.com",
  password: "password",
  created_at: 13.days.ago
)

Customer.create!(
  last_name: "中田",
  first_name: "圭介",
  last_name_kana: "ナカタ",
  first_name_kana: "ケイスケ",
  nickname: "ケイスケ",
  profile_image: open("./app/assets/images/customer7.jpg") ,
  phone_number: "09011112222",
  email: "7@test.com",
  password: "password",
  created_at: 13.days.ago
)

Customer.create!(
  last_name: "岡本",
  first_name: "智美",
  last_name_kana: "オカモト",
  first_name_kana: "トモミ",
  nickname: "トモちゃん",
  profile_image: open("./app/assets/images/customer8.jpg") ,
  phone_number: "09011112222",
  email: "8@test.com",
  password: "password",
  created_at: 12.days.ago
)

Customer.create!(
  last_name: "石井",
  first_name: "卓郎",
  last_name_kana: "イシイ",
  first_name_kana: "タクロウ",
  nickname: "イッシー",
  profile_image: open("./app/assets/images/customer9.jpg") ,
  phone_number: "09011112222",
  email: "9@test.com",
  password: "password",
  created_at: 11.days.ago
)

Customer.create!(
  last_name: "大田",
  first_name: "巧",
  last_name_kana: "オオタ",
  first_name_kana: "タクミ",
  nickname: "タックー",
  profile_image: open("./app/assets/images/customer10.jpg") ,
  phone_number: "09011112222",
  email: "10@test.com",
  password: "password",
  created_at: 11.days.ago
)

#ペア15個

Pair.create!(
  customer_id: 1,
  title: "チョコレートクッキーとカプチーノ",
  image: open("./app/assets/images/pair1.jpg"),
  caption: "チョコレートクッキーとカプチーノ",
  created_at: 10.days.ago
)

Pair.create!(
  customer_id: 1,
  title: "クロワッサンとエスプレッソ",
  image: open("./app/assets/images/pair2.jpg"),
  caption: "クロワッサンとエスプレッソ",
  created_at: 10.days.ago
)

Pair.create!(
  customer_id: 2,
  title: "チョコレートマカロンとコーヒー",
  image: open("./app/assets/images/pair3.jpg"),
  caption: "チョコレートマカロンとコーヒー",
  created_at: 9.days.ago
)

Pair.create!(
  customer_id: 2,
  title: "ハムサンドとアイスラテ",
  image: open("./app/assets/images/pair4.jpg"),
  caption: "ハムサンドとアイスラテ",
  created_at: 8.days.ago
)

Pair.create!(
  customer_id: 3,
  title: "ブルーベリーケーキとカフェラテ",
  image: open("./app/assets/images/pair5.jpg"),
  caption: "ブルーベリーケーキとカフェラテ",
  created_at: 9.days.ago
)

Pair.create!(
  customer_id: 3,
  title: "マカロンとコーヒー",
  image: open("./app/assets/images/pair6.jpg"),
  caption: "マカロンとコーヒー",
  created_at: 7.days.ago
)

Pair.create!(
  customer_id: 4,
  title: "アボカドサンドとアイスラテ",
  image: open("./app/assets/images/pair7.jpg"),
  caption: "アボカドサンドとアイスラテ",
  created_at: 6.days.ago
)

Pair.create!(
  customer_id: 4,
  title: "チョコクロワッサンとアイスラテ",
  image: open("./app/assets/images/pair8.jpg"),
  caption: "チョコクロワッサンとアイスラテ",
  created_at: 7.days.ago
)

Pair.create!(
  customer_id: 4,
  title: "板チョコとコーヒー",
  image: open("./app/assets/images/pair9.jpg"),
  caption: "板チョコとコーヒー",
  created_at: 8.days.ago
)

Pair.create!(
  customer_id: 4,
  title: "アップルパイとアールグレイティー",
  image: open("./app/assets/images/pair10.jpg"),
  caption: "アップルパイとアールグレイティー",
  created_at: 9.days.ago
)

Pair.create!(
  customer_id: 5,
  title: "チョコクッキーとココア",
  image: open("./app/assets/images/pair11.jpg"),
  caption: "チョコクッキーとココア",
  created_at: 8.days.ago
)

Pair.create!(
  customer_id: 5,
  title: "バタークッキーとココア",
  image: open("./app/assets/images/pair12.jpg"),
  caption: "バタークッキーとココア",
  created_at: 7.days.ago
)

Pair.create!(
  customer_id: 6,
  title: "ブルーベリーマフィンとカフェラテ",
  image: open("./app/assets/images/pair13.jpg"),
  caption: "ブルーベリーマフィンとカフェラテ",
  created_at: 8.days.ago
)

Pair.create!(
  customer_id: 7,
  title: "ビスケットとルイボスティー",
  image: open("./app/assets/images/pair14.jpg"),
  caption: "ビスケットとルイボスティー",
  created_at: 9.days.ago
)

Pair.create!(
  customer_id: 8,
  title: "バナナパンケーキとホットティー",
  image: open("./app/assets/images/pair15.jpg"),
  caption: "バナナパンケーキとホットティー",
  created_at: 6.days.ago
)

#タグ24個

Tag.create!(
  name: "チョコレート"
)

Tag.create!(
  name: "クッキー"
)

Tag.create!(
  name: "カプチーノ"
)

Tag.create!(
  name: "クロワッサン"
)

Tag.create!(
  name: "エスプレッソ"
)

Tag.create!(
  name: "マカロン"
)

Tag.create!(
  name: "コーヒー"
)

Tag.create!(
  name: "サンドウィッチ"
)

Tag.create!(
  name: "カフェラテ"
)

Tag.create!(
  name: "ブルーベリー"
)

Tag.create!(
  name: "ケーキ"
)

Tag.create!(
  name: "板チョコ"
)

Tag.create!(
  name: "ティー"
)

Tag.create!(
  name: "アップルパイ"
)

Tag.create!(
  name: "リンゴ"
)

Tag.create!(
  name: "アールグレイ"
)

Tag.create!(
  name: "ココア"
)

Tag.create!(
  name: "バター"
)

Tag.create!(
  name: "マフィン"
)

Tag.create!(
  name: "ルイボスティー"
)

Tag.create!(
  name: "ビスケット"
)

Tag.create!(
  name: "パンケーキ"
)

Tag.create!(
  name: "ハニー"
)

Tag.create!(
  name: "バナナ"
)

#タグ紐づけ

Tagging.create!(
  tag_id: 1,
  pair_id: 1
)

Tagging.create!(
  tag_id: 1,
  pair_id: 3
)

Tagging.create!(
  tag_id: 1,
  pair_id: 8
)

Tagging.create!(
  tag_id: 1,
  pair_id: 9
)

Tagging.create!(
  tag_id: 1,
  pair_id: 11
)

Tagging.create!(
  tag_id: 2,
  pair_id: 1
)

Tagging.create!(
  tag_id: 2,
  pair_id: 11
)

Tagging.create!(
  tag_id: 2,
  pair_id: 12
)

Tagging.create!(
  tag_id: 3,
  pair_id: 1
)

Tagging.create!(
  tag_id: 4,
  pair_id: 2
)

Tagging.create!(
  tag_id: 4,
  pair_id: 8
)

Tagging.create!(
  tag_id: 5,
  pair_id: 2
)

Tagging.create!(
  tag_id: 6,
  pair_id: 3
)

Tagging.create!(
  tag_id: 6,
  pair_id: 6
)

Tagging.create!(
  tag_id: 7,
  pair_id: 3
)

Tagging.create!(
  tag_id: 7,
  pair_id: 6
)

Tagging.create!(
  tag_id: 7,
  pair_id: 9
)

Tagging.create!(
  tag_id: 8,
  pair_id: 4
)

Tagging.create!(
  tag_id: 8,
  pair_id: 7
)

Tagging.create!(
  tag_id: 9,
  pair_id: 4
)

Tagging.create!(
  tag_id: 9,
  pair_id: 5
)

Tagging.create!(
  tag_id: 9,
  pair_id: 8
)

Tagging.create!(
  tag_id: 9,
  pair_id: 13
)

Tagging.create!(
  tag_id: 10,
  pair_id: 5
)

Tagging.create!(
  tag_id: 10,
  pair_id: 13
)

Tagging.create!(
  tag_id: 11,
  pair_id: 5
)

Tagging.create!(
  tag_id: 12,
  pair_id: 9
)

Tagging.create!(
  tag_id: 13,
  pair_id: 10
)

Tagging.create!(
  tag_id: 13,
  pair_id: 14
)

Tagging.create!(
  tag_id: 13,
  pair_id: 15
)

Tagging.create!(
  tag_id: 14,
  pair_id: 10
)

Tagging.create!(
  tag_id: 15,
  pair_id: 10
)

Tagging.create!(
  tag_id: 16,
  pair_id: 11
)

Tagging.create!(
  tag_id: 16,
  pair_id: 12
)

Tagging.create!(
  tag_id: 17,
  pair_id: 12
)

Tagging.create!(
  tag_id: 18,
  pair_id: 13
)

Tagging.create!(
  tag_id: 19,
  pair_id: 14
)

Tagging.create!(
  tag_id: 20,
  pair_id: 14
)

Tagging.create!(
  tag_id: 21,
  pair_id: 14
)

Tagging.create!(
  tag_id: 22,
  pair_id: 15
)

Tagging.create!(
  tag_id: 23,
  pair_id: 15
)

Tagging.create!(
  tag_id: 24,
  pair_id: 15
)

#お気に入り

Like.create!(
  customer_id: 1,
  pair_id: 2,
  created_at: 5.days.ago
)

Like.create!(
  customer_id: 1,
  pair_id: 4,
  created_at: 4.days.ago
)

Like.create!(
  customer_id: 1,
  pair_id: 7,
  created_at: 3.days.ago
)

Like.create!(
  customer_id: 2,
  pair_id: 1,
  created_at: 3.days.ago
)

Like.create!(
  customer_id: 2,
  pair_id: 5,
  created_at: 2.days.ago
)

Like.create!(
  customer_id: 2,
  pair_id: 4,
  created_at: 4.days.ago
)

Like.create!(
  customer_id: 3,
  pair_id: 1,
  created_at: 3.days.ago
)

Like.create!(
  customer_id: 3,
  pair_id: 2,
  created_at: 2.days.ago
)

Like.create!(
  customer_id: 3,
  pair_id: 4,
  created_at: 2.days.ago
)

Like.create!(
  customer_id: 4,
  pair_id: 5,
  created_at: 4.days.ago
)

Like.create!(
  customer_id: 4,
  pair_id: 8,
  created_at: 3.days.ago
)

Like.create!(
  customer_id: 5,
  pair_id: 1,
  created_at: 2.days.ago
)

Like.create!(
  customer_id: 5,
  pair_id: 3,
  created_at: 3.days.ago
)

Like.create!(
  customer_id: 5,
  pair_id: 5,
  created_at: 4.days.ago
)

Like.create!(
  customer_id: 5,
  pair_id: 7,
  created_at: 2.days.ago
)

Like.create!(
  customer_id: 6,
  pair_id: 1,
  created_at: 3.days.ago
)

Like.create!(
  customer_id: 6,
  pair_id: 2,
  created_at: 3.days.ago
)

Like.create!(
  customer_id: 6,
  pair_id: 4,
  created_at: 2.days.ago
)

Like.create!(
  customer_id: 6,
  pair_id: 6,
  created_at: 4.days.ago
)

Like.create!(
  customer_id: 6,
  pair_id: 8,
  created_at: 2.days.ago
)

Like.create!(
  customer_id: 7,
  pair_id: 1,
  created_at: 1.days.ago
)

Like.create!(
  customer_id: 7,
  pair_id: 2,
  created_at: 1.days.ago
)

Like.create!(
  customer_id: 7,
  pair_id: 3,
  created_at: 3.days.ago
)

Like.create!(
  customer_id: 7,
  pair_id: 5,
  created_at: 4.days.ago
)

Like.create!(
  customer_id: 7,
  pair_id: 7,
  created_at: 4.days.ago
)

Like.create!(
  customer_id: 8,
  pair_id: 1,
  created_at: 3.days.ago
)

Like.create!(
  customer_id: 8,
  pair_id: 2,
  created_at: 2.days.ago
)

Like.create!(
  customer_id: 8,
  pair_id: 3,
  created_at: 1.days.ago
)

Like.create!(
  customer_id: 8,
  pair_id: 4,
  created_at: 4.days.ago
)

Like.create!(
  customer_id: 8,
  pair_id: 6,
  created_at: 3.days.ago
)

Like.create!(
  customer_id: 8,
  pair_id: 8,
  created_at: 2.days.ago
)

Like.create!(
  customer_id: 9,
  pair_id: 1,
  created_at: 3.days.ago
)

Like.create!(
  customer_id: 9,
  pair_id: 2,
  created_at: 1.days.ago
)

Like.create!(
  customer_id: 9,
  pair_id: 3,
  created_at: 4.days.ago
)

Like.create!(
  customer_id: 9,
  pair_id: 5,
  created_at: 2.days.ago
)

Like.create!(
  customer_id: 9,
  pair_id: 7,
  created_at: 4.days.ago
)

Like.create!(
  customer_id: 9,
  pair_id: 9,
  created_at: 1.days.ago
)

Like.create!(
  customer_id: 10,
  pair_id: 1,
  created_at: 2.days.ago
)

Like.create!(
  customer_id: 10,
  pair_id: 2,
  created_at: 3.days.ago
)

Like.create!(
  customer_id: 10,
  pair_id: 3,
  created_at: 3.days.ago
)

Like.create!(
  customer_id: 10,
  pair_id: 4,
  created_at: 4.days.ago
)

Like.create!(
  customer_id: 10,
  pair_id: 6,
  created_at: 2.days.ago
)

Like.create!(
  customer_id: 10,
  pair_id: 8,
  created_at: 1.days.ago
)

# フォロー

Relationship.create!(
  followed_id: 1,
  follower_id: 2
)

Relationship.create!(
  followed_id: 1,
  follower_id: 3
)

Relationship.create!(
  followed_id: 1,
  follower_id: 4
)

Relationship.create!(
  followed_id: 1,
  follower_id: 6
)

Relationship.create!(
  followed_id: 1,
  follower_id: 7
)

Relationship.create!(
  followed_id: 1,
  follower_id: 8
)

Relationship.create!(
  followed_id: 1,
  follower_id: 9
)

Relationship.create!(
  followed_id: 1,
  follower_id: 10
)

Relationship.create!(
  followed_id: 2,
  follower_id: 1
)

Relationship.create!(
  followed_id: 2,
  follower_id: 3
)

Relationship.create!(
  followed_id: 3,
  follower_id: 1
)

Relationship.create!(
  followed_id: 3,
  follower_id: 2
)

Relationship.create!(
  followed_id: 3,
  follower_id: 4
)

Relationship.create!(
  followed_id: 3,
  follower_id: 5
)

Relationship.create!(
  followed_id: 3,
  follower_id: 6
)

Relationship.create!(
  followed_id: 3,
  follower_id: 7
)

Relationship.create!(
  followed_id: 4,
  follower_id: 1
)

Relationship.create!(
  followed_id: 5,
  follower_id: 1
)

Relationship.create!(
  followed_id: 5,
  follower_id: 4
)

Relationship.create!(
  followed_id: 5,
  follower_id: 7
)

Relationship.create!(
  followed_id: 6,
  follower_id: 1
)

Relationship.create!(
  followed_id: 6,
  follower_id: 2
)

Relationship.create!(
  followed_id: 6,
  follower_id: 3
)

Relationship.create!(
  followed_id: 6,
  follower_id: 5
)

Relationship.create!(
  followed_id: 7,
  follower_id: 1
)

Relationship.create!(
  followed_id: 7,
  follower_id: 2
)

Relationship.create!(
  followed_id: 7,
  follower_id: 5
)

Relationship.create!(
  followed_id: 7,
  follower_id: 8
)

Relationship.create!(
  followed_id: 8,
  follower_id: 1
)

Relationship.create!(
  followed_id: 8,
  follower_id: 3
)

Relationship.create!(
  followed_id: 8,
  follower_id: 5
)

Relationship.create!(
  followed_id: 8,
  follower_id: 9
)

Relationship.create!(
  followed_id: 9,
  follower_id: 1
)

Relationship.create!(
  followed_id: 9,
  follower_id: 2
)

Relationship.create!(
  followed_id: 9,
  follower_id: 3
)

Relationship.create!(
  followed_id: 9,
  follower_id: 5
)

Relationship.create!(
  followed_id: 9,
  follower_id: 8
)

Relationship.create!(
  followed_id: 10,
  follower_id: 1
)

Relationship.create!(
  followed_id: 10,
  follower_id: 4
)

Relationship.create!(
  followed_id: 10,
  follower_id: 9
)

#コメント

Comment.create!(
  customer_id: 1,
  pair_id: 3,
  text: "とてもいいですね！",
  created_at: 4.days.ago
)

Comment.create!(
  customer_id: 1,
  pair_id: 5,
  text: "試してみたいと思います！",
  created_at: 3.days.ago
)

Comment.create!(
  customer_id: 1,
  pair_id: 7,
  text: "これは美味しい組み合わせですよね！",
  created_at: 2.days.ago
)

Comment.create!(
  customer_id: 2,
  pair_id: 2,
  text: "これは美味しい組み合わせですよね！",
  created_at: 3.days.ago
)

Comment.create!(
  customer_id: 2,
  pair_id: 6,
  text: "とてもいいですね！",
  created_at: 4.days.ago
)

Comment.create!(
  customer_id: 2,
  pair_id: 8,
  text: "試してみたいと思います！",
  created_at: 4.days.ago
)

Comment.create!(
  customer_id: 3,
  pair_id: 1,
  text: "試してみたいと思います！",
  created_at: 2.days.ago
)

Comment.create!(
  customer_id: 3,
  pair_id: 3,
  text: "これは美味しい組み合わせですよね！",
  created_at: 1.days.ago
)

Comment.create!(
  customer_id: 3,
  pair_id: 7,
  text: "とてもいいですね！",
  created_at: 3.days.ago
)

Comment.create!(
  customer_id: 4,
  pair_id: 2,
  text: "試してみたいと思います！",
  created_at: 4.days.ago
)

Comment.create!(
  customer_id: 4,
  pair_id: 4,
  text: "とてもいいですね！",
  created_at: 3.days.ago
)

Comment.create!(
  customer_id: 4,
  pair_id: 6,
  text: "これは美味しい組み合わせですよね！",
  created_at: 2.days.ago
)