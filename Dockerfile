# start from the rocker/r-ver:3.5.0 image
FROM rocker/r-ver:3.5.0

# install the linux libraries needed for plumber
RUN apt-get update -qq && apt-get install -y \
  libssl-dev \
  libcurl4-gnutls-dev

# install plumber
RUN R -e "install.packages('plumber')"
RUN R -e "install.packages('msm')"
RUN R -e "install.packages('rjson')"

# copy everything from the current directory into the container
COPY /api.R /api.R 
COPY /run_api.R /main.R

# open port 80 to traffic
EXPOSE 80

# when the container starts, start the main.R script
ENTRYPOINT ["Rscript", "main.R"]