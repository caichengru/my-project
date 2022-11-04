transcript <- readRDS("ds/成績單.rds")
p <- head(transcript, 100)
p<- data.frame(t(p))
plot(p$X1, type="l", , ylim = c(0, 110), ylab = "成績")
for(i in 2:NCOL(p)){
  lines(p[,i] , type = "l")
}

matlines(p, type = c("b"),pch=1)

df <- data.frame(x=rep(1:5, 9), val=sample(1:100, 45), 
                 variable=rep(paste0("category", 1:9), each=5))
