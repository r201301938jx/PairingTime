# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(
  email: 'admin@test.com',
  password: 'password'
)

Customer.create!(
  last_name: "鈴木",
  first_name: "太郎",
  last_name_kana: "スズキ",
  first_name_kana: "タロウ",
  nickname: "タロー",
  profile_image: open("./app/assets/images/customer1.jpg") ,
  phone_number: "09011112222",
  email: "1@test.com",
  password: "password"
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
  password: "password"
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
  password: "password"
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
  password: "password"
)

Pair.create!(
  customer_id: 1,
  title: "チョコレートクッキーとカプチーノ",
  image: open("./app/assets/images/pair1.jpg"),
  caption: "チョコレートクッキーとカプチーノ",
)

Pair.create!(
  customer_id: 1,
  title: "クロワッサンとエスプレッソ",
  image: open("./app/assets/images/pair2.jpg"),
  caption: "クロワッサンとエスプレッソ",
)

Pair.create!(
  customer_id: 2,
  title: "チョコレートマカロンとコーヒー",
  image: open("./app/assets/images/pair3.jpg"),
  caption: "チョコレートマカロンとコーヒー",
)

Pair.create!(
  customer_id: 2,
  title: "ハムサンドとアイスラテ",
  image: open("./app/assets/images/pair4.jpg"),
  caption: "ハムサンドとアイスラテ",
)

Pair.create!(
  customer_id: 3,
  title: "ブルーベリーケーキとカフェラテ",
  image: open("./app/assets/images/pair5.jpg"),
  caption: "ブルーベリーケーキとカフェラテ",
)

Pair.create!(
  customer_id: 3,
  title: "マカロンとコーヒー",
  image: open("./app/assets/images/pair6.jpg"),
  caption: "マカロンとコーヒー",
)

Pair.create!(
  customer_id: 4,
  title: "アボカドサンドとアイスラテ",
  image: open("./app/assets/images/pair7.jpg"),
  caption: "アボカドサンドとアイスラテ",
)

Pair.create!(
  customer_id: 4,
  title: "チョコクロワッサンとアイスラテ",
  image: open("./app/assets/images/pair8.jpg"),
  caption: "チョコクロワッサンとアイスラテ",
)

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
  tag_id: 2,
  pair_id: 1
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
  tag_id: 10,
  pair_id: 5
)

Tagging.create!(
  tag_id: 11,
  pair_id: 5
)

Like.create!(
  customer_id: 1,
  pair_id: 7
)

Like.create!(
  customer_id: 1,
  pair_id: 4
)

Like.create!(
  customer_id: 2,
  pair_id: 5
)

Like.create!(
  customer_id: 2,
  pair_id: 4
)

Like.create!(
  customer_id: 3,
  pair_id: 4
)

Like.create!(
  customer_id: 3,
  pair_id: 2
)

Like.create!(
  customer_id: 4,
  pair_id: 5
)

Like.create!(
  customer_id: 4,
  pair_id: 8
)

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
  follower_id: 4
)

Relationship.create!(
  followed_id: 4,
  follower_id: 1
)