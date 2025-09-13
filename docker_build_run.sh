# build
docker build -f Dockerfile.offline -t satark-offline:latest .

# run (simple)
docker run -it --rm -p 5000:5000 \
  -e AUTH_MODE=token \
  -v $PWD/volumes/uploads:/data/uploads \
  -v $PWD/volumes/decrypted:/data/decrypted \
  -v $PWD/volumes/reports:/data/reports \
  -v $PWD/volumes/vulnerability_db:/data/vulnerability_db \
  satark-offline:latest

# or compose
docker compose up --build
