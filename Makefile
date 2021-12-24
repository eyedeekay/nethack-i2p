
index: server-index
	@echo "<!DOCTYPE html>" > index.html
	@echo "<html>" >> index.html
	@echo "<head>" >> index.html
	@echo "  <title>Nethack over I2P</title>" >> index.html
	@echo "  <link rel=\"stylesheet\" type=\"text/css\" href =\"home.css\" />" >> index.html
	@echo "</head>" >> index.html
	@echo "<body>" >> index.html
	pandoc README.md | tee -a index.html
	@echo "</body>" >> index.html
	@echo "</html>" >> index.html

auto:
	docker build -t nextcloud-i2p .
	docker rm -f nextcloud-i2p; true
	docker run -d --restart=always \
	    -p 127.0.0.1:8080:80 \
	    -v nextcloud:/var/www/html \
	    --env-file .env \
	    --name nextcloud-i2p nextcloud-i2p

install:
	./install.sh

uninstall:
	./uninstall.sh

server-index:
	@echo "<!DOCTYPE html>" > client.html
	@echo "<html>" >> client.html
	@echo "<head>" >> client.html
	@echo "  <title>Nethack Server over I2P</title>" >> client.html
	@echo "  <link rel=\"stylesheet\" type=\"text/css\" href =\"home.css\" />" >> client.html
	@echo "</head>" >> client.html
	@echo "<body>" >> client.html
	pandoc SERVER.md | tee -a client.html
	@echo "</body>" >> client.html
	@echo "</html>" >> client.html