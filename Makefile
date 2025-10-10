.PHONY: *

run-gowa:
	-make stop-gowa
	docker compose -f docker-compose.speaksparkbot.yml -p speakspark-bot-gowa up -d --build

stop-gowa:
	docker compose -f docker-compose.speaksparkbot.yml -p speakspark-bot-gowa down --remove-orphans