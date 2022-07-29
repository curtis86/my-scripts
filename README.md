[![Test Status](https://github.com/curtis86/my-scripts/actions/workflows/main.yml/badge.svg)](https://github.com/curtis86/my-scripts/actions/workflows/main.yml)

# my-scripts

A collection of scripts that I've made over the years - I will continue to add more as I tidy them up. [Take a look at some of my other projects here!](https://github.com/curtis86?tab=repositories)

Feel free to use them as you like, credit is optional :)

 * **cert-check:** retrieves the x509 SSL certificate data for a domain that's using HTTPS
 * **cert-recon:** retrieves all certificates issued for a specified domain name from public certificate transparency logs, using https://crt.sh/
 * **deardiary:** lock (encrypt) and unlock (decrypt) a plain-text diary file
 * **http-check:** continuously prints out the load time components of a URL (DNS time, TTFB, etc) - useful for observing intermittent issues or just general performance

### Docker

If you'd prefer to run these scripts inside a container, follow the instructions below. Note that you'll want to factor in persistent storage if you use a script such as `deardiary`


### A. Use automatically built Dockerhub image

1. Run the `cert-recon` script on container named `curtis-86-scripts`:

```
docker run -it --name curtis-86-scripts curtiskneisel/my-scripts:latest /opt/my-scripts/cert-recon/cert-recon example.com

```


### B. Build your own docker image

1. Clone this repo and change into the directory

```
git clone https://github.com/curtis86/my-scripts/
cd my-scripts
```

2. Build image, named `curtis-86-scripts`

```
docker build -t curtis-86-scripts .
```

3. Run a script, eg. `cert-recon`

```
docker run -it curtis-86-scripts /opt/my-scripts/cert-recon/cert-recon example.com
```
