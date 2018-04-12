#region Images with PowerShell available

# PowerShell 5.1 is available in the Windows Server Core base OS image for Windows containers
docker pull microsoft/windowsservercore
docker pull microsoft/windowsservercore:1709

# And all images bulding on the base image, such as Internet Information Services (IIS)
docker pull microsoft/iis

# PowerShell Core is available in the official releases from https://github.com/PowerShell/PowerShell/releases
docker pull microsoft/powershell
docker pull microsoft/powershell:nanoserver
docker pull microsoft/powershell:6.0.2-nanoserver-1709
docker pull microsoft/powershell:centos7 --platform=linux #--platform=linux is an experimental feature per April 2018

#endregion

#region Interactive use

# Interactive sessions can be invoked by using -it
Start-Process -FilePath powershell -ArgumentList "/c docker run -it microsoft/powershell:6.0.2-nanoserver-1709 pwsh"
Start-Process -FilePath powershell -ArgumentList "/c docker run --platform=linux -it  microsoft/powershell:centos7  pwsh"
$ContainerID = docker ps -q

# attach attaches to an existing process - can be compared to connecting to the console of a virtual machine
docker attach $ContainerID

# exec starts a new process in the specified container
docker exec -ti $ContainerID pwsh

# Let`s  start a different container as a daemon
$ContainerID = docker run -d --rm microsoft/iis

# The same examples can be re-used against a non-interactive container
docker attach $ContainerID
docker exec -ti $ContainerID powershell