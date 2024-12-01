## アプリケーション名
beatuplord(beat x)

## アプリケーション概要
twiterやinstergramで出来なかったbeatをアップロードしてやり取りが気軽に出来るアプリケーション

## URL
http://52.68.124.20/beats

## テスト用アカウント
* BASIC認証ID：admin
* BASIC認証PASS：2222

## 利用方法
### 音楽ファイルの投稿
1.トップページ（一覧ページ）のヘッダーからユーザー新規登録を行う
2.NEW BEAT UPLORDから（タイトル、ジャンル、雰囲気、BEAT）を入力し投稿する。
3.他のユーザーが上げた投稿（ビート）を直感的に聴ける

### ビートについてやり取り、交渉をする
1.一覧ページのユーザー名またはアイコンからマイページに飛びメッセージを送る
2.DM機能のように直感的にメッセージがやり取り出来て交渉の話などに使える

## アプリケーションを作成した背景
数多くのビートメーカーにとって余っているお蔵入りとされるビートは必ずいっぱいあるので気軽にビートを投稿することにフォーカスした母体があればお蔵入りのビートも気軽にアップロードし公開、管理が容易になり買い手のラッパーにとっても通なビートが欲しい時にビートだけにフォーカスしたサイトがあると非常に便利であると考え作ることにしました

## 実装した機能についての画像やGIFおよびその説明

### データベース設計

[![Image from Gyazo](https://i.gyazo.com/67b83b14c83634075d32ddee00f0358e.png)](https://gyazo.com/67b83b14c83634075d32ddee00f0358e)

### 画面遷移図

[![Image from Gyazo](https://i.gyazo.com/5fe4b665b233d102ef31a0a762ae2808.png)](https://gyazo.com/5fe4b665b233d102ef31a0a762ae2808)

## 実装予定の機能
* カテゴリー別に検索出来る機能。
* いいね機能の実装。
* コメント機能や一覧にあれば便利な機能。

## 開発環境
### フロントエンド
* html
* css
* java script
### バックエンド
* ruby on rails
### インフラ
* aws
### テキストエディタ
* vs code

## 工夫したポイント
railsのgemのデフォルトだけの仕様では音楽ファイルがダウンロードされてしまうなどのユーザビリティではない仕様だったのでjava scriptを使ってカスタムボタンを導入した点がユーザー視点でのこだわりです。

