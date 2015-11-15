jma-eqxml2geojson
======

## このリポジトリについて
このリポジトリは9SQ氏の[jma-eqxml2geojson](https://github.com/9sq/jma-eqxml2geojson) を AWS Lambda とS3アップロードトリガーを使って実行できるように変更を加えたものです。
出力jsonの詳細等はFork元リポジトリのreadmeをご覧ください。

### ファイル

* index.py : プログラム(eqxml2geojson.py をLambda対応したもの)
* 13ed6ca9-efbb-37c5-b2cb-f2b3158f55d4.xml : サンプルXML電文  
(2015年5月30日 20:24分頃に小笠原諸島西方沖で発生した、最大震度5強の地震の時のXML電文)

## 実行方法
build.shを実行するとlambda.zipが作成されるので、AWSマネジメントコンソールやCLIなどを使ってアップロードしてください。
Lambdaの設定は以下の通りです。

| 項目 | 設定 |
|-----|------|
| Runtime | Python 2.7(固定) |
| Handler | index.lambda_handler |
| Role | (S3にアクセスできるIAMロールを作成してください) |
| Event Source | s3: ObjectCreated |

また、テストをスムーズに行うためにS3にYOUR_S3_BUCKETを作成し、直下に 13ed6ca9-efbb-37c5-b2cb-f2b3158f55d4.xml を配置することをお勧めします。直下に置きたくない場合は下のjsonで指定するときに"(ディレクトリ名)/13ed6ca9-efbb-37c5-b2cb-f2b3158f55d4.xml"とすると良いです。

``` 
{
  "Records": [
    {
      "s3": {
        "bucket": {
          "name": "(YOUR_S3_BUCKET)"
        },
        "object": {
          "key": "13ed6ca9-efbb-37c5-b2cb-f2b3158f55d4.xml"
        }
      }
    }
  ]
}
```
