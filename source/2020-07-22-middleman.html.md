---
title: middlemanとgithubの連携
date:
---

# middlemanとgithubの連携

## 連携参考URL
https://zacky1972.github.io/tech/2017/11/04/middleman.html

## middlemanのインストール

manabu@jacquard|2020-07-20|22:46:27|/home/manabu/Desktop/development|
  
  % gem install middleman

Successfully installed middleman-4.3.7
Parsing documentation for middleman-4.3.7
Done installing documentation for middleman after 0 seconds
1 gem installed

% bundle exec middleman version

```
Deprecation warning: Expected string default value for '--instrument'; got false (boolean).
This will be rejected in the future unless you explicitly pass the options `check_default_type: false` or call `allow_incompatible_default_type!` in your code
You can silence deprecations warning by setting the environment variable THOR_SILENCE_DEPRECATION.
Middleman 4.3.7
```

% middleman init tanaka_blog


% cd tanaka_blog


manabu@jacquard|2020-07-20|22:49:02|/home/manabu/Desktop/development/tanaka_blog|
  
  % git init

Initialized empty Git repository in /home/manabu/Desktop/development/tanaka_blog/.git/

% git remote add origin リモート先
% git remote add origin https://github.com/xuejoule/tanaka_blog.git


## ディレクトリの内容を add/commit/push する
$ git add -A

$ git commit -m "initial commit"

$ git push -f origin master

## サーバ起動
% bundle exec middleman server

ブラウザlocalhost:4567

manabu@jacquard|2020-07-20|22:53:59|/home/manabu/Desktop/development/tanaka_blog|

  % vi Gemfile

manabu@jacquard|2020-07-20|22:53:59|/home/manabu/Desktop/development/tanaka_blog|
  
  % cat Gemfile

gem 'middleman-blog', '~> 4.0'

manabu@jacquard|2020-07-20|22:54:15|/home/manabu/Desktop/development/tanaka_blog|
  
% bundle install


## config.rb に次のような記述をする

```
activate :blog do |blog|
  ブログ機能のオプションを設定
  blog.sources = "{year}-{month}-{day}-{title}.html"
  blog.permalink = "{year}/{month}/{day}/{title}.html"
  blog.default_extension = ".md"
end
```

```
helpers do
  def hostUrl link
    link
  end
end
※ hostUrl ヘルパーは後で使うフックとして用意しておきます。
```
source/index.html.erb に記述します。


## GitHub Flavored Markdown の導入
Gemfile に下記を追加

gem 'redcarpet'

gem 'nokogiri'

下記のコマンドを実行します。

% bundle install

## config.rb に下記を追加

```
 # GitHub Flavored Markdown
set :markdown, :tables => true, :autolink => true, :gh_blockcode => true, :fenced_code_blocks => true
set :markdown_engine, :redcarpet
```

## GitHub Pages にデプロイ
gem 'middleman-deploy', '~> 2.0.0.pre.alpha'

その後，次のコマンドを実行します。

% bundle install


## config.rb に書いた hostUrl を次のように変更します。
```
helpers do
  def host_url(link)
    'https://(ユーザー名).github.io' + link => 'https://xuejoule.github.io' + link
    'http://localhost:4567' + link
  end
end
```

## config.rb に下記の記述を追加
```
 Build-specific configuration
configure :build do
   Minify CSS on build
   activate :minify_css

   Minify Javascript on build
   activate :minify_javascript
   リポジトリ名を host に設定しておく
   こうすることで stylesheet_link_tag などで展開されるパスが
   https://(ユーザー名).github.io/(リポジトリ名)/stylesheets/*.css
   のようになる
  activate :asset_hash
  activate :asset_host, :host => 'https://(ユーザー名).github.io'=>'https://xuejoule.github.io'
end
```


## デプロイの設定
今回は gh-pages を使用するので branch に 'gh-pages' を設定する

```
activate :deploy do |deploy|
  deploy.build_before = true
  deploy.deploy_method = :git
  deploy.branch = 'gh-pages'
end
```

## 以上の準備が終わったところで，次のコマンドを実行すると，GitHub Pages にデプロイされます。
manabu@jacquard|2020-07-20|23:34:00|/home/manabu/Desktop/development/tanaka_blog|
  
  % bundle exec middleman deploy

```
Deprecation warning: Expected string default value for '--instrument'; got false (boolean).
This will be rejected in the future unless you explicitly pass the options `check_default_type: false` or call `allow_incompatible_default_type!` in your code
You can silence deprecations warning by setting the environment variable THOR_SILENCE_DEPRECATION.
== Blog Sources: {year}-{month}-{day}-{title}.html (:prefix + :sources)
         run  middleman build -e production from "."
Deprecation warning: Expected string default value for '--instrument'; got false (boolean).
This will be rejected in the future unless you explicitly pass the options `check_default_type: false` or call `allow_incompatible_default_type!` in your code
You can silence deprecations warning by setting the environment variable THOR_SILENCE_DEPRECATION.
 Blog Sources: {year}-{month}-{day}-{title}.html (:prefix + :sources)
      create  build/stylesheets/site-a77c873c.css
      create  build/images/.keep
      create  build/javascripts/site-954757c2.js
      create  build/index.html
Project built successfully.
Deploying via git to remote="origin" and branch="gh-pages"
Cant deploy! Please add a remote with the name 'origin' to your repo.
```

デプロイ失敗





% bundle exec middleman deploy

```
Deprecation warning: Expected string default value for '--instrument'; got false (boolean).
This will be rejected in the future unless you explicitly pass the options `check_default_type: false` or call `allow_incompatible_default_type!` in your code
You can silence deprecations warning by setting the environment variable THOR_SILENCE_DEPRECATION.
== Blog Sources: {year}-{month}-{day}-{title}.html (:prefix + :sources)
         run  middleman build -e production from "."
Deprecation warning: Expected string default value for '--instrument'; got false (boolean).
This will be rejected in the future unless you explicitly pass the options `check_default_type: false` or call `allow_incompatible_default_type!` in your code
You can silence deprecations warning by setting the environment variable THOR_SILENCE_DEPRECATION.
== Blog Sources: {year}-{month}-{day}-{title}.html (:prefix + :sources)
   identical  build/stylesheets/site-a77c873c.css
   identical  build/images/.keep
   identical  build/javascripts/site-954757c2.js
   identical  build/index.html
pProject built successfully.
 Deploying via git to remote="origin" and branch="gh-pages"
Already on 'gh-pages'
[gh-pages fb16df1] Automated commit at 2020-07-21 01:06:00 UTC by middleman-deploy 2.0.0-alpha
Username for 'https://github.com': xuejoule
Password for 'https://xuejoule@github.com': 
Enumerating objects: 10, done.
Counting objects: 100% (10/10), done.
Delta compression using up to 8 threads
Compressing objects: 100% (5/5), done.
Writing objects: 100% (10/10), 1.63 KiB | 555.00 KiB/s, done.
Total 10 (delta 1), reused 0 (delta 0), pack-reused 0
remote: Resolving deltas: 100% (1/1), done.
remote: 
remote: Create a pull request for 'gh-pages' on GitHub by visiting:
remote:      https://github.com/xuejoule/tanaka_blog/pull/new/gh-pages
remote: 
To https://github.com/xuejoule/tanaka_blog.git
 * [new branch]      gh-pages -> gh-pages
```

## githab pages

デプロイしてから10分程度待った後に， https://(ユーザー名).github.io/(リポジトリ名) にアクセスするとサイトができています。

https://github.com/xuejoule/tanaka_blog.git


