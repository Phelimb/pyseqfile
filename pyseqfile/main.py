# from seqfile import read_file

# for r in read_file('/Users/phelimb/Documents/data/5054-08.fastq'):
#     print(r)
#     pass

from seqfile import Reader

reader = Reader('/Users/phelimb/Documents/data/5054-08.fastq')
for r in reader:
    print(r)  # for r in reader:
#     print(r)
