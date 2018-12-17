

library(XML)
fortunes = htmlParse("fortunes.html")
print(fortunes)
xpathApply(doc=fortunes,path="/html/body/div/p/i")
xpathApply(doc=fortunes,path="//div/p[last()-1]")

