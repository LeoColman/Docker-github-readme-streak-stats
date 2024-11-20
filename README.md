# Docker GitHub Readme Streak Stats

A Docker container for the GitHub Readme Streak Stats project - Display your total GitHub contributions, current streak, and longest streak on your GitHub profile README.

[![License](https://img.shields.io/github/license/DenverCoder1/github-readme-streak-stats?style=flat-square)](LICENSE) ![Docker](https://img.shields.io/badge/docker-%230db7ed.svg?style=flat-square&logo=docker&logoColor=white) ![Alpine Linux](https://img.shields.io/badge/Alpine_Linux-%230D597F.svg?style=flat-square&logo=alpine-linux&logoColor=white) ![PHP](https://img.shields.io/badge/PHP-8.2-%23777BB4.svg?style=flat-square&logo=php&logoColor=white)

## Introduction

This is a Docker container implementation of [DenverCoder1&#39;s GitHub Readme Streak Stats](https://github.com/DenverCoder1/github-readme-streak-stats) project. It allows you to self-host the streak stats generator service using Docker, making it easy to deploy and maintain.

## Demo

<p align="center">
  <video src=".github/demo.mp4" controls="controls" style="max-width: 50%;">
  </video>
</p>

## Installation

### Prerequisites

- Docker
- Docker Compose (optional, but recommended)
- GitHub Personal Access Token (no scopes required)

### Quick Setup

1. Clone this repository
2. Create a `.env` file from the template:

```sh
cp .env.template .env
```

3. Add your GitHub token to the `.env` file:

```env
TOKEN=<your-github-token>
```

4. Start the container using Docker Compose:

```sh
docker-compose up -d
```

The service will be available at `http://localhost:9000`

## Usage

Once the container is running, you can use it by replacing `streak-stats.demolab.com` with `localhost:9000` in your GitHub streak stats URL:

```md
[![GitHub Streak](http://localhost:9000/?user=qcoudeyr)](https://git.io/streak-stats)
```

### Configuration

The container can be configured using the following environment variables:

- `APPPORT`: The port the service will listen on (default: 9000)

You can modify these in the

docker-compose.yml

 file or pass them directly to Docker.

## Docker Details

The container is based on Alpine Linux and includes:

- PHP 8.2 with required extensions
- Apache2
- Inkscape (for PNG rendering)
- Composer for PHP dependencies

The container automatically:

- Installs all required dependencies
- Sets up PHP and Apache
- Configures the application
- Exposes the specified port

## Known Issues and Limitations

- The container needs to be able to make outbound connections to GitHub's API
- PNG rendering requires additional memory due to Inkscape requirements

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

This Docker implementation follows the same license as the original project by DenverCoder1.

## Acknowledgments

- [DenverCoder1](https://github.com/DenverCoder1) for creating the original [GitHub Readme Streak Stats](https://github.com/DenverCoder1/github-readme-streak-stats) project
- The Alpine Linux team for providing a great base image
