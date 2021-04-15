# qiita_command

![CI](https://github.com/dodonki1223/qiita_command/workflows/CI/badge.svg?branch=master)

Qiitaのトレンド情報（Normal, Personal）をコマンドで取得しコンソール上に表示することができます

<img alt="00_sample" src="https://raw.githubusercontent.com/dodonki1223/image_garage/master/qiita_command/00_sample.gif" width="800px">

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

personal のトレンドを取得する時は設定が必要です  
**normalのみ取得したい場合は設定不要です**

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
# normalのトレンドを取得する
$ ./qiita

# normalのトレンドのNEWのものだけを取得する
$ ./qiita --new

# personalのトレンドを取得する
$ ./qiita -p
$ ./qiita --personal
```

## GitHub Actions

### CI

CIをGitHub Actionsにて以下のものを実行するようにしています

- Rubocopの実行
- RSpecの実行
- コードカバレッジを作成しGitHub Actions にアップロード
- GitHub Actions の結果をSlackに通知

### Gem Update の自動化

GitHub Actions の `on.schedule` を使用して毎月１日にGem Update用のプルリクが自動で作られるように設定してます

## その他

Qiitaのトレンド情報の取得に関しては [qiita_trend](https://github.com/dodonki1223/qiita_trend) を使用していますのでそちらを参照してください  
もし動作しなくなったら [qiita_trend](https://github.com/dodonki1223/qiita_trend) のバージョンを上げることをオススメします
