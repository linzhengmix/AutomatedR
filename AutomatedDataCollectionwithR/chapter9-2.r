
rm(list = ls())

library(RCurl)
library(XML)
library(stringr)
library(plyr)

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

