# vlmcsd Docker Container for FreeBSD

This repository contains a Dockerfile to build and run vlmcsd (KMS Emulator) in a FreeBSD container.

## Prerequisites

1. FreeBSD host system
2. Docker installed
3. FreeBSD container base image (see Setup section)

## Setup

1. First, you need to set up the FreeBSD container base image. Follow the instructions from [freebsd-container](https://github.com/paigeadelethompson/freebsd-container):

```bash
# Clone the repository
git clone https://github.com/paigeadelethompson/freebsd-container.git
cd freebsd-container

# Build the FreeBSD container images
sudo ./freebsd_images.sh
```

This will create the necessary FreeBSD base images, including `localhost/freebsd:14-1-release` which we use.

2. Build the vlmcsd container:

```bash
docker build -t vlmcsd .
```

## Usage

Run the container:

```bash
docker run -p 1688:1688 vlmcsd
```

The KMS server will start with verbose debug output enabled (-Dv flag).

### Ports

- 1688: Default KMS port

### Environment Variables

None required. The container runs with default vlmcsd settings.

## Features

- Built on FreeBSD 14.1-RELEASE
- Includes verbose debug output
- Automatically builds vlmcsd from source
- Runs with default KMS settings

## License

This project is open source and available under the same license as FreeBSD. 