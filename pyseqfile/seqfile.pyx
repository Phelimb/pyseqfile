cimport cseq_file

# cdef class Reader:
#     def __cinit__(self, str f):
#         cseq_file.seq_open(f)
#         # if self._seq_file is NULL:
#         #     raise MemoryError()        

#     # def __dealloc__(self):
#         # if self._seq_file is not NULL:
#         #     cqueue.seq_close(self._seq_file)            

def read_file(filename):
    filename_byte_string = filename.encode("UTF-8")
    cdef char* fname = filename_byte_string 
    cdef cseq_file.seq_file_t* cfile
    cfile = cseq_file.seq_open(fname)
    if cfile == NULL:
        raise FileNotFoundError(2, "No such file or directory: '%s'" % filename)
 
    # cdef char * line = NULL
    # cdef size_t l = 0
    # cdef ssize_t read
    cdef cseq_file.read_t* read
    read  =cseq_file.seq_read_new()
    while(cseq_file.seq_read(cfile, read) > 0):
        yield read.seq.b
 
    cseq_file.seq_close(cfile)
    cseq_file.seq_read_free(read)
