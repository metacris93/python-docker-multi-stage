# Build the image
docker build -t python-app-multi-stage .

# Run the container
docker run -p 5000:5000 python-app-multi-stage