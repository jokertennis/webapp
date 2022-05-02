# 洋画ECサイト

当webアプリケーションは洋画を視聴したい日本人のために作成した洋画専用のECサイトである。  
テストユーザーをご利用いただけます。  
メールアドレス test@example.com  
パスワード testpass  

![webアプリケーション](https://user-images.githubusercontent.com/48274379/107312870-c6737b00-6ad4-11eb-8866-0c322b0916c9.gif)


## webアプリケーションの特徴

当webアプリケーションではログイン機能、検索機能、カート機能、レビュー投稿機能がある。  
検索機能はタイトル、年代、ジャンルのうち１つを利用することで検索できる。  
検索機能はログインなしで利用可能。カート機能、レビュー投稿機能はログインをすることで利用可能となる。  
また、約24000件の映画データを利用している。

## webアプリケーションの使用技術
言語 :html,css,ruby2.6.5,python,mysql2  
Webアプリケーションフレームワーク :Ruby on Rails6.0.3  
ライブラリ :numpy,pandas(データの加工に利用)  
webサーバ :nginx  
アプリケーションサーバ :puma  
インフラ :AWS(VPC,ECS(EC2),RDS,ECR,CloudWatch),Docker

## インフラ構成図

![インフラ設計図](https://user-images.githubusercontent.com/48274379/95052080-435aa680-0729-11eb-841c-bc68e77b8431.png)

## データベース設計

![データベース設計図](https://user-images.githubusercontent.com/48274379/99858179-4c67e000-2bd0-11eb-81cb-a8fc56a888e8.png)

## 環境構築手順

### 事前準備
環境構築時はMacBookを利用していることを想定している。(恐らくWindowsでも動くが、動作確認はしていない。)  

Docker Desktopをインストールすること。  
https://www.docker.com/products/docker-desktop/  

DockerDesktopを起動状態にさせる。
<img width="1440" alt="スクリーンショット 2022-05-01 13 18 43" src="https://user-images.githubusercontent.com/48274379/166132072-80d288a9-1f3f-44a4-950b-ee159ae60599.png">  

DocckerDesktopを以下の画像のように設定する。(内容が違うとコンテナ立ち上げ時にエラーが起こる可能性がある)  
<img width="1440" alt="スクリーンショット 2022-05-02 12 50 32" src="https://user-images.githubusercontent.com/48274379/166182097-cb5a9e9a-69f1-4a80-ad03-2d45a8131067.png">  

Gitをインストールする。(Macの場合デフォルトで入っている)

## 手順

ローカルにリポジトリをcloneさせる。  

`git clone https://github.com/jokertennis/webapp.git`  

webappディレクトリ直下へ移動する。(以降では、コンテナ内でのコマンド実行を除き、webappディレクトリ直下でコマンドを実行する)  

`cd webapp`  

コンテナを立ち上げる。  

`docker-compose up -d`  

以下の画像のように、コンテナが３つ立ち上がっていると良い。  
<img width="1440" alt="スクリーンショット 2022-05-01 15 05 48" src="https://user-images.githubusercontent.com/48274379/166134391-fa5c25a3-608e-4bde-adf9-caca84f399d8.png">  

dbコンテナへ入る。(webapp_db_1はdbコンテナのidでも良い。)  
`docker exec -it webapp_db_1 bash`  

ルートディレクトリ直下でwebapp_developmentデータベースのリストアをする。(パスワードはrootpass)  
`mysql -u root -p webapp_development < dump.sql`  

dbコンテナから抜ける。  
`exit`  

[http://127.0.0.1](http://127.0.0.1)へアクセス。この画面が表示されたら、「Run pending migrate」をクリック。  
<img width="1440" alt="スクリーンショット 2022-05-01 22 52 43" src="https://user-images.githubusercontent.com/48274379/166149016-c1c27c21-a19b-4f01-9491-3e355fd839fb.png">  

以下の画面になると良い。  
<img width="1440" alt="スクリーンショット 2022-05-01 22 55 23" src="https://user-images.githubusercontent.com/48274379/166149075-7555808e-fdb7-4f89-a06e-9a2ebba2002f.png">  

以下のテストユーザーをご利用ください。  
メールアドレス：test@example.com  
パスワード：testpass  

## 文責

川田剣士(カワタケンジ)

## ライセンス
映画データはKaggleのデータセットを利用。データに著作権はない。  
https://creativecommons.org/publicdomain/zero/1.0/
