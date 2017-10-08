# obd2_prom_client

To run from docker cloud  
docker run -d panckakes/prom-client:latest  

To run this container in background  
docker run -d prom-client  

To run this container at startup  
sudo docker run -d --name prom-client --restart always prom-client  
