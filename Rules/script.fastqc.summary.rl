rule script_fastqc_summary:
    input:  "{x}.sam",
    output: temp("{x}.bam")
    params: sam=config['bin'][pfamily]['SAMTOOLS'],rname="pl:fqcsum"
    shell:  "{params.sam} view -bS {input} > {output}"

