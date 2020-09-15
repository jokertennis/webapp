# ベースイメージ作成
FROM nginx:1.15.8

# インクルード用のディレクトリ内を削除
RUN rm -f /etc/nginx/conf.d/*

# Nginxの設定ファイルをコンテナにコピー
ADD nginx.conf /etc/nginx/conf.d/webapp.conf

# ビルド完了後にNginxを起動。nginxをdaemon化(background実行)する事を防ぐ
CMD /usr/sbin/nginx -g 'daemon off;' -c /etc/nginx/nginx.conf