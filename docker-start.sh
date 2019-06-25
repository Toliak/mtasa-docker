mkdir -p deathmatch modules

docker run --rm -it \
           -u $(id -u):$(id -g) \
           -v "$(pwd)/deathmatch:/home/mtasa/mods/deathmatch" \
           -v "$(pwd)/modules:/home/mtasa/x64/modules" \
           -p 22003:22003/udp \
           -p 22005:22005 \
           -p 22126:22126/udp \
           toliak/mtasa