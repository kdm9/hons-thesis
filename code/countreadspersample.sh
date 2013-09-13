for fqfile in `find -name *.fastq.gz`
do
	echo "$fqfile $(($(zcat $fqfile | wc -l) / 4))"
done
