Manage restaurants via API call (Ruby on Rails) : https://api-test-website.herokuapp.com/

# Documentation technique de la V1

Créez-vous un compte et sauvegardez l'adresse mail liée à votre compte, ainsi que votre clé d'authentification API.
Vous trouverez ci-dessous les lignes de commande permettant d'intéragir avec l'API de ce site.

Voir l'index de tous les restaurants :
`curl -s https://api-test-website.herokuapp.com/api/v1/restaurants | jq`

Voir la show du restaurant dont l'id = 1 :
`curl -s https://api-test-website.herokuapp.com/api/v1/restaurants/1 | jq`

Create d'un restaurant :
`curl -i -X POST \
-H 'Content-Type: application/json' \
-H 'X-User-Email: YOUR EMAIL' \
-H 'X-User-Token: YOUR AUTHENTICATION TOKEN' \
-d '{ "restaurant": { "name": "New name", "address": "New address", "description": "New description", "food_type": "New food_type" } }' \
https://api-test-website.herokuapp.com/api/v1/restaurants`

Update du restaurant que vous avez créé et dont l'id = 1 :
`curl -i -X PATCH \
-H 'Content-Type: application/json' \
-H 'X-User-Email: YOUR EMAIL' \
-H 'X-User-Token: YOUR AUTHENTICATION TOKEN' \
-d '{ "restaurant": { "name": "New name", "address": "New address", "description": "New description", "food_type": "New food_type" } }' \
https://api-test-website.herokuapp.com/api/v1/restaurants/1`

Destroy du restaurant que vous avez créé et dont l'id = 1 :
`curl -i -X DELETE \
-H 'X-User-Email: YOUR EMAIL' \
-H 'X-User-Token: YOUR AUTHENTICATION TOKEN' \
https://api-test-website.herokuapp.com/api/v1/restaurants/1`
