# GeoSight in-da-house 🏠🌍

Raspberry Pi 上で [GeoSight](https://github.com/unicef-drp/GeoSight-OS) を簡単に立ち上げるための Justfile ベースのセットアップツール。

## 背景 / Background

このプロジェクトは、[UN Smart Maps](https://github.com/UNopenGIS/7) のミッション「新しい技術をオープンに保ちながらテストする」の一環として、UNICEF の GeoSight を Raspberry Pi 環境でテストするために作成されました。

GeoSight は UNICEF の地理空間ビジネスインテリジェンスプラットフォームで、地理データの可視化と分析を行うことができます。本プロジェクトは、小規模な Raspberry Pi 環境での GeoSight の稼働を可能にし、エッジコンピューティングや教育環境での利用を促進します。

## 対応環境 / Supported Environment

- **OS**: Raspberry Pi OS trixie (Debian 13) 64-bit
- **Hardware**: Raspberry Pi 4B (4GB RAM 推奨、最低 2GB)
- **Storage**: 32GB 以上の microSD カードまたは SSD

## 前提条件 / Prerequisites

- Raspberry Pi OS trixie 64-bit がインストール済み
- インターネット接続
- [just](https://github.com/casey/just) コマンドラインランナー

### just のインストール

```bash
# Debian/Raspberry Pi OS
sudo apt-get update
sudo apt-get install -y just

# または、公式リリースからインストール
curl --proto '=https' --tlsv1.2 -sSf https://just.systems/install.sh | bash -s -- --to /usr/local/bin
```

## クイックスタート / Quick Start

```bash
# リポジトリをクローン
git clone https://github.com/hfu/geosight-in-da-house.git
cd geosight-in-da-house

# インストールと起動を一度に実行
just doit
```

セットアップが完了したら、ブラウザで http://localhost:2000/ にアクセスしてください。

- **ユーザー名**: admin
- **パスワード**: admin

## タスク一覧 / Available Tasks

| タスク | 説明 |
|--------|------|
| `just install` | 必要なパッケージのインストールと GeoSight-OS のクローン |
| `just run` | GeoSight の起動（開発モード） |
| `just stop` | GeoSight の停止 |
| `just uninstall` | GeoSight の完全削除 |
| `just tunnel` | Cloudflare Tunnel でインターネットに公開 |
| `just doit` | install と run を続けて実行 |
| `just status` | コンテナのステータス確認 |
| `just logs` | ログの表示 |
| `just shell` | Django シェルへのアクセス |

## 詳細な使い方 / Detailed Usage

### インストール

```bash
just install
```

このコマンドは以下を実行します：
1. 必要なパッケージ（git, docker.io, docker-compose, curl, make）のインストール
2. Docker サービスの有効化と起動
3. 現在のユーザーを docker グループに追加
4. GeoSight-OS リポジトリのクローン
5. Raspberry Pi 用に最適化された設定ファイルの生成

### 起動

```bash
just run
```

このコマンドは以下を実行します：
1. Docker コンテナの起動
2. GeoSight の初期化
3. デモデータのロード

起動には Raspberry Pi 4B で 10-15 分程度かかる場合があります。

### Cloudflare Tunnel による公開

```bash
just tunnel
```

このコマンドは、Cloudflare Tunnel を使用して GeoSight をインターネットに公開します。一時的な公開 URL が生成され、外部からアクセスできるようになります。

**注意**: 本番環境での使用には適切なセキュリティ対策が必要です。

## 設定パラメータ / Configuration Parameters

### 環境変数

`GeoSight-OS/deployment/.env` ファイルで設定を変更できます：

| パラメータ | デフォルト値 | 説明 |
|-----------|-------------|------|
| `HTTP_PORT` | 2000 | HTTP ポート番号 |
| `HTTPS_PORT` | 2443 | HTTPS ポート番号 |
| `ADMIN_USERNAME` | admin | 管理者ユーザー名 |
| `ADMIN_PASSWORD` | admin | 管理者パスワード |
| `SECRET_KEY` | (自動生成) | Django シークレットキー |
| `PLUGINS` | cloud_native_gis,reference_dataset | 有効にするプラグイン |

### Raspberry Pi 最適化設定

本プロジェクトでは、Raspberry Pi の制限されたリソースに対応するため、以下の最適化を行っています：

- **Docker タイムアウト**: 300秒（通常より長め）
- **ログローテーション**: 7日分、50MB/ファイル
- **プラグイン**: 最小限（cloud_native_gis, reference_dataset）

## トラブルシューティング / Troubleshooting

### Docker グループエラー

初回インストール後、docker グループが反映されるまでログアウト・ログインが必要です：

```bash
# ログアウト
exit
# 再度ログイン後
just install
```

### メモリ不足

Raspberry Pi 4B (2GB) でメモリ不足が発生する場合、スワップを増やしてください：

```bash
sudo dphys-swapfile swapoff
sudo sed -i 's/CONF_SWAPSIZE=.*/CONF_SWAPSIZE=2048/' /etc/dphys-swapfile
sudo dphys-swapfile setup
sudo dphys-swapfile swapon
```

### ビルドが遅い

Raspberry Pi では Docker イメージのビルドに時間がかかります。初回ビルドには 30-60 分かかる場合があります。

## 出典・参考資料 / References

- **GeoSight-OS**: https://github.com/unicef-drp/GeoSight-OS
- **GeoSight Documentation**: https://unicef-drp.github.io/GeoSight-OS-Documentation/
- **GeoRepo-OS**: https://github.com/unicef-drp/GeoRepo-OS
- **UN Smart Maps Issue #821**: https://github.com/UNopenGIS/7/issues/821
- **just Command Runner**: https://github.com/casey/just
- **Cloudflare Tunnel**: https://developers.cloudflare.com/cloudflare-one/connections/connect-apps/

## 謝辞 / Acknowledgments

- **UNICEF** - GeoSight の開発と公開
- **Kartoza** - GeoSight の技術的な開発
- **@yuiseki** - [UNopenGIS/7#821](https://github.com/UNopenGIS/7/issues/821) での GeoSight セットアップ手順の発見と共有
- **UN Smart Maps コミュニティ** - オープンな地理空間技術の推進

## ライセンス / License

このプロジェクトは MIT ライセンスの下で公開されています。

GeoSight-OS 自体は [GNU AGPL v3](https://github.com/unicef-drp/GeoSight-OS/blob/main/LICENSE) の下でライセンスされています。

## 貢献 / Contributing

Issues や Pull Requests を歓迎します。

---

Made with ❤️ by [hfu](https://github.com/hfu) and GitHub Copilot
