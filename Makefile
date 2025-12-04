.PHONY: *

run-gowa:
	-make stop-gowa
	docker compose -f docker-compose.speaksparkbot.yml -p speakspark-bot-gowa up -d --build

stop-gowa:
	docker compose -f docker-compose.speaksparkbot.yml -p speakspark-bot-gowa down --remove-orphans

build-image:
	docker buildx create --use
	docker buildx build \
		-f ./docker/golang.Dockerfile \
		--platform linux/amd64,linux/arm64 \
		-t riandyrn/gowa:latest \
		-t riandyrn/gowa:v7.10.1 \
		--push .