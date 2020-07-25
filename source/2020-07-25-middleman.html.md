---
title: 正規表現
---

```
regrex = /\d{3}-\d{4}/
regrex.class #=> Regexp
```

マッチした場合は文字列の開始位置

```
'123-4567' =~ /\d{3}-\d{4}/ #=> 0
```

マッチしない

```
'hello' =~ /\d{3}-\d{4}/ #=> nil
```

マッチしたらfalse

```
'123-4567' !~ /\d{3}-\d{4}/ #=> false
```

マッチしなければtrue

```
'hello' !~ /\d{3}-\d{4}/ #=> true
```

## 分岐

```
if '123-4567' =~ /\d{3}-\d{4}/
puts 'マッチしました'
else
puts 'マッチしませんでした'
end
```

/^[0-9][0-9]*$/
^行頭
*0回以上の繰り返しにマッチ
$行末
1回以上の繰り返しにマッチ

## scan

scanメソッドは、引数で指定した正規表現のパターンとマッチする部分を文字列からすべて取り出し、配列にして返します。マッチする部分がなければ、空の配
引数に文字列を指定したときは、一致する部分文字列をすべて配列に取り出します。

```
str = "Hello, holland, Cello, h35L320"
p str.class
p str.scan(/^[hc].*o$/i)
```

```
s = "To be or not to be, that is the question."
hash = Hash.new(0)
s.scan(/\w+/) { |i| hash[i] += 1}
p hash["be"]
```


```
puts "0123456789-".delete("^13-56-")
puts "0123456789-".delete("13456-")
```

```
p "abc def 123 ghi 4567".scan(/\d+/).length
# (/\d+/)は\d+は数字の繰り返し
p "abc def 123 ghi 456 1 33".scan(/\d+/)
```

## match

```
text = 'わたしの誕生日は1977年7月17日です'
m = /(\d+)年(\d+)月(\d+)日/.match(text)
m[1]#=> "1977"
m[2]#=> "7"
m[3]#=> "17"
```

1つ以上の数字のみで構成される行にマッチする正規表現
```
p !!"123".match(/^[0-9][0-9]*$/)
p !!"aa".match(/^[0-9][0-9]*$/)
p !!"aaaaa".match(/^[a-c][a-c]*$/)
```

```
p "HogeHOGEhoge"[/[A-Z][^A-Z]+/]
p "HogeHOGEhoge"[/^[A-Z]+/]
p "HogeHOGEhoge"[/^[a-z]*/]
```

!!=>boolean(真偽値)を返す

```
p !!"2".match(/^[0-9][0-9]*$/)
#=>true
```

```
str = ["Hello",  "holland", "Cello", "h35L320"]
str.each do |s|
p  s.match(/^[hc].*o$/i)
end
#=>Hello, Cello
```

## gsub

subメソッドは、文字列の中で正規表現のパターンpatternに最初にマッチした部分を文字列replacementに置換し、新しい文字列を返します。
gsubメソッドとgsub!メソッドは、文字列の中で正規表現のパターンにマッチした部分をすべて指定の文字列に置換する
gsub!メソッドは、パターンにマッチした部分をすべて指定の文字列に置換します。レシーバ自身を変更するメソッドです。戻り値は、置換が行われたときはレシーバ自身、変更がなかったときはnil。

```
Hoge = "hoge"
Hoge.gsub!("hoge", "piyo")
p Hoge
```

```
names = "tttaaapppoooqqqaaa"
names.gsub!("aaa", "mmmmm")
p names
```

```
foo = "I love apple, banana and grap"
5.times do
foo = foo.sub("a", "@")
end
p foo
```

```
#foo1 = "I love applle, banana and grap"
#foo2 = foo1.sub("a", "#")
#foo3 = foo2.sub("a", "#")
#foo4 = foo3.sub("a", "#")
#foo5 = foo4.sub("a", "#")
#foo6 = foo5.sub("a", "#")
#p foo6
````

```
#foo = "I love apple, banana and grap"
#foo = foo.sub("a", "@")
#foo = foo.sub("a", "@")
#foo = foo.sub("a", "@")
#foo = foo.sub("a", "@")
#foo = foo.sub("a", "@")
#p foo
```

```
class Tanaka
attr_accessor :atai

def initialize(string)
@atai = string
end

def sub(from_string, to_string)
result = @atai.sub(from_string, to_string)

    return "foo"
end
end

name1 = Tanaka.new('a')
name1 = name1.sub("a", "b")
p name1 #=>"foo"

```

## split

str.split(pattern = $;, [limit])
splitメソッドは、引数patternを区切り文字として文字列を分割し、配列を返します


```
s = "a;b:c;d:e;f"
p s.split(/:|;/)
#=>["a", "b", "c", "d", "e", "f"]
```

```
str = "a, b, c, d"
p str.split(/,/, 2)
```

```
p "100,200,300,400,500".split(",").join("\n")
p arry=  "100,200,300,400,500".split(",")
p arry.join("\n")
```

## slice

```
p "hogePiyohogehoge".slice(/o../)
```

```
p a.slice(0, 3)
#=>[1, 2, 3]
```

```
string = "test code"
string.slice(0, 4)
p a
# 破壊的メソッドではないので文字列の中身はかわらない
```

```
arry = ["dog", "cat", "monkey"]
p arry.slice(1, 3)
p arry
```

```
a = ["Ruby", "Tanaka", "Rails"]
p a.slice(1, 4)
```

```
s = "hello"
p s.slice(1, 3)   # 2番目から3文字分
```

```
s = "hello, world"
puts s.slice(7..10)  # 7文字目から10文字目まで
````

```
s = "tanakamanabu"
a = s.slice(2..7)
p a#=>"nakama"
```
