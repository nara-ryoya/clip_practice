# COMMAND

```
docker-compose up -d --build # ビルドして立ち上げ
docker-compose up -d # 立ち上げ
docker-compose exec clip bash # コンテナに入る
docker-compose exec clip python test.py # 実行
```

Dockerfileのgpgの公開鍵のところは適宜書き換える