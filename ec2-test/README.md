# EC2-STUDY
## こうしたい
- 簡素化と勉強のため、なるべく公開Moduleを利用する
- 

## 気になりごとまとめ
1. user data が文字化けするケースとしないケースの検証
2. AMIからの起動時に初期化される事柄について
    -[あなたのLinuxインスタンスは大丈夫？ AMIからのリストア時にcloud-initが初期化してしまう設定集](https://qiita.com/speaktech/items/52995b55477f7d8efd19)
3. SSMの設定
4. private subnets内にWebサーバーを置くケース
    -> 別立て
5. terraform provision

# EC2を立てて SSHをするまで
- VPC、サブネットなどネットワーク設定を行う必要あり
- SG設定が居る。GlobalIPを晒したくないのでhttpモジュールを使った

# 202006XX
## Simple User Data Test(user_data, user_data_base64)
- どっちか片方を使う。
- UTF-8ならどっちを使っても文字化けしない

# 20200705
## VPCをSharedから移行とVPC Moduleの利用
- moduleが便利なので、VPCごと移管。採番さえ間違えなければなんとかなる。

## SGのModule利用
- 基本Portなら公開Moduleが利用できる
- Full Accessなself sg 許可のruleが必ず入る。
- 何も考えないとmodulename-timestampみたいなすごい名前になる

## Auto Scaling Groupでのuser data
- さっと見た感じ、userdatabase64は指定できなくて、userdataで指定するとそれがbase64で入るように見える
    user_dataの挙動は変わらず。文字化けなし。
- name-prefixに必ず値が入り、それをもとにnameが作られる。importしたものはname-prefixがついてないので、起動設定などは強制replaceになる。
- tags, tags_on_mapのどちらでも指定可能。tagsだけpropagate_at_launchが指定できる。tag_on_mapは強制true。