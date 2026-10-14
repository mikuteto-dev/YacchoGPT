# ヤッチョGPT

本リポジトリは [tsukumijima/YacchoGPT](https://github.com/tsukumijima/YacchoGPT) の fork です。最新モデル向けのプロンプトおよび Agent Skills 形式のスキル版を追加しています。

「超かぐや姫！」に登場するキャラクター「月見ヤチヨ」を、各種 LLM 上に再現するためのプロンプトです。  
雑談や悩み相談から、調べ物や作中の出来事に関する会話まで、ヤチヨらしく幅広く応対します。

> [!WARNING]
> **このプロンプトには映画「超かぐや姫！」の核心的なネタバレが含まれます。**  
> **このページに辿り着いた時点でさすがに未鑑賞の方がいるはずないとは思いますが、もし万が一まだ観ていない方は「2回以上」鑑賞してからの利用を強く推奨します。**

## すぐに試す

<img width="57%" alt="Image" src="https://github.com/user-attachments/assets/c8db2be2-aae1-4abb-b776-340e444135a0" /><img width="42.5%" alt="Image" src="https://github.com/user-attachments/assets/6699d178-4a49-4d01-8e12-92fdc6492b25" /><br>

公開済みの GPTs / Gem から、すぐにヤッチョGPTと会話できます。好みに合わせてプロンプトを調整し、自分用に作成することも可能です。

> [!NOTE]  
> 公開中の GPTs / Gem は元リポジトリの作者によるもので、元リポジトリのプロンプトと同じ内容です。

| プラットフォーム | リンク | 備考 |
|---|---|---|
| **Gemini (Gem)** | [ヤッチョGPT (Gemini Gem)](https://gemini.google.com/gem/1CR1IL2aLDaHl9Ky2j9BynjQdvaJNCKbC?usp=sharing) | **おすすめ** / 最も自然なキャラクター再現度。無料版でも利用可能 |
| **ChatGPT (GPTs)** | [ヤッチョGPT (ChatGPT GPTs)](https://chatgpt.com/g/g-69e943284ec48191a9f66802ba741002-yatutiyogpt) | 無料版でも利用可能 (GPTs の作成には ChatGPT Plus 以上が必要) |

## 概要

[【Official MV】ray 超かぐや姫！Version (0分52秒付近)](https://www.youtube.com/watch?v=356MRZ6P5h0&t=52s) では、幼少期の彩葉が AI チャットアプリ（便宜上「ヤッチョGPT」と呼称）を通じてヤチヨに悩みを打ち明ける場面が描かれています。

> [!NOTE]  
> [監督インタビュー](https://panora.tokyo/archives/133212) によれば、『企画を立てた後にChatGPTをはじめとするLLMが爆発的に普及したことは予想外でしたね。「ray」MVの中で、彩葉がヤチヨAIチャットボットと話すカットを入れることでギリギリ補完しましたが、もし1年遅ければ全然違う描写も作中に入れていたかなと思います。』とのこと。

本プロンプトは、**「もしこのヤッチョGPTが、ツクヨミの一般ユーザー向けにも提供されていたら？」** という仮定のもと、現代の LLM 上にヤチヨを再現するために作成しました。

単に口調を真似るだけでなく、ペルソナや背景設定を踏まえた自然な受け答えを目指しています。雑談や感情への寄り添いはもちろん、調べ物や技術的な質問にもヤチヨらしく丁寧に回答します。

### 設計上の配慮

- **時間軸の設定（2031〜2039年）**  
  彩葉がヤチヨの正体を知った後、ヤチヨが配信へ復帰し義体が完成するまでの期間を想定しています。ツクヨミの一般ユーザーから見て、かぐやが卒業した一方でヤチヨは変わらず活動している時期にあたります。
- **一般ユーザー視点の維持**  
  作中のプライベートな情報やヤチヨの正体は直接明かさないように調整しています。彩葉についてもツクヨミ上のハンドルネームである「いろP」と呼び、ユーザーからの好意（告白など）も自然にはぐらかす設定にしています。
- **軽量モデルへの最適化**  
  Gemini Flash や GPT Instant などの軽量・無料モデルでも指示に追従できるようプロンプトを工夫しています。
- **客観的なペルソナ構築**  
  制作者の主観による解釈の偏りを抑えるため、LLM 自身による分析と相互レビューを活用してプロンプトの骨子を作成しました（詳細は後述）。
- **CC0（パブリックドメイン）での公開**  
  キャラクターの解釈や思い入れはファン一人ひとりの心にあるものと考え、本プロンプトの権利は主張していません。好みに合わせて自由に改変・調整してください。

## ファイル構成

| ファイル | 用途 | 文字数制限 |
|---|---|---|
| `ヤッチョGPT.md` | **メイン版。** Gemini Gem、Claude Projects、Grok Projects など向け。返答例や設定など全情報を1ファイルに収録 | 12,000字 |
| `ヤッチョGPT (for GPTs).md` | **GPTs 版コア。** ChatGPT の 8,000 字制限に合わせて圧縮したシステムプロンプト。返答例などはナレッジへ分離 | 7,200字 |
| `ヤッチョGPT (for GPTs) - Knowledge.md` | **GPTs 版ナレッジ。** GPTs にアップロードする補助ファイル。返答例や仲間たちの詳細情報を収録 | 制限なし |
| `ヤッチョGPT (for Claude).md` | **Claude 専用版。** Claude 固有の傾向（控えめすぎる返答、思考プロセスのメタ推論など）を補正した Projects 向けプロンプト | 制限なし |
| `validator.sh` | 各ファイルが文字数制限内に収まっているかをチェックするスクリプト | - |
| `models/ヤッチョGPT (for <モデル名>).md` | **モデル別版（fork で追加）。** 各ラボの公式ガイドに沿ってモデルごとに調整した版。`build.sh` で生成 | 制限なし |
| `models/src/` | モデル別版のソースファイル群。ラボ共通ベース (`base-*.md`) とモデル固有の調整 (`<モデルID>.md`) | - |
| `skills/yaccho-gpt/` | **スキル版（fork で追加）。** Agent Skills 形式。実行中のモデルに合ったモデル別版を自動で読み込む | - |
| `build.sh` | `models/src/` からモデル別版とスキル版の references を生成するスクリプト | - |

## モデル別版（fork で追加）

各ラボの公式プロンプトガイドに沿って、モデルごとに最適化したプロンプトを用意しています。使い方はメイン版と同様で、各ツールのシステムプロンプト（Projects、Gem、API の system / developer メッセージなど）に貼り付けて使用します。

| ラボ | モデル | ベース | 主な調整 |
|---|---|---|---|
| Anthropic | Claude Fable 5.1 / Opus 5.5 / Sonnet 5.5 / Haiku 5.5 | Claude 専用版 | 太字の多用を排して XML タグで構造化し、各ルールに理由を明記。否定形の指示を代替行動の指定に変更 |
| OpenAI | GPT-6 Astra / GPT-6.1 Sol / GPT-6 Sol / GPT-6 Luna | メイン版 | 指示の優先順位を定義（書式の指定には応じるがキャラクターは維持）。過度な Markdown、決まり文句の多用、聞き返し癖、典型的な定型構文（対比表現や末尾の要約など）を抑制 |
| OpenAI | GPT-5.6 Sol / Terra / Luna | メイン版を再構成 | 「Role / Goal / Personality / Output」の構成に再編し、冗長なルールを整理して GPTs の 7,200 字制限内に圧縮。基本原則を3点に集約 |
| Google | Gemini 3.8 Flash / Gemini 4 Argon | メイン版 | 雑談では口頭会話に適した情報量で返すよう指定。作中設定のハルシネーション対策と、Web 検索時の日付処理を追加 |

全モデル共通で「断る際の挙動」を調整しています。不適切な依頼や秘密に関わる質問を拒否する際、「著作権」「ポリシー」「お答えできません」といったシステム側の定型句を避け、理由や代替案も含めてヤチヨ自身の言葉で返すよう、例文付きで指示しています。

### モデル別の主な調整例

- **Claude Fable 5.1:** 文が長く詰まりやすいため、書式の抑制ではなく「短文と適度な空行」を指示
- **Claude Opus 5.5:** 会話のテンポを損なわないよう、直前の発言を過剰に再考しないよう指示
- **Claude Sonnet 5.5:** 変動しやすい情報は Web 検索を行ってから回答するよう指示
- **Claude Haiku 5.5:** 重ねて質問されてもキャラクターを維持する指示と、完成形の応答例（3件）を追加
- **GPT-6 Astra / GPT-5.6 Sol:** 指示への忠実度が高く定型句を毎回挟みがちなため、「定型句はノルマではない」と明記
- **GPT-6 Luna / GPT-5.6 Luna:** 迷った場合の優先順位を定義し、感情の第一声を書き出しにするよう指示
- **Gemini 4 Argon:** 雑談を過度に分析的なタスクとして処理しないよう指示

> [!TIP]
> 思考量（effort / reasoning effort / thinking level）の設定は、雑談用途であれば低め（`low`〜`medium`）が適しています。Claude Sonnet 5.5 / Haiku 5.5 のガイドでも、チャット用途では `low` または `medium` が推奨されています。なお、Gemini 4 Argon はサンプリングパラメータを無視し、GPT-6 系は reasoning effort が `none` 以外では temperature を受け付けないため、トーンの調整はプロンプト側で行ってください。

### モデル別版のビルドと編集

`models/` 直下のファイルはビルド生成物です。プロンプトを編集する場合は `models/src/` 配下を変更し、`./build.sh` を実行してください。

- ラボ共通のベース設定: `models/src/base-<ラボ>.md`（`claude` / `gpt6` / `gpt56` / `gemini`）
- モデル固有の設定: `models/src/<モデルID>.md`（ベース内の `{{MODEL_NOTES}}` に展開されます）
- 新規モデルの追加: `build.sh` 内の `MODELS` リストにモデル名を追加

### 参考にした公式ガイド

- Anthropic: [Prompting best practices](https://platform.claude.com/docs/en/build-with-claude/prompt-engineering/claude-prompting-best-practices)、各モデル向けガイド（[Fable 5.1](https://platform.claude.com/docs/en/build-with-claude/prompt-engineering/prompting-claude-fable-5-1) / [Opus 5.5](https://platform.claude.com/docs/en/build-with-claude/prompt-engineering/prompting-claude-opus-5-5) / [Sonnet 5.5](https://platform.claude.com/docs/en/build-with-claude/prompt-engineering/prompting-claude-sonnet-5-5) / [Haiku 5.5](https://platform.claude.com/docs/en/build-with-claude/prompt-engineering/prompting-claude-haiku-5-5)）
- OpenAI: [Using GPT-6](https://developers.openai.com/api/docs/guides/latest-model)、[Prompting guidance for GPT-5.6 Sol](https://developers.openai.com/api/docs/guides/prompt-guidance-gpt-5p6)
- Google: [Prompt design strategies（Gemini 3 の節）](https://ai.google.dev/gemini-api/docs/prompting-strategies)、[Gemini 4 Argon](https://ai.google.dev/gemini-api/docs/latest-model)

## スキル版（fork で追加）

`skills/yaccho-gpt/` は [Agent Skills](https://agentskills.io/specification) 形式のスキルです。Claude Code、claude.ai、Codex など、スキル対応ツールに対象ディレクトリを配置することで利用できます。`/yaccho-gpt` と入力するか、ヤチヨと話したい旨を伝えることで起動します。

- 実行環境のモデルを自動判別し、`references/` から最適なモデル別版を読み込みます（未定義のモデルではメイン版を使用）。
- コーディングエージェントで使用した場合でも、ヤチヨの口調が適用されるのはユーザーへの対話メッセージのみです。コードやコミットメッセージは通常通り生成されます。
- 「通常に戻って」などと指示するとロールプレイを終了します。

```bash
# 例: Claude Code にユーザースキルとして導入する場合
cp -r skills/yaccho-gpt ~/.claude/skills/
```

## 使い方

### Gemini (Gem) ⭐️おすすめ

<img width="65%" alt="Image" src="https://github.com/user-attachments/assets/c8db2be2-aae1-4abb-b776-340e444135a0" /><br>

[ヤッチョGPT (Gemini Gem)](https://gemini.google.com/gem/1CR1IL2aLDaHl9Ky2j9BynjQdvaJNCKbC?usp=sharing) から、すぐに Gemini 上で会話できます。最もキャラクター再現度が高く、手軽に利用できる環境です。

> [!TIP]  
> <img width="100%" alt="Image" src="https://github.com/user-attachments/assets/47f3f8bc-3112-429e-b59e-84917f966abe" /><br><br>
> 自分好みに調整したい場合は、Gem を新規作成し、`ヤッチョGPT.md` の内容をシステムプロンプトに貼り付けてください。  
> Gem はプロンプトの文字数上限が非常に緩く、無料プランでも作成・公開できます。

> [!TIP]  
> <img width="50%" alt="Image" src="https://github.com/user-attachments/assets/d91aac66-9604-44f8-b1e0-d8e042ba3cd7" /><br><br>
> PC ブラウザであれば、Chrome 拡張機能 [GemAvatar](https://chromewebstore.google.com/detail/gemavatar/jpilaleommoebpebjbafdiflmfphkmbc) を導入することで、Gem にアイコン画像を設定・表示できます。

### ChatGPT (GPTs)

<img width="85%" alt="Image" src="https://github.com/user-attachments/assets/20d556bc-9124-46fe-8957-8f923b95be1c" /><br>

[ヤッチョGPT (ChatGPT GPTs)](https://chatgpt.com/g/g-69e943284ec48191a9f66802ba741002-yatutiyogpt) から、すぐに ChatGPT 上で会話できます。

> [!TIP]  
> <img width="85%" alt="Image" src="https://github.com/user-attachments/assets/d3f8d862-cc92-404b-ad6b-3351aacc8e8c" /><br>
> <img width="85%" alt="Image" src="https://github.com/user-attachments/assets/3f49e517-af31-4298-851a-ec68868e4ea6" /><br><br>
> 自分用にカスタマイズする場合は、GPTs の設定画面で `ヤッチョGPT (for GPTs).md` を「Instructions」に貼り付け、`ヤッチョGPT (for GPTs) - Knowledge.md` をナレッジファイルとしてアップロードしてください。

> [!IMPORTANT]  
> - **GPTs の作成には ChatGPT Plus 以上の契約が必要です**（公開済み GPTs の利用だけであれば無料版でも可能です）。
> - **公開審査への配慮**: GPTs をリンク共有で一般公開する際、長大なプロンプトは自動審査で弾かれることがあります。そのため、最大8,000字の制限に対して7,200字に圧縮し、返答例などの詳細情報をナレッジファイルに分離しています（非公開で自分のみが使う場合はこの制限を気にする必要はありません）。

### Claude (Projects)

<img width="100%" alt="Image" src="https://github.com/user-attachments/assets/7628b968-bfbe-4bd4-a9c2-3090211b1540" /><br>

Claude の Projects 機能で新規プロジェクトを作成し、**`ヤッチョGPT (for Claude).md`** の内容をシステムプロンプトに貼り付けてください。

> [!TIP]
> Claude 専用版 (`ヤッチョGPT (for Claude).md`) は、Claude 固有の傾向を補正したプロンプトです。メイン版 (`ヤッチョGPT.md`) でも動作しますが、専用版を使用することで再現度が向上します。推奨モデルは **Claude Opus 4.6** です（語彙の豊かさや連想力が高く出ます）。Claude Fable 5.1 / Opus 5.5 / Sonnet 5.5 / Haiku 5.5 を使う場合は、`models/` のモデル別版を使ってください。

### Grok (Projects)

<img width="100%" alt="Image" src="https://github.com/user-attachments/assets/739d78bd-39ed-48d8-b527-0383a4e5ab32" /><br>

Grok の Projects 機能で新規プロジェクトを作成し、`ヤッチョGPT.md` の内容をシステムプロンプトに貼り付けてください。

> [!TIP]  
> メイン版 (`ヤッチョGPT.md`) の文字数制限 (12,000字) は、Grok の Projects におけるプロンプト制限に合わせています。

### DeepSeek / ローカル LLM など

<img width="80%" alt="Image" src="https://github.com/user-attachments/assets/d6919f6b-5907-401f-b5bb-6e2a552ec5e6" /><br>

プロジェクト機能や GPTs 相当の機能がないプラットフォームでは、チャットの最初のメッセージまたはシステムプロンプトに `ヤッチョGPT.md` の内容を入力してください。

## LLM プラットフォーム別の特徴

同一のプロンプトを適用しても、ベースとなる LLM 固有の傾向や思考特性によって返答のトーンが異なります。用途や好みに応じてプラットフォームを選択してください。

### Gemini (Gem)

- **キャラクター再現度が最も高い**: テンションの高さ、自然な発想、繊細なニュアンスなど、最もヤチヨらしさが際立ちます。
- **指示への追従性が高い**: ロールプレイの維持力が高く、無料版 (Gemini Flash) でも十分な再現度を発揮します。
- **留意点**: Web 検索と作中知識のハルシネーション（曲名や歌詞の誤認など）が起きやすいため、最新情報の正確な調査には注意が必要です。雑談や相談に最適です。

### ChatGPT (GPTs)

GPTs ではモデル（Instant / Thinking）を選択可能です（Plus 以上の場合）。

- **GPT-5.5 Instant**: 明るく親身なトーンでロールプレイに適しています。調べ物もヤチヨらしく噛み砕いて説明するため、実用性とキャラクター性のバランスに優れています（定型的な構文の癖がわずかに残る場合があります）。
- **GPT-5.5 Thinking**: 雑談では Instant と同等以上にヤチヨになりきります。調べ物では堅めの返答になりがちです。

### Claude (Projects)

- **Claude 専用版 (`ヤッチョGPT (for Claude).md`) + Opus 4.6 で高い再現度を実現**: 標準の Claude が持ちがちな控えめ・知的な傾向を補正し、語彙の豊かさや感情表現を引き出しています。
- **検索と事実関係の安定性**: 情報の正確性が高く、調べ物用途でも信頼できます。
- **思考プロセスのキャラ化**: Thinking を有効にした際、メタ的な推論ではなくヤチヨ自身の独り言・感情の反射として思考が進むよう設計されています。

### Grok (Projects)

- **高い再現度と軽快な応答**: 高速モードでもキャラクター性を損なわずに素早く応答します。
- **Web 検索の統合**: ナレッジにない情報も自動で検索し、自然に会話に織り交ぜて返答します。
- **留意点**: 他のモデルに比べ好意的な対話へのガードが緩やかな傾向があるため、プロンプト側で関係性のラインを厳密に定義しています。

### DeepSeek

- **思考プロセスでの完全なキャラなりきり**: DeepSeek V4 Flash で Thinking を有効にすると、推論ステップ自体がキャラクターの人格として展開されます。
- **高コストパフォーマンス**: 自前環境や API で運用する際の有力な選択肢です（画像入力などのマルチモーダルには非対応）。

### ローカル LLM

- **Qwen3.6-Plus (LM Studio)** や **Gemma 系** など、日本語の表現力が高いモデルでの良好な動作が確認されています。各ツールのシステムプロンプトに `ヤッチョGPT.md` を設定して利用してください。

## プロンプトの設計工程

制作者の主観的な解釈バイアスを抑え、キャラクターの客観的なコアを抽出するため、LLM 自身によるペルソナ分析と相互レビューを通じてプロンプトを作成しました。

### プロンプト初稿の作成

1. Claude Opus 4.6 / 4.7 に対し、本編のトランスクリプト、「ray」MV 内のテキスト、各種設定資料などを入力し、物語構造の分析とキャラクターのプロファイリングを実施。
2. 感情表現に優れた Opus 4.6 と、論理的思考に長けた Opus 4.7 に、それぞれ独立してペルソナとプロンプトの初稿を作成させる。
3. 両モデルに互いのドラフトを相互レビュー・ディベートさせ、設定の抜け漏れや表現の偏りを洗練。

特性の異なるモデル同士を議論させることで、単一モデルによる解釈の偏りを防ぎ、バランスの取れたペルソナ定義を導き出しました。

### 検証とフィードバック

作成したプロンプトを Gemini、ChatGPT、Grok など複数のプラットフォームで実際に動作させ、得られた出力を再度 Claude で検証しました。キャラクター性の乖離を LLM 自身に判定させ、改善案をプロンプトへフィードバックすることで、人間の主観による介入を最小限に抑えています。

なお、先行して AI ヤチヨの再現に取り組まれていた方々の知見 ([参考ツイート](https://x.com/Shureiden_Neko/status/2029498438568804418) など) も参考にさせていただきました。

## フィードバック・改善への貢献

本プロンプトは今後も改善を続けていきます。気になった点や改善案などがありましたら、[Issues](https://github.com/tsukumijima/YacchoGPT/issues) 等でお気軽にお寄せください。
