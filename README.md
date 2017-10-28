# PROD:

## adres:
http://hackyeahppp.herokuapp.com/

## consola:
heroku ps:exec

## deploy:
git push heroku master

## weryfikacja API:
curl -H "X-Hack-Yeah-Api-Key: 68e6a2b8272486f29be03c7d20bf8b06" http://hackyeahppp.herokuapp.com//api/v1/verify


# DEV Tips:

# weryfikacja API:
curl -H "X-Hack-Yeah-Api-Key: 68e6a2b8272486f29be03c7d20bf8b06" http://127.0.0.1:3000/api/v1/verify

# tworzenie aukcji:

curl -H "X-Hack-Yeah-Api-Key: 68e6a2b8272486f29be03c7d20bf8b06"  -H "Content-Type: application/json" -X POST -d '{"auctioneer_id":"13214","auction_uuid":"idaukcji","auction_provider":"allegro","auctioneer_data":{"nip":"111111111"},"auction_data":{"title":"iphone"}}' http://127.0.0.1:3000/api/v1/auctions

