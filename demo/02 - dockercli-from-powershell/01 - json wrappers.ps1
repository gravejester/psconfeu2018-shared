docker run hello-world

docker ps --all

docker ps --all --format '{{json .}}' | ConvertFrom-Json

docker ps --all --format '{{json .}}' | ConvertFrom-Json | Get-Member

docker images

docker images --format '{{json .}}' | ConvertFrom-Json

Get-Content .\module\PSDockerTools\Functions\Get-DockerContainer.ps1
Get-Content .\module\PSDockerTools\Functions\Get-DockerImage.ps1
Get-Content .\module\PSDockerTools\Functions\Get-DockerObject.ps1

Import-Module .\module\PSDockerTools
Get-Command -Module PSDockerTools

Get-DockerContainer
Get-DockerImage

$Container = Get-DockerContainer | Select-Object -First 1
Get-DockerObject -ObjectID $Container.ID

# Hey! Let`s  not reinvent the wheel... Are there any existing Docker modules?
Find-Module -Name *Docker*

# Microsoft`s official PackageManagement provider for installing Docker Enterprise Edition on Windows Server
Install-Module DockerMsftProvider -Force
Find-Package -ProviderName DockerMsftProvider

Find-Module -Name posh-docker
Install-Module -Name posh-docker
Import-Module -Name posh-docker

# docker -> Tab from console

# That`s nice, but wrappers for Docker CLI is what we was looking for - let`s try out a few

#region PSDockerHub

Find-Module -Name PSDockerHub
Install-Module -Name PSDockerHub
Get-Command -Module PSDockerHub

Find-DockerImage -SearchTerm powershell -MaxResults 5
Get-DockerImageDockerfile -Name microsoft/powershell
Get-DockerImageDetail -Name microsoft/powershell

#endregion

#region DockerPowershell

Find-Module -Name DockerPowershell
Install-Module -Name DockerPowershell
Get-Command -Module DockerPowershell

$ContainerId = Get-ContainerId | Select-Object -First 1
Get-ContainerIp -ContainerId $ContainerId

Get-Content function:Invoke-DockerCommand
Get-Content function:Invoke-DockerPs

Invoke-DockerPs -Arguments --all

#endregion

#region DockerHelpers

Find-Module -Name DockerHelpers
Install-Module -Name DockerHelpers
Get-Command -Module DockerHelpers

Get-DockerContainer -All
Get-Content function:Get-DockerContainer

Get-DockerContainer -All -Inspect

Get-DockerVolume

#endregion

#region Other useful Docker-related PowerShell modules

Install-Module -Name DockerDsc
Get-DscResource -Module DockerDsc

#endregion