# life_platter
日々の生活を支えるアプリ。  

## 命名の由来
Platter = 大皿、盛り合わせプレート  
 → 料理や食事のイメージに直結します  
Life = 生活、人生   
  → アプリが料理だけでなく日々の生活を支えることを表現

つまり 「日々の生活に色々なサポートや情報を盛り合わせて提供する」 というコンセプトで提案しました。  
特に「料理の自炊サポート」を中心に、生活全般にも役立つというニュアンスを込めています。   
ちょっとした言葉遊びですが、料理の「盛り合わせ」＝「機能の盛り合わせ」にもかけています。

## ゆくゆくは追加したい機能
以下はともに、無料枠で使用できる

### 機能比較
### Google Cloud Vision API
* 画像ラベル検出（Label Detection）：物体やシーンを識別し、複数のタグを返す
* 物体検出（Object Detection）：複数の物体をボックス付きで検出
* OCR／テキスト検出、顔認識、ロゴ認識など多機能
* 多言語対応、画像サイズは最大20 MB

### Clarifai
* 汎用モデル（General）：11,000以上のタグを認識可能
* フード特化モデル（Food Recognition）：500以上の食材や料理を識別 
* カスタムモデル構築：自社用途に合わせた学習が可能 
* NSFW検出、ビデオ対応など豊富なAPI機能あり

### 精度比較
### Google Cloud Vision API
* 物体検出での精度が高く、リアルタイムアプリ向き 
* OCRやシーン分類にも優れる
* ノイズに弱いという指摘もあり 

### Clarifai
* 汎用タグ精度は高評価（スコア9.0／10） 
* 食材特化モデルは材料への対応が強み 
* カスタム学習で精度向上が可能

→ 食材リスト生成なら、Clarifai Food Recognitionモデル（材料特化）がおすすめ。

### 料金比較
| サービス          | 無料枠                                                                      | 有料単価                                                                                     | 備考                                         |
| ----------------- | --------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------- | -------------------------------------------- |
| **Google Vision** | 月1,000枚無料                                                               | ラベル \$1.50／1,000枚<br>物体検出 \$2.25／1,000枚                                           | 大量利用に向く([G2][1], [Filestack Blog][2]) |
| **Clarifai**      | 月1,000～5,000リクエスト無料（Foodモデル含む）([Reddit][3], [AltexSoft][4]) | 汎用モデル \$0.0012／件<br>検出モデル \$0.002／件<br>Foodモデルも同等価格([clarifai.com][5]) | カスタムも \$0.0032／件                      |

[1]: https://www.g2.com/compare/clarifai-vs-google-cloud-vision-api?utm_source=chatgpt.com "Compare Clarifai vs. Cloud Vision API - G2"
[2]: https://blog.filestack.com/comparing-google-vision-microsoft-cognitive-amazon-rekognition-clarifai/?utm_source=chatgpt.com "Comparing 4 Most Popular Image Tagging Services"
[3]: https://www.reddit.com/r/learnjavascript/comments/8w93yz/lets_create_a_food_recognition_ai_app_with/?utm_source=chatgpt.com "Let's Create A Food Recognition AI App with Clarifai API: Part 1"
[4]: https://www.altexsoft.com/blog/image-recognition-apis/?utm_source=chatgpt.com "Image Recognition APIs - AltexSoft"
[5]: https://www.clarifai.com/pricing?utm_source=chatgpt.com "Clarifai Pricing | Production-ready AI API for Developers and ..."

### 結論
| 利点             | Clarifai Foodモデル                  | Google Vision                                  |
| ---------------- | ------------------------------------ | ---------------------------------------------- |
| **素材特化精度** | ◎ 専用モデルで500種類以上対応        | △ 汎用モデルなので精度劣る可能性あり           |
| **料金**         | 低コスト<br>月1000リクエストまで無料 | 月1000件無料、1,000～5,000,000件目までは同価格 |
| **カスタム対応** | ○ カスタム学習可能                   | △ カスタムはAutoML Vision等追加学習が必要      |
| **多機能性**     | ○ 豊富なモデルとNSFW対応あり         | ○ OCRや翻訳など広範囲対応                      |
