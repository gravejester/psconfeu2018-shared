docker run --name iis -d -it -p 80:80 nanoserver/iis

# get IP address
docker inspect -f "{{ .NetworkSettings.Networks.nat.IPAddress }}" iis

# open iis default page in browser: http://<ip from above command>

# run custom linux management container
docker run -it --name mgmt custom/mgmt:1.0
# see that we can communicate with windows container.
# from bash:
curl -iI iis
# from pwsh
Invoke-WebRequest iis

# to enter the nano image:
docker exec -it iis cmd
# check connectivity
ping mgmt

# check platform
docker inspect iis --format '{{ .Platform}}'
docker inspect mgmt --format '{{ .Platform}}'