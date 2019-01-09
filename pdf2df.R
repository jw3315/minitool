##pdf2df minitool

##https://www.ilovepdf.com/download/dcfae75ee82dea7d46055919f8482006_fabedb26eaf3c33cd98bbbdd555c5e7f
#doesn't work for some cases

###### 2 columns data dictionary pdf
# eg.http://www.l2political.com/wp-content/uploads/2016/09/L2-Data-Dictionary-1.pdf
library(pdftools)
library(stringr)
url = "http://www.l2political.com/wp-content/uploads/2016/09/L2-Data-Dictionary-1.pdf" 
doc <- pdftools::pdf_text(url)
doc <- strsplit(dat, "\r\n")

f221<-function(page){
  left=str_trim(substr(page,1,41))
  right=str_trim(substr(page,42,100))
  c(left,right)
}

pdf2df<-function(doc){
  temp = unlist(sapply(doc,f221))
  temp = temp[!str_detect(temp,'www.l2political.com|L2 Better Data. Better Decisions|^L2')]
  data.frame(temp)
}

df=pdf2df(doc)


####### extract tables in pdf
library(rJava) #make sure R and Java are all 32bit or 64bit
library(tabulizer)
url <- "http://www.l2political.com/wp-content/uploads/2016/09/L2-Data-Dictionary-1.pdf"
lst <- extract_tables(report, encoding="UTF-8")
