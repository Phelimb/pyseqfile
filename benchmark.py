# benchmarks
import sys
sys.path.append(".")
import time
from Bio import SeqIO
from pyseqfile import Reader
import timeit


def run_biopython():
    with open('example-data/test.fastq', 'r') as f:
        for r in SeqIO.parse(f, 'fastq'):
            a = r.seq


def run_seqfile():
    for r in Reader('example-data/test.fastq'):
        a = r

start_time = timeit.default_timer()
for i in range(100):
    run_biopython()
print("Reading 10k lines 100 times: Biopython : %ss" %
      str(timeit.default_timer() - start_time))
start_time = timeit.default_timer()
for i in range(100):
    run_seqfile()
print("Reading 10k lines 100 times: seqfile : %ss" %
      str(timeit.default_timer() - start_time))

# run_seqfile()
