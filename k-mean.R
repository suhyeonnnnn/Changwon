setwd('C:/Users/sh921/Desktop/jupyter/Changwon-bigdata')
#data load
df <- read.csv("cluster_final.csv")
str(df)

#OPTIMAL NUMBER OF CLUSTERS#
library(factoextra)

fviz_nbclust(df, kmeans, method = "wss") #optimal n of clusters = 3 or 4
kmeans.result <- kmeans(df, 3)
kmean_result <- table(df$id, kmeans.result$cluster)
write.csv(kmean_result, file="kmean_result.csv", quote=FALSE)


#master file merge
kmean <- read.csv('kmean_result.csv') #엑셀에서 칼럼명 수정정
str(kmean)

master <- merge(df, kmean, by='id', all.x =T)
colSums(is.na(master))
write.csv(master,"kmeanResult.csv")
