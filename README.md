# GeoSight in-da-house 🏠🌍

Raspberry Pi 上で [GeoSight](https://github.com/unicef-drp/GeoSight-OS) を簡単に立ち上げるための Justfile ベースのセットアップツール。

## 背景 / Background

このプロジェクトは、[UN Smart Maps](https://github.com/UNopenGIS/7) のミッション「新しい技術をオープンに保ちながらテストする」の一環として、UNICEF の GeoSight を Raspberry Pi 環境でテストするために作成されました。

GeoSight は UNICEF の地理空間ビジネスインテリジェンスプラットフォームで、地理データの可視化と分析を行うことができます。本プロジェクトは、小規模な Raspberry Pi 環境での GeoSight の稼働を可能にし、エッジコンピューティングや教育環境での利用を促進します。

## なぜこのプロジェクトが価値があるのか / Why This Project is Valuable

### 🌍 地理空間技術の民主化 / Democratizing Geospatial Technology

GeoSight は本来、強力なサーバーインフラを必要とする UNICEF の地理空間ビジネスインテリジェンスプラットフォームです。本プロジェクトは、わずか数千円の Raspberry Pi でこの先進的な技術を動かせるようにすることで、以下を実現します：

- **教育機関での活用**: 限られた予算でも地理空間データ分析を学習・研究できる
- **開発途上国での展開**: 高価なサーバーインフラなしで地域の地理情報システムを構築できる
- **オフライン環境での利用**: インターネット接続が不安定な地域でも、ローカルで GeoSight を運用できる
- **個人開発者の参入障壁低減**: 気軽に GeoSight を試し、カスタマイズ・開発できる

### 🚀 エッジコンピューティングの実証 / Edge Computing Demonstration

Raspberry Pi 上で GeoSight を動作させることは、エッジコンピューティングの可能性を示す重要な実証実験です：

- **リソース制約下での最適化**: 限られた CPU・メモリでも動作する設定とノウハウを提供
- **ARM アーキテクチャ対応**: クラウド中心の x86 から ARM への移行を実証
- **省電力・小型化**: データセンター不要で、現地で完結するシステムの実現

### 🛠️ セットアップの自動化 / Setup Automation

GeoSight-OS の公式セットアップは複数のステップを手動で実行する必要があり、特に初心者には難易度が高いです。本プロジェクトは：

- **ワンコマンドインストール**: `just doit` で完全に自動化されたセットアップ
- **環境固有の最適化**: Raspberry Pi 特有の制約（I/O 速度、メモリ、ARM アーキテクチャ）に最適化
- **セキュリティのベストプラクティス**: 自動生成されたシークレットキー、適切なパーミッション設定
- **トラブルシューティング**: よくある問題と解決策を文書化

### 🌐 UN Smart Maps コミュニティへの貢献 / Contributing to UN Smart Maps Community

このプロジェクトは、UN Smart Maps の「オープンに技術をテストする」というミッションに沿っています：

- **知識の共有**: [UNopenGIS/7#821](https://github.com/UNopenGIS/7/issues/821) で得られた知見を再利用可能な形で提供
- **コミュニティの拡大**: より多くの人が GeoSight を試せるようにすることで、ユーザーベースと開発者コミュニティを拡大
- **フィードバックループ**: Raspberry Pi でのユースケースから得られた知見を UNICEF の開発にフィードバック

### 📚 実用的な価値 / Practical Value

具体的なユースケース：

1. **災害対応**: 現地に持ち込める小型デバイスで、オフラインで地理情報を管理・可視化
2. **フィールドワーク**: 調査地域で即座にデータを収集・分析
3. **教育ワークショップ**: 学生一人一台の環境で、実践的な地理空間データ分析を学習
4. **開発・テスト環境**: 本番サーバーに影響を与えずに、新機能やカスタマイズを試行

## 対応環境 / Supported Environment

- **OS**: Raspberry Pi OS trixie (Debian 13) 64-bit
- **Hardware**: Raspberry Pi 4B (4GB RAM 推奨、最低 2GB)
- **Storage**: 32GB 以上の microSD カードまたは SSD

## 前提条件 / Prerequisites

- Raspberry Pi OS trixie 64-bit がインストール済み
- インターネット接続
- [just](https://github.com/casey/just) コマンドラインランナー

> 💡 **Tip**: [niroku](https://github.com/unvt/niroku) を事前に導入している場合、just は既にインストールされているため、以下のインストール手順をスキップできます。niroku は UNVT Portable の新実装で、Raspberry Pi 上にオフライン地図サーバーを構築するための包括的なツールセットを提供します。

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

> ⚠️ **注意 / Note**: 初回インストール時に Docker グループへの追加が必要な場合、`just install` が途中で終了します。その場合は、ログアウト・ログインして `just run` を実行してください。詳細は[トラブルシューティング](#docker-グループエラー)を参照してください。

セットアップが完了したら、ブラウザで http://localhost:2000/ にアクセスしてください。

- **ユーザー名**: admin
- **パスワード**: admin

> ⚠️ **重要 / Important**: 初回ログイン後、すぐに管理者パスワードを変更してください！
> After first login, change the admin password immediately!

## タスク一覧 / Available Tasks

| タスク | 説明 |
|--------|------|
| `just install` | 必要なパッケージのインストールと GeoSight-OS のクローン |
| `just run` | GeoSight の起動（開発モード） |
| `just stop` | GeoSight の停止 |
| `just restart` | GeoSight の再起動 |
| `just uninstall` | GeoSight の完全削除 |
| `just tunnel` | Cloudflare Tunnel でインターネットに公開 |
| `just doit` | install と run を続けて実行 |
| `just status` | コンテナのステータス確認 |
| `just logs` | ログの表示 |
| `just shell` | Django シェルへのアクセス |
| `just clean` | 未使用の Docker リソースを削除 |
| `just info` | システム情報の表示 |

## 詳細な使い方 / Detailed Usage

### インストール

```bash
just install
```

このコマンドは以下を実行します：
1. 必要なパッケージ（git, docker.io, docker-compose-plugin, curl, make）のインストール
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

### Justfile 変数

Justfile の変数は `just --set` で上書きできます：

```bash
# カスタムポートで起動
just --set HTTP_PORT 8080 run

# カスタムリポジトリからクローン
just --set GEOSIGHT_REPO https://github.com/your-fork/GeoSight-OS.git install
```

| 変数 | デフォルト値 | 説明 |
|------|-------------|------|
| `GEOSIGHT_DIR` | GeoSight-OS | GeoSight-OS のディレクトリ名 |
| `HTTP_PORT` | 2000 | HTTP ポート番号 |
| `HTTPS_PORT` | 2443 | HTTPS ポート番号 |
| `COMPOSE_HTTP_TIMEOUT` | 300 | Docker Compose HTTP タイムアウト（秒） |
| `DOCKER_CLIENT_TIMEOUT` | 300 | Docker クライアントタイムアウト（秒） |

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

### Platform/Architecture エラー

ARM64 (aarch64) と AMD64 (x86_64) のプラットフォーム不一致に関するエラーが表示される場合：

```
The requested image's platform (linux/amd64) does not match the detected host platform (linux/arm64/v8)
```

**原因**: Docker が正しいアーキテクチャのイメージを使用していない

**解決策**:
1. 本プロジェクトは自動的に `DOCKER_DEFAULT_PLATFORM` 環境変数を設定します
2. 警告が表示されても、多くの場合は動作します（Docker が自動的にエミュレーションを使用）
3. エラーが続く場合は、以下を確認：
   ```bash
   # アーキテクチャを確認
   uname -m
   
   # Docker のマルチプラットフォームサポートを確認
   docker buildx ls
   ```

### データベース接続エラー

```
could not translate host name "db" to address: Name or service not known
```

**原因**: データベースコンテナがまだ起動していない、またはネットワーク設定の問題

**解決策**:
1. 本プロジェクトは自動的にデータベースの準備完了を待機します（`pg_isready` を使用）
2. 手動で確認する場合：
   ```bash
   # コンテナの状態を確認
   just status
   
   # データベースログを確認
   just logs | grep db
   
   # データベースの準備完了を確認
   cd GeoSight-OS
   docker compose -f deployment/docker-compose.yml -f deployment/docker-compose.override.yml \
       exec db pg_isready -U docker -d django
   ```
3. タイムアウトが足りない場合、Justfile の `MAX_ATTEMPTS` を増やすことができます

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

## セキュリティ / Security

### 本番環境での注意事項

本プロジェクトは開発・テスト目的で設計されています。本番環境で使用する場合は、以下の点に注意してください：

1. **管理者パスワード**: デフォルトの `admin/admin` を必ず変更し、強力なパスワードを設定してください
2. **SECRET_KEY, DATABASE_PASSWORD, REDIS_PASSWORD**: これらはインストール時に十分なエントロピーで自動生成されます。通常は変更する必要はありませんが、万が一漏洩やセキュリティインシデントが発生した場合は再生成してください
3. **ファイアウォール**: 必要なポートのみを開放してください
4. **Cloudflare Tunnel**: 本番環境では認証を追加してください

### Cloudflare Tunnel の注意

`just tunnel` で作成されるトンネルは一時的なもので、認証なしでアクセス可能です。長期運用や本番環境では、Cloudflare Zero Trust を使用してアクセス制御を設定してください。

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

このプロジェクトは CC0 1.0 Universal (パブリックドメイン) の下で公開されています。

**重要な注意事項 / Important Notes:**

- **本プロジェクトの範囲**: このリポジトリは、GeoSight-OS を Raspberry Pi 上で起動するための自動化スクリプト（Justfile）とドキュメントのみを含みます。GeoSight-OS 本体のコードは含まれておらず、改変や再配布も行いません。
- **GeoSight-OS のライセンス**: GeoSight-OS 本体は [GNU AGPL v3](https://github.com/unicef-drp/GeoSight-OS/blob/main/LICENSE) の下でライセンスされています。
- **AGPL の伝搬性**: 本プロジェクトは GeoSight-OS を使用するための設定とセットアップを提供するだけであり、GeoSight-OS のソースコードを改変していないため、AGPL のコピーレフト条項は本プロジェクトには適用されません。
- **UN Smart Maps での貢献**: UN Smart Maps グループでの @hfu の貢献は通常 CC0 として提供されます。

### What this means / 意味するところ

This project (the Justfile and documentation) is released into the public domain under CC0. You can use, modify, and distribute it freely without restrictions. However, GeoSight-OS itself remains under GNU AGPL v3, which applies if you modify or distribute GeoSight-OS.

本プロジェクト（Justfile とドキュメント）はCC0でパブリックドメインとして公開されています。制限なく自由に使用、改変、配布できます。ただし、GeoSight-OS 自体は GNU AGPL v3 のままであり、GeoSight-OS を改変または配布する場合にはそのライセンスが適用されます。

## 貢献 / Contributing

Issues や Pull Requests を歓迎します。

変更履歴については [CHANGELOG.md](CHANGELOG.md) を参照してください。

---

Made with ❤️ by [hfu](https://github.com/hfu) and GitHub Copilot
