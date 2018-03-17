typedef struct st_hash_type {
    int (*compare) ();
    int (*hash) ();
} st_hash_type;

typedef struct st_table_entry {
    unsigned int hash;
    char *key;
    char *record;
    st_table_entry *next;
} st_table_entry;

typedef struct st_table {
    struct st_hash_type *type;
    int num_bins; /* slot count */
    int num_entries; /* total number of entries */
    struct st_table_entry **bins; /* slot */
} st_table;
