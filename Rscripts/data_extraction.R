library(dplyr)
library(robotoolbox)
# remotes::install_github("dickoa/robotoolbox")# installing kobo package

## setup
kobo_setup(url = "https://eu.kobotoolbox.org",
           token = Sys.getenv("token"))
token <- kobo_token(username = "brianstefans",
                    password = Sys.getenv("password"),
                    overwrite = TRUE)
kobo_setup(url = "https://eu.kobotoolbox.org",
           token = token)
asset_list <- kobo_asset_list()

uid <- asset_list %>% filter(name == "survey1") %>% pull(uid)# "aYuTZn9vegi3Z49MXwKjep"
asset <- kobo_asset(uid) %>% kobo_data()
asset %>% readr::write_rds("./Data/test_data.rds",compress = "bz")



