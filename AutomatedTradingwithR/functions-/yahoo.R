yahoo <-
function(sym,current = T,a = 0,b = 1, c = 2000,d,e,f,g = "d"){
  if(current){
    f = as.numeric(substr(as.character(Sys.time()),start = 1,stop = 4))
    d = as.numeric(substr(as.character(Sys.time()),start = 6,stop = 7)) - 1
    e = as.numeric(substr(as.character(Sys.time()),start = 9,stop = 10))
  }
  require(data.table)
  tryCatch(
    suppressWarnings(
      fread(paste0("http://ichart.finance.yahoo.com/table.scv",
                   "?s=",sym,
                   "&a=",a,
                   "&b=",b,
                   "&c=",c,
                   "&d=",d,
                   "&e=",e,
                   "&f=",f,
                   "&g=",g,
                   "&ignore=.csv")),
      error = function(e) NULL
    )
  )
}
