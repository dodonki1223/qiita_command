# qiita_command

Qiitaのトレンド情報（Daily, Weekly, Monthly）をコマンドで取得しコンソール上に表示することができます

![00_sample](https://raw.githubusercontent.com/dodonki1223/image_garage/master/qiita_command/00_sample.gif)

## 環境設定

### ソースを取得する

```shell
$ git clone git@github.com:dodonki1223/qiita_command.git
```

### 依存関係をインストールする

```shell
$ bundle install
```

### Qiitaのログイン情報を設定する

weekly, monthly のトレンドを取得する時は設定が必要です  
**dailyのみ取得したい場合は設定不要です**

```shell
$ cp config_sample.yml config.yml
```

作成したconfig.ymlにログイン情報を設定します  
ymlファイルのそれぞれに値を設定します

```yml
user_name: LoginUserName
password: Password
cache_directory: path/to/sample
```

設定する項目については下記を確認してください

| 設定項目        | 説明                                                                              |
|:----------------|:----------------------------------------------------------------------------------|
| user_name       | Qiitaにログインするユーザー名です                                                 |
| password        | Qiitaにログインするユーザーのパスワードです                                       |
| cache_directory | Qiitaに対してスクレイピングした結果のキャッシュファイルを保存するディレクトリです |

**注意：GitHub, Twitter, Google のログインには対応していません**

## 使い方

```shell
# dailyのトレンドを取得する
$ ./qiita

# dailyのトレンドのNEWのものだけを取得する
$ ./qiita -n

# weeklyのトレンドを取得する
$ ./qiita -w
$ ./qiita --weekly

# weeklyのトレンドのNEWのものだけを取得する
$ ./qiita -w -n
$ ./qiita --weekly -n

# monthlyのトレンドを取得する
$ ./qiita -w
$ ./qiita --monthly

# monthlyのトレンドのNEWのものだけを取得する
$ ./qiita -w -n
$ ./qiita --monthly -n
```

## その他

Qiitaのトレンド情報の取得に関しては [qiita_trend](https://github.com/dodonki1223/qiita_trend) のgemを使用していますのでそちらを参照してください
