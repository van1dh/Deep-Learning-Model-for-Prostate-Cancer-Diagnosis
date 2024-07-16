library(TCGAbiolinks)
library(SummarizedExperiment)
library(stringr)
data <- GDCquery(project = "TCGA-PRAD",
                 data.category = "Transcriptome Profiling", 
                 data.type = "Gene Expression Quantification", 
                 workflow.type = "STAR - Counts")

GDCdownload(query = data, method = "api")

expdat <- GDCprepare(query = data)

# get sample ID
sample_id <- expdat$barcode

# get sample type
sample_type <- expdat$sample_type

# get matrix
#count_matrix <- assay(expdat, "raw_counts")

write.csv(sample_id, file = "sample_id.csv")
write.csv(sample_type, file = "sample_type.csv")
write.csv(expdat@assays@data@listData[["unstranded"]], file = "data_un.csv")
write.csv(expdat@assays@data@listData[["tpm_unstrand"]], file = "data_tpm.csv")
write.csv(str_split(expdat@rowRanges@elementMetadata@listData$gene_id,"[.]",simplify=T), file = "gene_id.csv")
