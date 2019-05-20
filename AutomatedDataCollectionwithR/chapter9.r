

rm(list = ls())

library(RCurl)
library(XML)
library(stringr)
library(plyr)
library(httr)
library(rvest)

# url = "https://elections.maryland.gov/elections/2012/election_data/index.html"
url <- "https://mirrors.tuna.tsinghua.edu.cn/CRAN/web/packages/available_packages_by_date.html"
html = getURL(url,followlocation = TRUE, cainfo = system.file("CurlSSL", "cacert.pem", package = "RCurl"))
ldply(xmlToList(html, data.frame))
parse_html <- function(html){
  time <- html %>%
    html_nodes('th')
}
parse_html(html)
links = getHTMLLinks(html)
filenames = links[str_detect(links,".csv|xls")]
filenames <- as.data.frame(filenames)

apply(filenames,1,function(x){y=paste0("https://elections.maryland.gov/elections/2012/election_data/",x)})
downloadCSV <- function(filename,baseurl,folder){
  dir.create(folder,showWarnings = FALSE)
  fileurl <- str_c(baseurl, filename)
  destfile <- str_c(folder,'/',filename)
  if (!file.exists(destfile)){
    download.file(fileurl,destfile=destfile)
    Sys.sleep(1)
  }
}

l_ply(filenames, downloadCSV,
      baseurl = "https://elections.maryland.gov/elections/2012/election_data/",
      folder = "elec12_maryland"
)
# TODO:
# Warning message:
#   In if (!file.exists(destfile)) { :
#       the condition has length > 1 and only the first element will be used

# ref: https://www.trustpilot.com/review/www.amazon.com



ftp = "ftp://cran.r-project.org/pub/R/web/views/"
ftp_files = getURL(ftp,dirlistonly = T)
filenames = str_split(ftp_files,"\r\n")[[1]]
filenames_html = unlist(str_extract_all(filenames,".+(.html)"))


downloadFTP = function(filename,folder,handle){
  dir.create(folder,showWarnings = FALSE)
  fileurl = str_c(ftp,filename)
  if(! file.exists(str_c(folder,"/",filename))){
    content = try(getURL(fileurl,curl = handle))
    write(content,str_c(folder,"/",filename))
    Sys.sleep(1)
  }
}

handle = getCurlHandle(ftp.use.epsv = FALSE)

l_ply(filenames_html,downloadFTP,folder = "cran_task",handle = handle,.progress = "text")


