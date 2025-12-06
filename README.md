# GeoSight in-da-house 🏠🌍

> *"Geosight in da house, ARM64 we embrace"* - [RAP.md](RAP.md)  
> プロジェクトの物語を韻で綴ったRAPはこちら 🎤

## Overview / 概要

A Justfile-based setup tool for easily deploying [GeoSight](https://github.com/unicef-drp/GeoSight-OS) on Raspberry Pi.

Raspberry Pi 上で [GeoSight](https://github.com/unicef-drp/GeoSight-OS) を簡単に立ち上げるための Justfile ベースのセットアップツール。

## Background / 背景

This project was created as part of the [UN Smart Maps](https://github.com/UNopenGIS/7) mission to "test new technologies while keeping them open", enabling UNICEF's GeoSight to run in Raspberry Pi environments.

このプロジェクトは、[UN Smart Maps](https://github.com/UNopenGIS/7) のミッション「新しい技術をオープンに保ちながらテストする」の一環として、UNICEF の GeoSight を Raspberry Pi 環境でテストするために作成されました。

GeoSight is UNICEF's geospatial business intelligence platform for visualizing and analyzing geographic data. This project enables GeoSight to run in small-scale Raspberry Pi environments, promoting edge computing and educational use cases.

GeoSight は UNICEF の地理空間ビジネスインテリジェンスプラットフォームで、地理データの可視化と分析を行うことができます。本プロジェクトは、小規模な Raspberry Pi 環境での GeoSight の稼働を可能にし、エッジコンピューティングや教育環境での利用を促進します。

## Why This Project is Valuable / なぜこのプロジェクトが価値があるのか

### 🌍 Democratizing Geospatial Technology / 地理空間技術の民主化

GeoSight originally requires powerful server infrastructure as UNICEF's geospatial business intelligence platform. This project enables this advanced technology to run on a Raspberry Pi costing only a few thousand yen, achieving:

GeoSight は本来、強力なサーバーインフラを必要とする UNICEF の地理空間ビジネスインテリジェンスプラットフォームです。本プロジェクトは、わずか数千円の Raspberry Pi でこの先進的な技術を動かせるようにすることで、以下を実現します：

- **Educational institutions**: Learn and research geospatial data analysis even with limited budgets / **教育機関での活用**: 限られた予算でも地理空間データ分析を学習・研究できる
- **Developing countries**: Build regional geographic information systems without expensive server infrastructure / **開発途上国での展開**: 高価なサーバーインフラなしで地域の地理情報システムを構築できる
- **Offline environments**: Run GeoSight locally even in areas with unstable internet connections / **オフライン環境での利用**: インターネット接続が不安定な地域でも、ローカルで GeoSight を運用できる
- **Individual developers**: Lower barriers to trying, customizing, and developing GeoSight / **個人開発者の参入障壁低減**: 気軽に GeoSight を試し、カスタマイズ・開発できる

### 🚀 Edge Computing Demonstration / エッジコンピューティングの実証

Running GeoSight on Raspberry Pi is an important demonstration of edge computing possibilities:

Raspberry Pi 上で GeoSight を動作させることは、エッジコンピューティングの可能性を示す重要な実証実験です：

- **Resource-constrained optimization**: Provide configurations and know-how to run with limited CPU and memory / **リソース制約下での最適化**: 限られた CPU・メモリでも動作する設定とノウハウを提供
- **ARM architecture support**: Demonstrate migration from cloud-centric x86 to ARM / **ARM アーキテクチャ対応**: クラウド中心の x86 から ARM への移行を実証
- **Power efficiency and miniaturization**: Realize systems that work locally without data centers / **省電力・小型化**: データセンター不要で、現地で完結するシステムの実現

### 🛠️ Setup Automation / セットアップの自動化

GeoSight-OS official setup requires multiple manual steps, making it difficult especially for beginners. This project provides:

GeoSight-OS の公式セットアップは複数のステップを手動で実行する必要があり、特に初心者には難易度が高いです。本プロジェクトは：

- **One-command installation**: Fully automated setup with `just doit` / **ワンコマンドインストール**: `just doit` で完全に自動化されたセットアップ
- **Environment-specific optimization**: Optimized for Raspberry Pi constraints (I/O speed, memory, ARM architecture) / **環境固有の最適化**: Raspberry Pi 特有の制約（I/O 速度、メモリ、ARM アーキテクチャ）に最適化
- **Security best practices**: Auto-generated secret keys, proper permission settings / **セキュリティのベストプラクティス**: 自動生成されたシークレットキー、適切なパーミッション設定
- **Troubleshooting**: Document common problems and solutions / **トラブルシューティング**: よくある問題と解決策を文書化

### 🌐 Contributing to UN Smart Maps Community / UN Smart Maps コミュニティへの貢献

This project aligns with UN Smart Maps' mission to "test technologies openly":

このプロジェクトは、UN Smart Maps の「オープンに技術をテストする」というミッションに沿っています：

- **Knowledge sharing**: Provide findings from [UNopenGIS/7#821](https://github.com/UNopenGIS/7/issues/821) in reusable form / **知識の共有**: [UNopenGIS/7#821](https://github.com/UNopenGIS/7/issues/821) で得られた知見を再利用可能な形で提供
- **Community expansion**: Expand user base and developer community by making GeoSight accessible to more people / **コミュニティの拡大**: より多くの人が GeoSight を試せるようにすることで、ユーザーベースと開発者コミュニティを拡大
- **Feedback loop**: Provide feedback to UNICEF development from Raspberry Pi use cases / **フィードバックループ**: Raspberry Pi でのユースケースから得られた知見を UNICEF の開発にフィードバック

### 📚 Practical Value / 実用的な価値

Concrete use cases / 具体的なユースケース：

1. **Disaster response**: Manage and visualize geographic information offline with portable small devices / **災害対応**: 現地に持ち込める小型デバイスで、オフラインで地理情報を管理・可視化
2. **Field work**: Collect and analyze data immediately in survey areas / **フィールドワーク**: 調査地域で即座にデータを収集・分析
3. **Educational workshops**: Learn practical geospatial data analysis with one device per student / **教育ワークショップ**: 学生一人一台の環境で、実践的な地理空間データ分析を学習
4. **Development/testing environment**: Try new features and customizations without affecting production servers / **開発・テスト環境**: 本番サーバーに影響を与えずに、新機能やカスタマイズを試行

## Supported Environment / 対応環境

- **OS**: Raspberry Pi OS trixie (Debian 13) 64-bit
- **Hardware**: Raspberry Pi 4B (4GB RAM recommended, minimum 2GB)
- **Storage**: microSD card or SSD with 32GB or more

## Prerequisites / 前提条件

- Raspberry Pi OS trixie 64-bit installed / Raspberry Pi OS trixie 64-bit がインストール済み
- Internet connection / インターネット接続
- [just](https://github.com/casey/just) command runner

> 💡 **Tip**: If you have [niroku](https://github.com/unvt/niroku) pre-installed, just is already available, so you can skip the installation steps below. niroku is the new implementation of UNVT Portable, providing a comprehensive toolset for building offline map servers on Raspberry Pi.
>
> [niroku](https://github.com/unvt/niroku) を事前に導入している場合、just は既にインストールされているため、以下のインストール手順をスキップできます。niroku は UNVT Portable の新実装で、Raspberry Pi 上にオフライン地図サーバーを構築するための包括的なツールセットを提供します。

### Installing just / just のインストール

```bash
# Debian/Raspberry Pi OS
sudo apt-get update
sudo apt-get install -y just

# Or install from official release / または、公式リリースからインストール
curl --proto '=https' --tlsv1.2 -sSf https://just.systems/install.sh | bash -s -- --to /usr/local/bin
```

## Quick Start / クイックスタート

```bash
# Clone repository / リポジトリをクローン
git clone https://github.com/hfu/geosight-in-da-house.git
cd geosight-in-da-house

# Install and run at once / インストールと起動を一度に実行
just doit
```

> ⚠️ **Note / 注意**: If Docker group addition is needed during first installation, `just install` will exit midway. In that case, log out and log in, then run `just run`. See [Troubleshooting](#docker-group-error--docker-グループエラー) for details.
>
> 初回インストール時に Docker グループへの追加が必要な場合、`just install` が途中で終了します。その場合は、ログアウト・ログインして `just run` を実行してください。詳細は[トラブルシューティング](#docker-group-error--docker-グループエラー)を参照してください。

After setup completes, access http://localhost:2000/ in your browser.

セットアップが完了したら、ブラウザで http://localhost:2000/ にアクセスしてください。

- **Username / ユーザー名**: admin
- **Password / パスワード**: admin

> ⚠️ **Important / 重要**: Change the admin password immediately after first login!
>
> 初回ログイン後、すぐに管理者パスワードを変更してください！

## Available Tasks / タスク一覧

| Task | Description |
|------|-------------|
| `just install` | Install required packages and clone GeoSight-OS<br>必要なパッケージのインストールと GeoSight-OS のクローン |
| `just run` | Start GeoSight (production mode)<br>GeoSight の起動（本番モード） |
| `just load-demo-data` | Load demo data (sample projects, indicators, geographic data)<br>デモデータ（サンプルプロジェクト、指標、地理データ）のロード |
| `just make-demo-public` | Make demo project publicly accessible<br>デモプロジェクトを公開設定にする |
| `just stop` | Stop GeoSight<br>GeoSight の停止 |
| `just restart` | Restart GeoSight<br>GeoSight の再起動 |
| `just uninstall` | Completely remove GeoSight<br>GeoSight の完全削除 |
| `just tunnel` | Publish to internet via Cloudflare Tunnel<br>Cloudflare Tunnel でインターネットに公開 |
| `just doit` | Run install and run consecutively<br>install と run を続けて実行 |
| `just status` | Check container status<br>コンテナのステータス確認 |
| `just logs` | Display logs<br>ログの表示 |
| `just shell` | Access Django shell<br>Django シェルへのアクセス |
| `just clean` | Remove unused Docker resources<br>未使用の Docker リソースを削除 |
| `just info` | Display system information<br>システム情報の表示 |

## Detailed Usage / 詳細な使い方

### Installation / インストール

```bash
just install
```

This command executes:

このコマンドは以下を実行します：

1. Install required packages (git, docker.io, docker-compose-plugin, curl, make) / 必要なパッケージのインストール
2. Enable and start Docker service / Docker サービスの有効化と起動
3. Add current user to docker group / 現在のユーザーを docker グループに追加
4. Clone GeoSight-OS repository / GeoSight-OS リポジトリのクローン
5. Generate configuration files optimized for Raspberry Pi / Raspberry Pi 用に最適化された設定ファイルの生成
6. **For ARM64**: Automatically copy custom Dockerfiles for PostGIS and pg-backup / **ARM64 の場合**: PostGIS と pg-backup 用のカスタム Dockerfile を自動コピー

### Starting / 起動

```bash
just run
```

This command executes:

このコマンドは以下を実行します：

1. **For ARM64**: Build PostGIS and pg-backup from Dockerfile (15-30 min first time) / **ARM64 の場合**: PostGIS と pg-backup を Dockerfile からビルド（初回のみ 15-30 分）
2. Start Docker containers / Docker コンテナの起動
3. Initialize GeoSight / GeoSight の初期化
4. Load demo data / デモデータのロード

Startup time on Raspberry Pi 4B:

起動には Raspberry Pi 4B で以下の時間がかかります：

- First startup (with build): 30-60 min / 初回起動（ビルドあり）: 30-60 分
- Second and later: 10-15 min / 2 回目以降: 10-15 分

**Important**: On ARM64 architecture (Raspberry Pi), since Docker images like `kartoza/postgis:13.0` don't have ARM64 versions, they are automatically built from Dockerfile on first startup. This takes time, but subsequent runs use cached images and are fast.

**重要**: ARM64 アーキテクチャ (Raspberry Pi) では、`kartoza/postgis:13.0` などの Docker イメージに ARM64 対応版が存在しないため、初回起動時に自動的に Dockerfile からビルドします。これには時間がかかりますが、2 回目以降はキャッシュされたイメージを使用するため高速です。

### Loading Demo Data / デモデータのロード

```bash
just load-demo-data
```

After initial setup, GeoSight has no data loaded. This command loads sample projects, indicators, and geographic data. Demo data includes:

初回セットアップ後、GeoSight にはデータがロードされていません。このコマンドでサンプルのプロジェクト、指標、地理データをロードできます。デモデータには以下が含まれます：

- **Sample projects**: Multiple dashboards and visualizations / **サンプルプロジェクト**: 複数のダッシュボードとビジュアライゼーション
- **Indicator data**: Statistical data for population, education, health, etc. / **指標データ**: 人口、教育、健康などの統計データ
- **Geographic data**: Country, region, and administrative boundary data / **地理データ**: 国、地域、行政区画の境界データ
- **Context layers**: Background maps and reference layers / **コンテキストレイヤー**: 背景地図や参照レイヤー

Demo data helps understand GeoSight's features and serves as a reference when creating your own projects.

デモデータは GeoSight の機能を理解し、独自のプロジェクトを作成する際の参考として役立ちます。

### Publishing via Cloudflare Tunnel / Cloudflare Tunnel による公開

```bash
just tunnel
```

This command publishes GeoSight to the internet using Cloudflare Tunnel. A temporary public URL is generated, making it accessible from outside.

このコマンドは、Cloudflare Tunnel を使用して GeoSight をインターネットに公開します。一時的な公開 URL が生成され、外部からアクセスできるようになります。

**Note**: Proper security measures are required for production use.

**注意**: 本番環境での使用には適切なセキュリティ対策が必要です。

## Configuration Parameters / 設定パラメータ

### Justfile Variables / Justfile 変数

Justfile variables can be overridden with `just --set`:

Justfile の変数は `just --set` で上書きできます：

```bash
# Start with custom port / カスタムポートで起動
just --set HTTP_PORT 8080 run

# Clone from custom repository / カスタムリポジトリからクローン
just --set GEOSIGHT_REPO https://github.com/your-fork/GeoSight-OS.git install
```

| Variable | Default | Description |
|----------|---------|-------------|
| `GEOSIGHT_DIR` | GeoSight-OS | GeoSight-OS directory name<br>GeoSight-OS のディレクトリ名 |
| `HTTP_PORT` | 2000 | HTTP port number<br>HTTP ポート番号 |
| `HTTPS_PORT` | 2443 | HTTPS port number<br>HTTPS ポート番号 |
| `COMPOSE_HTTP_TIMEOUT` | 300 | Docker Compose HTTP timeout (seconds)<br>Docker Compose HTTP タイムアウト（秒） |
| `DOCKER_CLIENT_TIMEOUT` | 300 | Docker client timeout (seconds)<br>Docker クライアントタイムアウト（秒） |

### Environment Variables / 環境変数

Settings can be changed in `GeoSight-OS/deployment/.env` file:

`GeoSight-OS/deployment/.env` ファイルで設定を変更できます：

| Parameter | Default | Description |
|-----------|---------|-------------|
| `HTTP_PORT` | 2000 | HTTP port number<br>HTTP ポート番号 |
| `HTTPS_PORT` | 2443 | HTTPS port number<br>HTTPS ポート番号 |
| `ADMIN_USERNAME` | admin | Admin username<br>管理者ユーザー名 |
| `ADMIN_PASSWORD` | admin | Admin password<br>管理者パスワード |
| `SECRET_KEY` | (auto-generated) | Django secret key<br>Django シークレットキー |
| `PLUGINS` | cloud_native_gis,reference_dataset | Enabled plugins<br>有効にするプラグイン |

### Raspberry Pi Optimization Settings / Raspberry Pi 最適化設定

This project applies the following optimizations for Raspberry Pi's limited resources:

本プロジェクトでは、Raspberry Pi の制限されたリソースに対応するため、以下の最適化を行っています:

- **Docker timeout**: 300 seconds (longer than usual) / **Docker タイムアウト**: 300秒（通常より長め）
- **Log rotation**: 7 days, 50MB/file / **ログローテーション**: 7日分、50MB/ファイル
- **Plugins**: Minimal (cloud_native_gis, reference_dataset) / **プラグイン**: 最小限（cloud_native_gis, reference_dataset）
- **Webpack production build**: Switched from development mode (hot reload) to production build / **Webpack 本番ビルド**: 開発モード（ホットリロード）から本番ビルドに切り替え
  - CPU usage reduced from 180% to nearly 0% / CPU 使用率を 180% から ほぼ 0% に削減
  - Memory limit: 1.5GB (about 1/3 of 4GB RAM) / メモリ制限: 1.5GB（4GB RAM の約 1/3）
  - Persist npm cache and node_modules for faster second startup / npm キャッシュと node_modules の永続化で 2 回目以降の起動を高速化

## Troubleshooting / トラブルシューティング

### Demo Project Not Displaying / デモプロジェクトが表示されない

Demo projects require public permission settings:

デモプロジェクトは公開パーミッションの設定が必要です：

```bash
# Make demo project public / デモプロジェクトを公開設定にする
just make-demo-public
```

**Check in browser console / ブラウザコンソールで確認すべきこと:**

- ✅ No 403 (Forbidden) errors → Permissions configured correctly / 403 (Forbidden) エラーがない → パーミッション設定が正しい
- ⚠️ 404 `/en-us/docs/data` → Ignore (documentation feature, not needed for demo) / 無視してOK（ドキュメント機能、デモに不要）
- ⚠️ i18next missingKey → Ignore (missing translation files, doesn't affect display) / 無視してOK（翻訳ファイル不足、表示には影響なし）

**Verification points / 確認ポイント:**

- Indicator data displays on map / インジケーターデータが地図上に表示される
- Widgets work properly / ウィジェットが正常に動作する
- Layer switching works in side panel / サイドパネルでレイヤーの切り替えができる

### "exec format error" Error / "exec format error" エラー

If you see this error during Docker build:

Docker ビルド時に以下のようなエラーが表示される場合：

```
exec /bin/sh: exec format error
```

**Cause**: Docker is pulling the wrong architecture base image during build

**原因**: Docker がビルド時に間違ったアーキテクチャの base イメージをプルしている

**Solution / 解決策**:

1. This project auto-detects ARM64 architecture and sets appropriate platform configuration / 本プロジェクトは ARM64 アーキテクチャを自動検出し、適切な platform 設定を行います
2. Running `just install` generates ARM64-compatible docker-compose override files / `just install` を実行すると、ARM64 対応の docker-compose オーバーライドファイルが自動生成されます
3. docker-compose's `build.platform` field is set to `linux/arm64`, ensuring correct architecture base images / docker-compose の `build.platform` フィールドが `linux/arm64` に設定され、正しいアーキテクチャの base イメージが使用されます
4. DOCKER_DEFAULT_PLATFORM environment variable is also set automatically / DOCKER_DEFAULT_PLATFORM 環境変数も自動的に設定されます

### Platform/Architecture Error / Platform/Architecture エラー

If you see platform mismatch errors between ARM64 (aarch64) and AMD64 (x86_64):

ARM64 (aarch64) と AMD64 (x86_64) のプラットフォーム不一致に関するエラーが表示される場合：

```
Error response from daemon: image with reference kartoza/postgis:13.0 was found but does not match the specified platform: wanted linux/arm64, actual: linux/amd64
```

Or / または

```
The requested image's platform (linux/amd64) does not match the detected host platform (linux/arm64/v8)
```

**Cause**: Some images like `kartoza/postgis:13.0` don't have ARM64 versions

**原因**: `kartoza/postgis:13.0` などの一部のイメージに ARM64 対応版が存在しない

**Solution / 解決策**:

1. This project auto-detects ARM64 architecture and implements these countermeasures / 本プロジェクトは ARM64 アーキテクチャを自動検出し、以下の対策を実施します：
   - Automatically copy custom Dockerfiles for ARM64-incompatible images / ARM64 非対応イメージ用のカスタム Dockerfile を自動コピー
   - Auto-generate ARM64 docker-compose override file (`docker-compose.override.arm64.yml`) / ARM64 用の docker-compose オーバーライドファイル (`docker-compose.override.arm64.yml`) を自動生成
   - Build ARM64-compatible images from Dockerfile when running `just run` / `just run` 実行時に ARM64 対応イメージを Dockerfile からビルド
2. **First build time**: PostGIS and pg-backup build takes about 15-30 minutes on Raspberry Pi. Subsequent runs use cached images and are fast / **初回ビルド時間**: PostGIS と pg-backup のビルドに Raspberry Pi で 15-30 分程度かかります。2 回目以降はキャッシュされたイメージを使用するため高速です
3. Running `just install` automatically detects ARM64 platform and configures settings / `just install` を実行すると、ARM64 プラットフォームの検出と設定が自動的に行われます
4. **For existing installations**: If GeoSight-OS is already installed, re-run `just install` to create ARM64-compatible files / **既存インストールの場合**: GeoSight-OS が既にインストールされている場合は、`just install` を再実行して ARM64 対応ファイルを作成してください
5. Verify build completion / ビルドが完了しているか確認：

```bash
# Check architecture / アーキテクチャを確認
uname -m

# Verify ARM64 images are built / ARM64 用イメージがビルドされているか確認
docker images | grep geosight

# Verify ARM64 override files are created / ARM64 オーバーライドファイルが作成されているか確認
ls -la GeoSight-OS/deployment/docker-compose.override.arm64.yml
ls -la GeoSight-OS/deployment/dockerfiles/
```

### Database Connection Error / データベース接続エラー

```
could not translate host name "db" to address: Name or service not known
```

**Cause**: Database container hasn't started yet, or network configuration issue

**原因**: データベースコンテナがまだ起動していない、またはネットワーク設定の問題

**Solution / 解決策**:

1. This project automatically waits for database readiness (using `pg_isready`) / 本プロジェクトは自動的にデータベースの準備完了を待機します（`pg_isready` を使用）
2. To verify manually / 手動で確認する場合：

```bash
# Check container status / コンテナの状態を確認
just status

# Check database logs / データベースログを確認
just logs | grep db

# Verify database readiness / データベースの準備完了を確認
cd GeoSight-OS
docker compose -f deployment/docker-compose.yml -f deployment/docker-compose.override.yml \
    exec db pg_isready -U docker -d django
```

3. If timeout is insufficient, you can increase `MAX_ATTEMPTS` in Justfile / タイムアウトが足りない場合、Justfile の `MAX_ATTEMPTS` を増やすことができます

### Docker Group Error / Docker グループエラー

After first installation, log out and log in for docker group to take effect:

初回インストール後、docker グループが反映されるまでログアウト・ログインが必要です：

```bash
# Log out / ログアウト
exit
# After logging back in / 再度ログイン後
just install
```

### Out of Memory / メモリ不足

If out of memory occurs on Raspberry Pi 4B (2GB), increase swap:

Raspberry Pi 4B (2GB) でメモリ不足が発生する場合、スワップを増やしてください：

```bash
sudo dphys-swapfile swapoff
sudo sed -i 's/CONF_SWAPSIZE=.*/CONF_SWAPSIZE=2048/' /etc/dphys-swapfile
sudo dphys-swapfile setup
sudo dphys-swapfile swapon
```

### Slow Build / ビルドが遅い

Docker image builds take time on Raspberry Pi. First build may take 30-60 minutes.

Raspberry Pi では Docker イメージのビルドに時間がかかります。初回ビルドには 30-60 分かかる場合があります。

## Security / セキュリティ

### Production Environment Notes / 本番環境での注意事項

This project is designed for development and testing purposes. For production use, note the following:

本プロジェクトは開発・テスト目的で設計されています。本番環境で使用する場合は、以下の点に注意してください：

1. **Admin password**: Always change default `admin/admin` and set a strong password / **管理者パスワード**: デフォルトの `admin/admin` を必ず変更し、強力なパスワードを設定してください
2. **SECRET_KEY, DATABASE_PASSWORD, REDIS_PASSWORD**: These are auto-generated with sufficient entropy at installation. Normally no need to change, but regenerate if leaked or after security incidents / **SECRET_KEY, DATABASE_PASSWORD, REDIS_PASSWORD**: これらはインストール時に十分なエントロピーで自動生成されます。通常は変更する必要はありませんが、万が一漏洩やセキュリティインシデントが発生した場合は再生成してください
3. **Firewall**: Open only necessary ports / **ファイアウォール**: 必要なポートのみを開放してください
4. **Cloudflare Tunnel**: Add authentication for production / **Cloudflare Tunnel**: 本番環境では認証を追加してください

### Cloudflare Tunnel Notes / Cloudflare Tunnel の注意

Tunnels created with `just tunnel` are temporary and accessible without authentication. For long-term operation or production, configure access control using Cloudflare Zero Trust.

`just tunnel` で作成されるトンネルは一時的なもので、認証なしでアクセス可能です。長期運用や本番環境では、Cloudflare Zero Trust を使用してアクセス制御を設定してください。

## Technical Achievements / 技術的成果

### Core Optimizations / コア最適化

- ✅ **Webpack CPU**: 180% → 0.01% (near-zero, production build) / 180% → 0.01%（ほぼゼロ、本番ビルド）
- ✅ **Production Mode**: nginx + django + postgres (no dev server) / 本番モード（開発サーバーなし）
- ✅ **Resource Efficiency**: All services under 5% CPU at idle / アイドル時の全サービスが 5% 未満
- ✅ **Memory Optimized**: 1536MB limit for webpack build, npm cache persistence / webpack ビルド 1536MB 制限、npm キャッシュ永続化

### ARM64 Compatibility / ARM64 互換性

- ✅ **Custom Builds**: PostGIS 13-3.4 and pg-backup from source / ソースからの PostGIS 13-3.4 と pg-backup ビルド
- ✅ **Platform Override**: `docker-compose.override.arm64.yml` with proper isolation / 適切な分離を持つオーバーライド
- ✅ **Logrotate Solution**: Alpine Linux replacement (6-year-old blacklabelops image bypassed) / Alpine Linux 置き換え（6年前の blacklabelops イメージを回避）
- ✅ **Docker Buildx**: Multi-platform builds with binfmt/qemu emulation / binfmt/qemu エミュレーションによるマルチプラットフォームビルド

### Automation & DevOps / 自動化と DevOps

- ✅ **Two-Command Setup**: `just install; just run` - that's it / 2 コマンドセットアップ
- ✅ **Idempotent Scripts**: Re-run safe, self-healing overrides / 再実行安全、自己修復オーバーライド
- ✅ **Template System**: Base → Override → ARM64 → Production chain / テンプレートシステムチェーン
- ✅ **Security Defaults**: Random secrets, proper ownership (redis 999:999) / ランダムシークレット、適切な所有権
- ✅ **Health Checks**: Database ready detection, 5-minute timeout / データベース準備完了検出、5分タイムアウト
- ✅ **Compose V2**: Obsolete `version:` keys sanitized automatically / 廃止された `version:` キーを自動削除

### Infrastructure as Code / コードとしてのインフラ

- ✅ **Justfile**: 817 lines of Raspberry Pi optimization / Raspberry Pi 最適化の 817 行
- ✅ **Git-based Workflow**: Templates copied to deployment/ on install / インストール時に deployment/ にテンプレートをコピー
- ✅ **Makefile Integration**: `${ARGS}` variable (not `COMPOSE_FILE` env) / `${ARGS}` 変数（`COMPOSE_FILE` 環境変数ではなく）
- ✅ **Override Refresh**: Auto-repair malformed YAML from earlier runs / 以前の実行からの不正な YAML を自動修復

## Performance Metrics / パフォーマンスメトリクス

| Service | CPU (Idle) | CPU (Peak) | Memory | Notes |
|---------|-----------|-----------|--------|-------|
| django | 0.01% | 270% (build) | ~400MB | uWSGI workers |
| nginx | 0.00% | <1% | ~10MB | Static files + proxy |
| postgres | 0.00% | 33% (init) | ~100MB | PostGIS enabled |
| redis | 1.30% | ~2% | ~15MB | Cache + Celery |
| worker | 0.15% | ~5% | ~300MB | Celery tasks |
| celery_beat | 0.00% | 98% (init) | ~200MB | Scheduler |
| logrotate | 0.00% | 0.00% | ~1MB | Alpine stub (disabled) |

**Total Idle**: ~5% CPU, ~1.1GB RAM - leaves 2.9GB for OS and browser on 4GB Pi

**合計アイドル**: CPU 約 5%、RAM 約 1.1GB - 4GB Pi で OS とブラウザ用に 2.9GB の余裕

### Performance Constraints / パフォーマンスの制約

Raspberry Pi operation is slower than production servers due to the following factors:

Raspberry Pi での動作は以下の要因により、本番サーバーと比較して遅くなります:

1. **QEMU Emulation / QEMU エミュレーション**: Running PostgreSQL (AMD64) on ARM64 goes through qemu-x86_64 emulation layer
   - Significant delays in database queries / データベースクエリに顕著な遅延
   - Even more noticeable in PostGIS geospatial operations / PostGIS の地理空間演算でさらに顕著
   - **Solution**: None (ARM64 native PostGIS images are limited) / **解決策**: なし（ARM64 ネイティブ PostGIS イメージは限定的）

2. **Storage I/O / ストレージ I/O**:
   - microSD cards have slow read/write speeds (around 20-50 MB/s) / microSD カードは読み書き速度が遅い（20-50 MB/s 程度）
   - Docker layer system causes multiple reads / Docker のレイヤーシステムで複数回の読み込みが発生
   - **Partial improvement**: Using USB 3.0 SSD speeds up 5-10x / **部分的な改善**: USB 3.0 SSD を使用すると 5-10 倍高速化

3. **CPU Power / CPU パワー**:
   - Raspberry Pi 4B's ARM Cortex-A72 is power-efficient design / Raspberry Pi 4B の ARM Cortex-A72 は省電力設計
   - 4 cores, but less than 1/10 performance compared to server CPUs / 4コアだが、サーバー用 CPU と比較すると 1/10 以下の性能
   - **Mitigation**: CPU load reduced with production build mode (webpack disabled) / **緩和策**: 本番ビルドモード（webpack 無効化）で CPU 負荷を削減済み

4. **Memory Bandwidth / メモリ帯域幅**:
   - LPDDR4-3200 (4GB model) is sufficient but shared across multiple services / LPDDR4-3200（4GB モデル）は十分だが、複数サービスで共有
   - If swap occurs, microSD slowness makes it extremely slow / スワップが発生すると microSD の遅さで激遅になる
   - **Already addressed**: Memory usage optimized (1.1GB, with margin) / **対策済み**: メモリ使用量の最適化（1.1GB、余裕を確保）

**Realistic Expectations / 現実的な期待値:**

- Page load: 3-10 seconds (first time), 1-3 seconds (cached) / ページロード: 3-10秒（初回）、1-3秒（キャッシュ後）
- Map rendering: 5-15 seconds (varies by data volume) / 地図レンダリング: 5-15秒（データ量により変動）
- Data updates: 10-30 seconds (including PostGIS processing) / データ更新: 10-30秒（PostGIS 処理含む）

**This is the Raspberry Pi limit, and is sufficiently practical for educational, demo, and offline use.**

**これは Raspberry Pi の限界であり、教育・デモ・オフライン用途には十分実用的です。**

## Lessons Learned / 開発の教訓

Key findings from this project's development:

このプロジェクトの開発で得られた重要な知見：

### ARM64 Architecture Support / ARM64 アーキテクチャ対応

1. **Docker image compatibility / Docker イメージの互換性**:
   - Not all Docker images have ARM64 versions / すべての Docker イメージに ARM64 対応版があるわけではない
   - `kartoza/postgis:13.0` and `kartoza/pg-backup:13.0` are AMD64 only / AMD64 のみ
   - Emulation is impractical on resource-limited devices like Raspberry Pi / エミュレーションは Raspberry Pi のような限られたリソースでは現実的でない

2. **Building from Dockerfile strategy / Dockerfile からのビルド戦略**:
   - Use official ARM64-compatible base images (`postgis/postgis:13-3.4-alpine`) / 公式の ARM64 対応ベースイメージを使用
   - Add environment variable compatibility layer (`POSTGRES_PASS` → `POSTGRES_PASSWORD` etc.) / 環境変数の互換性レイヤーを追加
   - First build takes time, but second and later are fast due to caching / 初回ビルドに時間がかかるが、キャッシュにより 2 回目以降は高速化

3. **docker-compose override / docker-compose のオーバーライド**:
   - Selectively build images with ARM64-specific override files / ARM64 専用のオーバーライドファイルで選択的にイメージをビルド
   - Add ARM64 support without modifying existing docker-compose.yml / 既存の docker-compose.yml を変更せずに ARM64 対応を追加
   - Chain multiple override files with `COMPOSE_FILE` environment variable / `COMPOSE_FILE` 環境変数で複数のオーバーライドファイルを連結

4. **Resolving "exec format error" / "exec format error" の解決**:
   - "exec format error" during Docker build is caused by pulling wrong architecture base images / Docker ビルド時の "exec format error" は、間違ったアーキテクチャの base イメージがプルされることが原因
   - Resolve by explicitly specifying platform in docker-compose's `build.platform` field / docker-compose の `build.platform` フィールドで明示的にプラットフォームを指定することで解決
   - Hardcoding `--platform` in Dockerfile is not best practice (prevents multi-platform builds) / Dockerfile 内で `--platform` をハードコードするのはベストプラクティスではない（マルチプラットフォームビルドを妨げる）
   - Combine with `DOCKER_DEFAULT_PLATFORM` environment variable to reliably use correct architecture / `DOCKER_DEFAULT_PLATFORM` 環境変数と組み合わせることで、確実に正しいアーキテクチャを使用

### Raspberry Pi Optimization / Raspberry Pi 最適化

1. **Addressing resource constraints / リソース制約への対応**:
   - Extend Docker timeout to 300 seconds (default is 60 seconds) / Docker タイムアウトを 300 秒に延長（デフォルトは 60 秒）
   - Reduce log rotation to 7 days, 50MB / ログローテーションを 7 日、50MB に削減
   - Minimal plugin configuration (cloud_native_gis, reference_dataset only) / 最小限のプラグイン構成（cloud_native_gis, reference_dataset のみ）

2. **Build time considerations / ビルド時間の考慮**:
   - First build: 30-60 min (PostGIS, pg-backup, Django, nginx) / 初回ビルド: 30-60 分
   - Second and later: 10-15 min (using cache) / 2 回目以降: 10-15 分（キャッシュ利用）
   - Setting clear time expectations for users is important / ユーザーへの明確な時間の期待値設定が重要

3. **VSCode handling / VSCode の扱い**:
   - GeoSight-OS's setup.sh recommends VSCode, but unnecessary on Raspberry Pi / GeoSight-OS の setup.sh は VSCode を推奨するが、Raspberry Pi では不要
   - Actively remove non-essential features to save resources / リソースを節約するため、必須でない機能は積極的に削除

4. **Webpack production mode optimization / Webpack の本番モード最適化**:
   - Default `npm run dev` is development hot reload server, constantly consuming 180% CPU, 1GB memory / デフォルトの `npm run dev` は開発用ホットリロードサーバーで、常時 CPU 180%、メモリ 1GB を消費
   - Change to `npm run build` in `docker-compose.override.production.yml`, build once and finish / `docker-compose.override.production.yml` で `npm run build` に変更し、一度だけビルドして終了
   - After build, wait with `tail -f /dev/null`, satisfying healthcheck dependencies while consuming almost no CPU / ビルド後は `tail -f /dev/null` で待機し、healthcheck の依存関係を満たしつつ CPU をほぼ消費しない
   - Set `mem_limit: 1536m` memory limit to prevent OOM on Raspberry Pi 4B (4GB) / `mem_limit: 1536m` でメモリ制限を設定し、Raspberry Pi 4B (4GB) で OOM を防止
   - Persist `npm_cache` and `node_modules` volumes to avoid package reinstallation on restart / `npm_cache` と `node_modules` を volume で永続化し、再起動時のパッケージ再インストールを回避
   - Change healthcheck from dev server listen check to build artifact existence check / Healthcheck を dev server の待ち受けチェックからビルド成果物の存在確認に変更
   - Set `start_period: 300s` as first build takes 5-10 minutes / 初回ビルドに 5-10 分かかるため、`start_period: 300s` を設定

### Security and Best Practices / セキュリティとベストプラクティス

1. **Auto-generated secrets / 自動生成されたシークレット**:
   - Generate SECRET_KEY, DATABASE_PASSWORD, REDIS_PASSWORD with OpenSSL / SECRET_KEY, DATABASE_PASSWORD, REDIS_PASSWORD を OpenSSL で生成
   - Ensure sufficient entropy (50 characters, 16 characters) / 十分なエントロピーを確保（50 文字、16 文字）
   - Strongly encourage changing default password (admin/admin) / デフォルトパスワード（admin/admin）の変更を強く促す

2. **Importance of documentation / ドキュメントの重要性**:
   - Clearly document platform-specific issues (ARM64) / プラットフォーム固有の問題（ARM64）を明確に文書化
   - Include specific solutions in troubleshooting section / トラブルシューティングセクションに具体的な解決策を記載
   - Specify expectations for first run (time, resources) / 初回実行時の期待値（時間、リソース）を明示

## References / 出典・参考資料

- **GeoSight-OS**: https://github.com/unicef-drp/GeoSight-OS
- **GeoSight Documentation**: https://unicef-drp.github.io/GeoSight-OS-Documentation/
- **GeoRepo-OS**: https://github.com/unicef-drp/GeoRepo-OS
- **UN Smart Maps Issue #821**: https://github.com/UNopenGIS/7/issues/821
- **just Command Runner**: https://github.com/casey/just
- **Cloudflare Tunnel**: https://developers.cloudflare.com/cloudflare-one/connections/connect-apps/

## Acknowledgments / 謝辞

- **UNICEF** - Development and release of GeoSight / GeoSight の開発と公開
- **Kartoza** - Technical development of GeoSight / GeoSight の技術的な開発
- **@yuiseki** - Discovery and sharing of GeoSight setup procedures in [UNopenGIS/7#821](https://github.com/UNopenGIS/7/issues/821) / [UNopenGIS/7#821](https://github.com/UNopenGIS/7/issues/821) での GeoSight セットアップ手順の発見と共有
- **UN Smart Maps Community** - Promoting open geospatial technology / オープンな地理空間技術の推進

## License / ライセンス

This project is released under CC0 1.0 Universal (Public Domain).

このプロジェクトは CC0 1.0 Universal (パブリックドメイン) の下で公開されています。

### Important Notes / 重要な注意事項

**Scope of this project / 本プロジェクトの範囲**:

This repository contains only automation scripts (Justfile) and documentation for running GeoSight-OS on Raspberry Pi. It does not include, modify, or redistribute GeoSight-OS itself.

このリポジトリは、GeoSight-OS を Raspberry Pi 上で起動するための自動化スクリプト（Justfile）とドキュメントのみを含みます。GeoSight-OS 本体のコードは含まれておらず、改変や再配布も行いません。

**GeoSight-OS License**:

GeoSight-OS itself is licensed under [GNU AGPL v3](https://github.com/unicef-drp/GeoSight-OS/blob/main/LICENSE).

GeoSight-OS 本体は [GNU AGPL v3](https://github.com/unicef-drp/GeoSight-OS/blob/main/LICENSE) の下でライセンスされています。

**AGPL Propagation**:

This project only provides configuration and setup for using GeoSight-OS and does not modify GeoSight-OS source code, so AGPL copyleft terms do not apply to this project.

本プロジェクトは GeoSight-OS を使用するための設定とセットアップを提供するだけであり、GeoSight-OS のソースコードを改変していないため、AGPL のコピーレフト条項は本プロジェクトには適用されません。

**UN Smart Maps Contributions**:

@hfu's contributions in UN Smart Maps group are typically provided under CC0.

UN Smart Maps グループでの @hfu の貢献は通常 CC0 として提供されます。

### What this means / 意味するところ

This project (the Justfile and documentation) is released into the public domain under CC0. You can use, modify, and distribute it freely without restrictions. However, GeoSight-OS itself remains under GNU AGPL v3, which applies if you modify or distribute GeoSight-OS.

本プロジェクト（Justfile とドキュメント）はCC0でパブリックドメインとして公開されています。制限なく自由に使用、改変、配布できます。ただし、GeoSight-OS 自体は GNU AGPL v3 のままであり、GeoSight-OS を改変または配布する場合にはそのライセンスが適用されます。

## Contributing / 貢献

Issues and Pull Requests are welcome.

Issues や Pull Requests を歓迎します。

For changelog, see [CHANGELOG.md](CHANGELOG.md).

変更履歴については [CHANGELOG.md](CHANGELOG.md) を参照してください。

---

Made with ❤️ by [hfu](https://github.com/hfu) and GitHub Copilot
