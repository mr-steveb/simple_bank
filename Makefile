postgres:
	docker run --name postgres13 -e POSTGRES_USER=root -e POSTGRES_PASSWORD=awesome4000 -p 5432:5432 -d postgres:13-alpine

createdb:
	docker exec -it postgres13 createdb --username=root --owner=root simple_bank

dropdb:
	docker exec -it postgres13 dropdb simple_bank

migrateup:
	migrate -path db/migration -database "postgresql://root:awesome4000@localhost:5432/simple_bank?sslmode=disable" -verbose up

migratedown:
	migrate -path db/migration -database "postgresql://root:awesome4000@localhost:5432/simple_bank?sslmode=disable" -verbose down

.PHONY: postgres createdb dropdb migrateup migratedown