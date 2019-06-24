mkdir -p deathmatch modules

docker build --tag mtasa:latest \
             --build-arg GROUP_ID=$(id -g) \
             --build-arg USER_ID=$(id -u) \
             .
docker run --rm -itd \
           -v "$(pwd)/deathmatch:/home/mtasa/mods/deathmatch" \
           -v "$(pwd)/modules:/home/mtasa/x64/modules" \
           -p 22003:22003/udp \
           -p 22005:22005 \
           -p 22126:22126/udp \
           mtasa