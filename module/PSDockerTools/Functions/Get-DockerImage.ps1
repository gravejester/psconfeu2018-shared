Function Get-DockerImage {

    docker image ls --format '{{json .}}' | ConvertFrom-Json

}