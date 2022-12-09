# Pooper + Qusine / チャンネルメッセージの絵文字を:poop:に置き換えるBot + Qusine（クサイン）付き

チャンネルのメッセージに絵文字が含まれている場合、その絵文字を:poop:に置き換えます。カスタム絵文字にも対応しています。
![](./images/demo.gif)

> **Note**
> Qusine（クサイン）は、[Quine](https://ja.wikipedia.org/wiki/%E3%82%AF%E3%83%AF%E3%82%A4%E3%83%B3_(%E3%83%97%E3%83%AD%E3%82%B0%E3%83%A9%E3%83%9F%E3%83%B3%E3%82%B0))のうち、特に異臭がするものを指す。
> 出典：なし

紹介記事：[圧倒的な異臭を放つBotを作ってみた ～Qusineを添えて～](https://zenn.dev/mnonamer/articles/ba3eee6eb48177)

## 使い方

1. `bundle install`で依存ライブラリをインストールします。
2. `.env.example`をコピーして`.env`を作成し、`TOKEN`にDiscordのBotのトークンを入力します。
3. `bundle exec discorb setup`でコマンドやDBをセットアップします。
4. `bundle exec discorb run formatted.rb`で起動します。

## ライセンス

MITライセンスです。詳しくは[LICENSE.txt](./LICENSE.txt)をご覧ください。

