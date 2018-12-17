

rm(list = ls())

library(RCurl)
library(XML)
library(stringr)
library(plyr)
library(httr)
# url = "http://www.elections.state.md.us/elections/2012/election_data/index.html"
# links = getHTMLLinks(url)
mac_url = "http://en.wikipedia.org/wiki/Machiavelli"
getHTMLLinks(mac_url,externalOnly = T)


