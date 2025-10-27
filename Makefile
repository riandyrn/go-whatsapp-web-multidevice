.PHONY: *

run-gowa:
	-make stop-gowa
	docker compose -f docker-compose.speaksparkbot.yml -p speakspark-bot-gowa up -d --build

stop-gowa:
	docker compose -f docker-compose.speaksparkbot.yml -p speakspark-bot-gowa down --remove-orphans

build-push-image:
	docker buildx create --use
	docker buildx build \
		--platform linux/amd64,linux/arm64 \
		-f ./docker/golang.Dockerfile \
		-t riandyrn/gowa:latest \
		-t riandyrn/gowa:7.8.1 \
		--push .