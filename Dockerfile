# "&&"は行頭に書いたほうがいい

FROM ruby:2.7.0

# [-qqオプション] エラー以外は表示しない
RUN apt-get update -qq \
# [-yオプション] すべてyes
# [--no-install-recomends] 推奨パッケージを無視
# [build-essential] 開発に必須のビルドツール(gcc, g++, make等)を提供しているパッケージ
# [libpq-dev] 後で調べる
&& apt-get install -y --no-install-recommends mariadb-client nodejs build-essential libpq-dev \
# APTのパッケージダウンロードの際のキャッシュファイルを削除
&& rm -rf /var/lib/apt/lists/*

RUN mkdir /whiplash
WORKDIR /whiplash

# 既存のGemfileをコンテナ内の指定したディレクトリにコピーする
ADD Gemfile /whiplash/Gemfile
# 既存のGemfile.lockをコンテナ内の指定したディレクトリにコピーする
ADD Gemfile.lock /app/Gemfile.lock

RUN bundle install

# カレントディレクトリのファイルをコンテナ内の指定したディレクトリにコピーする
# 新規プロジェクトであっても、rails new で新しく追加されたgemをインストールするためイメージを再ビルドする際に必要になる
ADD . /whiplash


# 既存のプロジェクトの場合は、カレントディレクトリのすべてのファイルをADDして、その後bundle installしたほうがいい？？