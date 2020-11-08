# 色々なコマンド

## 調査したいファイルの行数

```
% find . -type f | grep -e \.erb -e \.rb | grep -v cache | grep -v coverage | wc -l
```

```
$ wc -l `find app/ -name '*.rb'`
24755 合計
```

```
$ wc -l database.yml
40 database.yml
```


## clipに貼り付けてからemacsにペースト

```
% git grep '\private ' app/controllers/ | xclip -sel clip
```

```
% git grep ' def \|class ' app/controllers/ | xclip -sel clip
```


## emacsコマンド

```
line数と文字数を調べる
マークしてから
alt +  =
```

```
置換
マークした箇所
alt-x
replace-string
置換したい文字入力後、置換する文字を入力
```

```
Ctrl - Spaceで範囲選択
Meta - x, replace-regexp, Return,
正規表現 Return, 置換文字列 Return,
```

```
先頭に空白行を足す
Ctrl - Space
Ctrl - f (追加したい文字数分)
Ctrl - x r o
```


## linuxマシンコア数

```
cat /proc/cpuinfo | grep processor
```

