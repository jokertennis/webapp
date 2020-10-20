# 洋画ECサイト

当webアプリケーションは洋画を視聴したい日本人のために作成した洋画専用のECサイトである。  
テストユーザーをご利用いただけます。  
メールアドレス test@gmail.com  
パスワード testpass  
URL http://54.250.98.235/home

## webアプリケーションの特徴

当webアプリケーションではログイン機能、検索機能、カート機能がある。  
検索機能はタイトル、年代、ジャンルのうち１つを利用することで検索できる。  
検索機能はログインなしで利用可能。カート機能はログインをすることで利用可能となる。  
また、約25000件の映画データを利用している。

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

![データベース設計図](https://user-images.githubusercontent.com/48274379/95077406-68addb80-074e-11eb-9c90-33140baf2715.png)

## 文責

北見工業大学地域未来デザイン工学科地域マネジメント工学コース３年  
基盤コース：情報デザイン・コミュニケーション工学コース  
川田剣士(カワタケンジ)

## ライセンス
映画データはKaggleのデータセットを利用。データに著作権はない。  
https://creativecommons.org/publicdomain/zero/1.0/