rule annovar2_all:
      input:  snp = "all.snp.vcf", indel = "all.indel.vcf",
      output: snpav = "all.snp.vcf.av", indelav = "all.indel.vcf.av",
      params: snpsum = "all.snp.vcf.sum.av", indelsum = "all.indel.vcf.sum.av", annovar1=config['bin'][pfamily]['ANNOVAR1'], annovar2=config['bin'][pfamily]['ANNOVAR2'], anndir=config['references'][pfamily]['ANNDIR'],rname="pl:annovar"
      shell:  """
              {params.annovar1} -format vcf4 {input.snp} -outfile {output.snpav};
              {params.annovar1} -format vcf4 {input.indel} -outfile {output.indelav}; 
              {params.annovar2} {output.snpav} {params.anndir} -buildver hg19 -out {params.snpsum} -remove -protocol refGene,genomicSuperDups,hapmap,esp6500siv2_alafr,1000g2014oct_eas,1000g2014oct_eur,snp138,ljb26_all -operation g,r,f,f,f,f,f,f,f,f -nastring NA;
              {params.annovar2} {output.indelav} {params.anndir} -buildver hg19 -out {params.indelsum} -remove -protocol refGene,genomicSuperDups,hapmap,esp6500siv2_alafr,1000g2014oct_eas,1000g2014oct_eur,snp138,ljb26_all -operation g,r,f,f,f,f,f,f,f,f -nastring NA

              """

