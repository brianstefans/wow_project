library(dplyr)
library(robotoolbox)
# remotes::install_github("dickoa/robotoolbox")# installing kobo package
#print(paste0("token-",Sys.getenv("TOKEN")))
#print(paste0("user-",Sys.getenv("USERNAME")))
#print(paste0("pswd-",Sys.getenv("PASSWORD")))
## setup
kobo_setup(url = "https://eu.kobotoolbox.org",
           token = Sys.getenv("TOKEN"))
token <- kobo_token(username = Sys.getenv("USERNAME"),
                    password = Sys.getenv("PASSWORD"),
                    overwrite = TRUE)
kobo_setup(url = "https://eu.kobotoolbox.org",
           token = token)
asset_list <- kobo_asset_list()

uid <- asset_list %>% filter(name == "survey1") %>% pull(uid)# "aYuTZn9vegi3Z49MXwKjep"
asset <- kobo_asset(uid) %>% kobo_data()
asset %>% readr::write_rds("./Data/test_data.rds",compress = "bz")


print("done")
