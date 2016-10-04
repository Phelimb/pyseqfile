# import collections
cimport cseq_file

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
        # cdef cseq_file.read_t* self.read
        self.read  =cseq_file.seq_read_new()
            # if self._seq_file is NULL:
        #     raise MemoryError()        

    def __dealloc__(self):
        cseq_file.seq_close(self.cfile)
        cseq_file.seq_read_free(self.read)     

    def __iter__(self):
        while(cseq_file.seq_read(self.cfile, self.read) > 0):
            yield self.read.seq.b



# def read_file(filename):

#     while(cseq_file.seq_read(cfile, read) > 0):
#         yield read.seq.b
 

