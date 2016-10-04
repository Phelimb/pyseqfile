cdef extern from "../seq_file/seq_file.h":

    ctypedef seq_file_struct seq_file_t
    ctypedef struct seq_file_struct

    ctypedef struct seq_buf_t:
        char *b
        size_t end
        size_t size

    ctypedef struct read_t:
        seq_buf_t name
        seq_buf_t seq
        seq_buf_t qual#
        void *bam# // cast to (bam1_t*) get/set with seq_read_bam()
        read_t *next# // for use in a linked list
        bint from_sam#        


    seq_file_t* seq_open(const char* p)
    void seq_close(seq_file_t* sf)
    int seq_read(seq_file_t* sf, read_t* r)
    read_t* seq_read_new()
    void seq_read_free(read_t *r)



