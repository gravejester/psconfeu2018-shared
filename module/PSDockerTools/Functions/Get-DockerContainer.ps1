Function Get-DockerContainer {

    docker ps --format '{{json .}}' | ConvertFrom-Json

}