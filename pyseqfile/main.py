# from seqfile import read_file

# for r in read_file('/Users/phelimb/Documents/data/5054-08.fastq'):
#     print(r)
#     pass

from seqfile import Reader
# reader = Reader('/Users/phelimb/Documents/data/5054-08.fastq')
reader = Reader('/Users/phelimb/Documents/git/atlas-seq/oxa1.fasta')
for r in reader:
    r = r.decode("UTF-8")
    print(r)
    # print(k)

    # print(r)  # for r in reader:
#     print(r)
