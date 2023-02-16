#Zooper cleaning
library(zooper)

#download zoop data
zoop_data<-Zoopdownloader(Data_sets=c("EMP_Meso","FMWT_Meso","STN_Meso","20mm_Meso","FRP_Meso","EMP_Macro","FRP_Macro","FMWT_Macro","STN_Macro"))

Meso_data <- Zoopsynther(Data_type = "Community",
                       Sources = c("EMP", "FRP", "FMWT","STN","20mm"),
                       Size_class = "Meso",
                       Date_range = c("2017-01-01", "2019-12-31"))
Macro_data<-Zoopsynther(Data_type = "Community",
                        Sources = c("EMP", "FRP", "FMWT","STN"),
                        Size_class = "Macro",
                        Date_range = c("2017-01-01", "2019-12-31"))
Zooper_data<-Meso_data%>%
  rbind(Macro_data)
saveRDS(Zooper_data,"Data/Zooper_data.rds")
