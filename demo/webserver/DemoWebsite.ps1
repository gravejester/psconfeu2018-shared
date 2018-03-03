break #Safety net. This script is supposed to be run line by line interactively, not all at once.

cd ~\Git\psconfeu2018-shared\docker

# Note: Remember to switch to Windows Containers before building the docker file (Linux is the default after installing Docker for Windows)
docker build WindowsServerCoreDemoWebsite -t psconfeu:demowebsite --no-cache
docker build NanoDemoWebsite -t psconfeu:nanodemowebsite --no-cache

# 1 Windows Server Core
$ContainerID = docker run -d --rm psconfeu:demowebsite

# 2 Nano Server 1709
$ContainerID = docker run -d --rm psconfeu:nanodemowebsite

docker ps

# Retrieve the container`s IP address
$ContainerIP = docker inspect -f "{{ .NetworkSettings.Networks.nat.IPAddress }}" $ContainerID

# Launch the website running in the container from a web browser to verify it`s running
Start-Process -FilePath iexplore.exe -ArgumentList http://$ContainerIP
Start-Process -FilePath chrome.exe -ArgumentList http://$ContainerIP

docker stop $ContainerID