# Docker Utilities

A collection of scripts for managing Docker containers and images.

## Cleanup Docker Script

### Usage

The cleanup script is designed to help you stop and remove Docker containers, and optionally remove associated images.

#### Prerequisites

- [Docker](https://docs.docker.com/get-docker/) installed

#### Running the Script

1. Make the script executable:

    ```bash
    chmod +x cleanup_docker.sh
    ```

2. Run the script:

    ```bash
    ./cleanup_docker.sh [<image_name> | --all] [--remove-images]
    ```

#### Parameters

- `<image_name>`: Specify the name or part of the name of the Docker image for which you want to remove containers.

- `--all`: Remove all containers, regardless of the image specified.

- `--remove-images`: Remove associated Docker images along with containers.

### Examples

- Remove containers for a specific image:

    ```bash
    ./cleanup_docker.sh <your_image_name>
    ```

- Remove all containers:

    ```bash
    ./cleanup_docker.sh --all
    ```

- Remove all containers and their images:

    ```bash
    ./cleanup_docker.sh --all --remove-images
    ```

## Contributing

If you have suggestions, improvements, or additional utilities related to Docker, feel free to contribute! Please open an issue to discuss changes or submit a pull request.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

