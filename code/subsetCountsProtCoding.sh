
for sample in *
do
	pushd $sample
	R --save <<END
		count <- read.delim(dir()[1], header=T, stringsAsFactors=F)
		prot <- read.delim('~/ws/refseqs/TAIR10_gen/TAIR10_protein_coding_agis.txt', header=F, stringsAsFactors=F)
		pc <- count[match(prot[,1], as.character(count[,'geneid'])), 'nreads']
		all <- count[, 'nreads']
		sample <- basename(getwd())
		ppc <- sum(pc) / sum(all) * 100
		ppc.df <- data.frame(sample=sample, protcoding=ppc)
		write.table(ppc.df, "../ppc.csv", append=T, sep='\t')
END
	popd
done
