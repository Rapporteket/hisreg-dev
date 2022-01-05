FROM rapporteket/dev:nightly

LABEL maintainer "Are Edvardsen <are.edvardsen@helse-nord.no>"

# hadolint ignore=DL3008

# add registry dev config and R pkg dependencies
COPY --chown=rstudio:rstudio db.yml /home/rstudio/rap_config/
RUN cat /home/rstudio/rap_config/db.yml >> /home/rstudio/rap_config/dbConfig.yml \
    && rm /home/rstudio/rap_config/db.yml \
    && R -e "install.packages(c('covr',\
                                'DT', \
                                'htmltools', \
                                'kableExtra',\
                                'lintr',\
                                'lubridate',\
                                'magrittr',\
                                'shiny',\
                                'shinyalert',\
                                'shinycssloaders',\
                                'testthat',\
                                'xtable',\
                                'plotrix',\
                                'shinyjs',\
                                'tidyverse'))" \
    && R -e "remotes::install_github(c('Rapporteket/rapbase', 'Rapporteket/rapFigurer'))"
