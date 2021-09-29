install.packages("furrr")
devtools::install_github("Erickcufe/seekerBio")
devtools::install_github("Erickcufe/hgdp", ref = "erick")

usethis::git_sitrep()
usethis::create_github_token()
gitcreds::gitcreds_set()
