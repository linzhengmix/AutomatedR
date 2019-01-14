library(plyr)
library(quantmod)
library(TTR)
library(ggplot2)
library(scales)

#下载数据
download<-function(stock){
	df<-getSymbols(stock,src="yahoo")  #下载数据
	names(df)<-c("Open","High","Low","Close","Volume","Adjusted")
	write.zoo(df,file=paste(stock,".csv",sep=""),sep=",",quote=FALSE) #保存到本地
}

read<-function(stock){  
	as.xts(read.zoo(file=paste(stock,".csv",sep=""),header = TRUE,sep=",", format="%Y-%m-%d"))
}

stock<-"AAPL"
download(stock)
#IBM<-read(stock)

# 查看数据类型
#class(IBM)
#[1] "xts" "zoo"

# 查看前6条数据
#head(IBM)