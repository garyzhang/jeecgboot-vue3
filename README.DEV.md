# install npm
curl -fsSL https://deb.nodesource.com/setup_20.x | bash - &&apt-get install -y nodejs

# install pnpm
wget -qO- https://get.pnpm.io/install.sh | ENV="$HOME/.shrc" SHELL="$(which sh)" sh -
source /root/.shrc

# install 3pp
pnpm i

# build project
npm run build

# change Dockerfile for Debian
proxy_pass              http://host.docker.internal:8083/jeecg-boot/; \
=>
proxy_pass              http://172.17.0.1:8083/jeecg-boot/; \

# build docker
docker build -t jeecgboot-vue3 .

# docker run
docker run --name jeecgboot-vue3-nginx -p 8084:80 -d jeecgboot-vue3