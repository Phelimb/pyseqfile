cdef extern from "../seq_file/stream_buffer.h":
    ctypedef struct StreamBuffer:
          char *b#;
          # begin is index of first char (unless begin >= end)
          # end is index of \0
          # size should be >= end+1 to allow for \0
          # (end-begin) is the number of bytes in buffer
          size_t begin, end, size#;        

cdef extern from "../seq_file/seq_file.h":

    # ctypedef enum seq_format:
    #     SEQ_FMT_UNKNOWN = 0,
    #     SEQ_FMT_PLAIN = 1, SEQ_FMT_FASTA = 2, SEQ_FMT_FASTQ = 4,
    #     SEQ_FMT_SAM = 8, SEQ_FMT_BAM = 16, SEQ_FMT_CRAM = 16


    ctypedef seq_file_struct seq_file_t
    # ctypedef read_struct read_t
    ctypedef struct seq_file_struct
    #     char *path#;
    #     FILE *f_file#;
    #     gzFile gz_file#;
    #     void *hts_file#; // cast to (htsFile*)
    #     void *bam_hdr#; // cast to (bam_hdr_t*)
    #     int (*readfunc)(seq_file_t *sf, read_t *r)#;
    #     StreamBuffer _in#;
    #     seq_format format#;
    #     #// Reads pushed onto a 'read stack' aka buffer
    #     read_t *rhead
    #     read_t *rtail#; // 'unread' reads, add to tail, return from head
    #     int (*origreadfunc)(seq_file_t *sf, read_t *r)#; // used when read = _seq_read_pop

    ctypedef struct seq_buf_t:
        char *b
        size_t end
        size_t size


    # ctypedef struct read_struct:
    #     seq_buf_t name, seq, qual#;
    #     void *bam#; // cast to (bam1_t*) get/set with seq_read_bam()
    #     read_t *next#; // for use in a linked list
    #     bint from_sam#; // from sam or bam
    
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



