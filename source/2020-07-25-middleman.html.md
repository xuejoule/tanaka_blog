---
title: Rspec学習
---

* modelのテスト

* 正常系と異常系

パス: spec/models/contact_spec.rb


```
require 'rspec_helper'

describe Contact do
  it 'firstname, lastname, emailがvalid' do
    contact = Contact.new(
      firstname: "tanaka",
      lastname: "manabu",
      email: "tanaka@exmple.com"
    )
    expect(contact).to be_valid
  end
  it 'firstnameが無い場合invalid' do
    contact = Contact.new(
      firstname: nil,
      lastname: "manabu",
      email: "tanaka@exmple.com"
    )
    expect(contact).to have(1).error_on(:firstname)
  end
end
```

before、context使用する
```
require 'rspec_helper'

describe 'validation' do
  before each do
    contact = Contact.new(
      firstname: nil,
      lastname: "manabu",
      email: "tanaka@exmple.com"
    )
  end
  context 'firstname, lastname, emailがvalid' do
    it 'is_valid' do
      expect(contact).to be_valid
    end
  end
  context 'firstnameがない場合' do
    before each do
      contact.firstname = nil
    end
    it 'is_invalid' do
      expect(contact).to have(1).error_on(:firstname)
    end
  end
end
```

dry(重複させない)

describeが親contextが子

親子関係でグルーピングさせる

親で作成したテストデータは子でも使える

beforeでまとめる

親のbeforeで作られたテストデータが呼ばれた後に、子のbeforeが呼ばれ、

contact.firstname = nilがテストデータにセットされる

contactはローカル変数なので、contextの中のcontactのメソッドが見つからないと
エラーになるのでインスタンス変数に変更する必要がある


修正後

```
describe 'validation' do
  before each do
    @contact = Contact.new(
      firstname: nil,
      lastname: "manabu",
      email: "tanaka@exmple.com"
    )
  end
  context 'firstname, lastname, emailがvalid' do
    it 'is_valid' do
      expect(@contact).to be_valid
    end
  end
  context 'firstnameがない場合' do
    before each do
      @contact.firstname = nil
    end
    it 'is_invalid' do
      expect(@contact).to have(1).error_on(:firstname)
    end
  end
end
```
