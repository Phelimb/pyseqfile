# import collections
cimport cseq_file

"""Fast parsing of multiple sequence file formats using seq_file"""

__version__ = '0.0.1'

cdef class Read:
    cdef char* seq
    def __cinit__(self, char* seq):
        self.seq = seq

cdef class Reader:
    cdef cseq_file.read_t* read
    cdef cseq_file.seq_file_t* cfile
    def __cinit__(self, str filename):
        filename_byte_string = filename.encode("UTF-8")
        cdef char* fname = filename_byte_string 
        
        self.cfile = cseq_file.seq_open(fname)
        if self.cfile == NULL:
            raise FileNotFoundError(2, "No such file or directory: '%s'" % filename)
        self.read  =cseq_file.seq_read_new()
    

    def __dealloc__(self):
        cseq_file.seq_close(self.cfile)
        cseq_file.seq_read_free(self.read)     

    def __iter__(self):
        while(cseq_file.seq_read(self.cfile, self.read) > 0):
            yield self.read.seq.b




