# docker-opencpu

Dockerized OpenCPU with Samples

Built based on `opencpu/debian-10:latest`.

## How to get

```bash
$ docker pull b2bwebid/opencpu:latest
```

## How to use

```bash
$ docker run -t -p 8080:80 -p 8004:8004 b2bwebid/opencpu:latest
```

Then open `http://localhost:8080/ocpu/` to check if everything is OK.
