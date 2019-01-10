

#2017年08月16日

library(rvest)
library(downloader)
url<-"https://www.zhihu.com/question/35931586/answer/206258333"


link<- read_html(url)%>% html_nodes("div.RichContent-inner>span")%>%
html_nodes("img")%>%html_attr("data-original")%>%na.omit
#借助Chrome的审查元素功能，借助其路径copy功能精准定位图片所在节点

link<-link[seq(1,length(link),by=2)]                   #剔除无效网址
Name<-sub("https://pic\\d.zhimg.com/v2-","",link)      #提取图片名称
dir.create("/Users/zhenglin/code/others/R_code/R_spider_zhihu/Image") #建立存储文件夹
setwd("/Users/zhenglin/code/others/R_code/R_spider_zhihu/Image")      #锁定临时目录
for(i in 1:length(link)){
	download(link[i],Name[i], mode = "wb")
}  #下载过程