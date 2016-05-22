# Galaxy - GalaxyP
#
# VERSION       0.1

FROM bgruening/galaxy-stable:15.03

MAINTAINER Björn A. Grüning, bjoern.gruening@gmail.com

ENV GALAXY_CONFIG_BRAND Galaxy for Proteomic Research
ENV ENABLE_TTS_INSTALL True

WORKDIR /galaxy-central

# Packages
RUN install-repository \
    "--url http://toolshed.g2.bx.psu.edu/ -o galaxyp --name package_directag" \
    "--url http://toolshed.g2.bx.psu.edu/ -o galaxyp --name package_myrimatch" \
    "--url http://toolshed.g2.bx.psu.edu/ -o galaxyp --name package_mgf_formatter" \
    "--url http://toolshed.g2.bx.psu.edu/ -o galaxyp --name package_ltq_iquant_cli" \
    "--url http://toolshed.g2.bx.psu.edu/ -o galaxyp --name package_idpqonvert" \
    "--url http://toolshed.g2.bx.psu.edu/ -o galaxyp --name package_tagrecon"


RUN install-repository \
    "--url http://testtoolshed.g2.bx.psu.edu/ -o galaxyp --name peptideshaker --panel-section-name PeptideShaker" \
    "--url http://toolshed.g2.bx.psu.edu/ -o galaxyp --name dbbuilder --panel-section-id getext" \
    "--url http://toolshed.g2.bx.psu.edu/ -o galaxyp --name decoyfasta --panel-section-name FASTA-Tools" \
    "--url http://toolshed.g2.bx.psu.edu/ -o galaxyp --name directag_and_tagrecon --panel-section-name Bumbershoot" \
    "--url http://toolshed.g2.bx.psu.edu/ -o galaxyp --name idpqonvert --panel-section-name Bumbershoot" \
    "--url http://toolshed.g2.bx.psu.edu/ -o galaxyp --name ltq_iquant_cli --panel-section-name utils" \
    "--url http://toolshed.g2.bx.psu.edu/ -o galaxyp --name mgf_formatter --panel-section-name utils" \
    "--url http://toolshed.g2.bx.psu.edu/ -o galaxyp --name msconvert --panel-section-name utils" \
    "--url http://toolshed.g2.bx.psu.edu/ -o galaxyp --name ms_data_converter --panel-section-name utils" \
    "--url http://toolshed.g2.bx.psu.edu/ -o galaxyp --name ms_wiff_loader --panel-section-name utils" \
    "--url http://toolshed.g2.bx.psu.edu/ -o galaxyp --name myrimatch --panel-section-name Bumbershoot" \
    "--url http://toolshed.g2.bx.psu.edu/ -o galaxyp --name peptide_to_gff --panel-section-name utils" \
    "--url http://toolshed.g2.bx.psu.edu/ -o galaxyp --name pepxml_to_xls --panel-section-name utils" \
    "--url http://toolshed.g2.bx.psu.edu/ -o galaxyp --name proteinpilot --panel-section-name utils" \
    "--url http://toolshed.g2.bx.psu.edu/ -o galaxyp --name protxml_to_xls --panel-section-name utils" \
    "--url http://toolshed.g2.bx.psu.edu/ -o galaxyp --name psm_eval --panel-section-name utils"

# FASTA tools
RUN install-repository \
    "--url http://toolshed.g2.bx.psu.edu/ -o devteam --name fasta_compute_length --panel-section-name FASTA-Tools" \
    "--url http://toolshed.g2.bx.psu.edu/ -o galaxyp --name fasta_merge_files_and_filter_unique_sequences --panel-section-name FASTA-Tools" \
    "--url http://toolshed.g2.bx.psu.edu/ -o peterjc --name seq_filter_by_id --panel-section-name FASTA-Tools" \
    "--url http://toolshed.g2.bx.psu.edu/ -o peterjc --name seq_rename --panel-section-name FASTA-Tools" \
    "--url http://toolshed.g2.bx.psu.edu/ -o peterjc --name seq_select_by_id --panel-section-name FASTA-Tools" \
    "--url http://toolshed.g2.bx.psu.edu/ -o devteam --name fasta_formatter --panel-section-name FASTA-Tools" \
    "--url http://toolshed.g2.bx.psu.edu/ -o devteam --name fasta_nucleotide_changer --panel-section-name FASTA-Tools" \
    "--url http://toolshed.g2.bx.psu.edu/ -o devteam --name fasta_to_tabular --panel-section-name FASTA-Tools" \
    "--url http://toolshed.g2.bx.psu.edu/ -o bgruening --name find_subsequences --panel-section-name FASTA-Tools" \
    "--url http://toolshed.g2.bx.psu.edu/ -o devteam --name tabular_to_fasta --panel-section-name FASTA-Tools"


RUN install-repository \
    "--url http://toolshed.g2.bx.psu.edu/ -o bgruening --name text_processing --panel-section-id textutil" \
    "--url http://toolshed.g2.bx.psu.edu/ -o iuc --name bedtools --panel-section-name BEDtools" \
    "--url http://toolshed.g2.bx.psu.edu/ -o jjohnson --name translate_bed_sequences --panel-section-name BEDtools" \
    "--url http://toolshed.g2.bx.psu.edu/ -o jjohnson --name filter_bed_on_splice_junctions --panel-section-name BEDtools" \
    "--url http://toolshed.g2.bx.psu.edu/ -o jjohnson --name rsem --panel-section-name RSEM"


# Workflows :: does not work currently
#RUN install-repository \
#    "--url http://toolshed.g2.bx.psu.edu/ -o galaxyp --name proteomics_novel_peptide_filter_workflow" \
#    "--url http://toolshed.g2.bx.psu.edu/ -o galaxyp --name proteomics_rnaseq_reduced_db_workflow" \
#    "--url http://toolshed.g2.bx.psu.edu/ -o galaxyp --name proteomics_rnaseq_sap_db_workflow" \
#    "--url http://toolshed.g2.bx.psu.edu/ -o galaxyp --name proteomics_rnaseq_splice_db_workflow"

RUN install-repository \
    "--url http://testtoolshed.g2.bx.psu.edu/ -o galaxyp --name openms --panel-section-name OpenMS" \
    "--url http://testtoolshed.g2.bx.psu.edu/ -o iracooke --name spectrast --panel-section-name SpectraST" \
    "--url http://testtoolshed.g2.bx.psu.edu/ -o galaxyp --name feature_alignment --panel-section-name SpectraST" \
    "--url http://testtoolshed.g2.bx.psu.edu/ -o galaxyp --name spectrast2spectrast_irt --panel-section-name SpectraST" \
    "--url http://testtoolshed.g2.bx.psu.edu/ -o galaxyp --name spectrast2tsv --panel-section-name SpectraST"

# Suites
#RUN install-repository \
#    "--url http://testtoolshed.g2.bx.psu.edu/ -o galaxyp --name suite_swath_analysis"

RUN install-repository \
    "--url http://testtoolshed.g2.bx.psu.edu/ -o iuc --name package_tpp_4_8_0" \
    "--url http://testtoolshed.g2.bx.psu.edu/ -o iuc --name package_protk_1_4_2"


# Mark folders as imported from the host.
VOLUME ["/export/", "/data/", "/var/lib/docker"]

# Expose port 80 (webserver), 21 (FTP server), 8800 (Proxy)
EXPOSE :80
EXPOSE :21
EXPOSE :8800

# Autostart script that is invoked during container start
CMD ["/usr/bin/startup"]
