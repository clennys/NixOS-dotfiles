{
  virtualisation.oci-containers.backend = "podman";
  virtualisation.oci-containers.containers = {
    searxng = {
      # docker run --rm \                                                                                                                                               148 
      #           -d -p ${PORT}:8080 \
      #           -v "${PWD}/searxng:/etc/searxng" \
      #           -e "BASE_URL=http://localhost:$PORT/" \
      #           -e "INSTANCE_NAME=searxng" \
      #           docker.io/searxng/searxng
      image = "docker.io/searxng/searxng:latest";
      autoStart = true;
      ports = ["127.0.0.1:8080:8080"];
      # TODO: Improve volume mapping
      volumes = ["/home/dhuber/Projects/containers/searxng/searxng:/etc/searxng"];
      environment = {
        BASE_URL = "http://localhost:8080/";
        INSTANCE_NAME = "searxng";
      };
    };
  };
}
