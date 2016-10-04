# pyseqfile

Pyseqfile is a python wrapper on top of [seq_file](https://github.com/noporpoise/seq_file) which allow for reading multiple sequence file formats. 

Currently supports:

FASTA & FASTQ

TO DO:

* SAM & BAM (make seq_file with htslib)
* gzipped FASTA
* gzipped FASTQ

# Install
	
	pip install pyseqfile

# Usage

	from pyseqfile import Reader

	reader = Reader('path/to/seqfile{.fq,.fq,.fa,bam,.sam}')
	for r in reader:
	    print(r)

# Benchmarks

pyseqfile is *much* faster than Biopython. 

$ python benchmark.py

	Reading 10k lines 100 times: Biopython : 6.6768401420122245s
	Reading 10k lines 100 times: seqfile : 0.1060560290061403s