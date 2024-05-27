## code to prepare `processed_sim_data` datasets goes here
doublets<-seq(5,50,5)
seed<-c(1)
key<-letters[seq_along(doublets)]
for (i in seq_along(doublets)) {
  d<-doublets[i]
  k<-key[i]
  path<-paste0('/data/projects/demuxSNP/nextflow/ccrcc_out/demuxSNP_',k,'_',d,'_',seed,'/',k,'_final_sce.rdata')
  print(path)
  load(path)
  name<-paste("sce_",d,'pc',sep="")
  assign(name,sce)
  #names(path)<-name
  #usethis::use_data(list=ls()[grep("name",ls())],overwrite = TRUE)
  save(list=ls()[grep(name,ls())],file=paste0('./data/sce_object_',d,'pc_doub.rda'),compress=TRUE)
}

getwd()





#usethis::use_data(processed_sim_data, overwrite = TRUE)
