# portfolio
___
## ○プロダクト名

### ___TODO for team___
> TODOリストを作成し、チームで扱えるように拡張する
___
## ○機能

### TODOリスト
> 今後の実行しなければいけない事柄をリストとして記録し、チェックボックスを用いて終了を確認する。

### ログイン機能
> ユーザ認証システム。ログインすることでデータの閲覧を可能とする。

### ユーザプロフィール
> ユーザに簡単な任意設定のプロフィールページを作成

### フォロー機能
> 友達として任意のユーザとの連絡手段を確保、容易なメッセージのやりとりを可能とする。

### チームプロジェクト管理
> 部署やチーム事にプロジェクトをメンバーと共有すことを可能とする。プロジェクトIDとプロジェクトpassを設定することにより作成。招待による認証も追加。チーム内でのメッセージのやりとりを可能とする。

## ○開発環境
MacOS version:10.15.2
Ruby version:
Mysql version:8.0
nginx
Ruby on Rails version:
AWS

## ○作業手順
### TODOリスト作成
> 

## ○データベース設計
### エンティティ抽出
> TODO_table
- by_time (いついつまでに)
- title (タイトル)
- body (細かい内容)
- user_id (作成者ID)
- team_id (チームID)

> user_table
- name (名前)
- email (メールアドレス)
- password (パスワード)

> profile_table
- nickname　(ニックネーム)
- detail (詳細)
- locate (住処)
- birthday (生年月日)

> team_table
- name (チーム名)
- projectID (プロジェクトID)
- projectPass (プロジェクトPass)

> follow_table
- user_id
- follow_id

> team_relation 1 対 多
- team_id 
- user_id


command

$ rails new <application_name> <option_list> 

options:    -B (skip-bundle)
            -d mysql (mysqlを利用)
            --skip-turbolinks
            --skip-test

$ bundle config --local build.mysql2 "--with-ldflags=-L/usr/local/opt/openssl/lib" (mysql エラーの修正)

$ bundle init

$ bundle install --path vendor/bundle --jobs=4

$ rails db:create