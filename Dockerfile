# ベースイメージ
FROM ruby:3.0.2

# nodejsとyarnはwebpackをインストールする際に必要

# リポジトリを更新し依存モジュール(ビルドツールを提供しているパッケージ・nodejs)をインストール。
RUN apt-get update -qq && \
    apt-get install -y build-essential \
                       nodejs


#vimを利用するためにインストール
RUN apt-get update && apt-get -y install vim

# yarnパッケージ管理ツールインストール
RUN apt-get update && apt-get install -y curl apt-transport-https wget && \
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
    apt-get update && apt-get install -y yarn


# ルート直下にwebappという名前で作業ディレクトリを作成（コンテナ内のアプリケーションディレクトリ）
RUN mkdir /webapp

# 各種命令を実行するためのカレントディレクトリを指定
WORKDIR /webapp

# 参考文献https://www.adoclib.com/blog/ec2-instance-could-not-locate-gemfile-or-bundle-directory.html
RUN bundle init

# ホストのGemfileとGemfile.lockをコンテナにコピー
COPY Gemfile /webapp/Gemfile
ADD Gemfile.lock /webapp/Gemfile.lock

# 参考文献https://qiita.com/yunyun_engineer/items/a94e28a1cf5eb2c0ffdc
ENV BUNDLER_VERSION 2.1.4
RUN gem update --system \
    && gem install bundler -v $BUNDLER_VERSION \
    && bundle install -j 4

# bundle installの実行
RUN bundle install

# ホストのアプリケーションディレクトリ内をすべてコンテナにコピー
ADD . /webapp

# puma.sockを配置するディレクトリを作成。コンテナ内に作ることに注意。
RUN mkdir -p tmp/sockets

CMD bundle exec puma -C config/puma.rb
