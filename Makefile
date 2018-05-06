check:
	docker ps

check-all:
	docker ps -a

create: check-all 
	docker run -d -p 9000:9000 --name portainer --restart always -v /var/run/docker.sock:/var/run/docker.sock -v /opt/portainer:/data portainer/portainer

start: check
	docker start portainer && docker ps

stop: check-all
	docker stop portainer && docker ps -a
