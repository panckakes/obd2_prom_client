# Use alpine python-slim runtime as a parent image
FROM resin/raspberrypi3-python:2.7-slim
# Enable OpenRC
ENV INITSYSTEM on

COPY . /app

#install requirements
RUN pip install --requirement /app/requirements.txt

# make port 8000 available outside the container
EXPOSE     8000

# start the prom.py server (prometheus client)
CMD ["python", "/dev/prom/src/prom.py"]
