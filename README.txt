Pre-Machine Learning
--------------------

prepare_tsu1.m
	Creates a list of PDB IDs, energies, and residues for the Tsuboyama data
	input: dG_non_redundant_natural_Fig5.csv
	output: phoslist_tsu.csv

prepare_tsu2.m
	Aligns sequences for Tsuboyama proteins and adds new residue numbers to list
	input: phoslist_tsu.csv
	output: phoslist_tsu_new.csv

prepare_pancancer1.m
	Creates a list of Uniprot IDs and residues for the cancer dataset
	input: mmc1.xlsx, mmc2.xlsx
 	output: phostable.csv

prepare_pancancer2.m
	Reads alignments for cancer proteins and adds new residue numbers to list
	input: phostable.csv, aligned sequences
	output: phoslist_with_conversion.csv



Post-Machine Learning
---------------------

remove_duplicates.m
	Removes rows with the same uniprot ID and mutated residue number
	input: final_output_with_predictions.csv (from machine learning)
	output: edited final_output_with_predictions.csv

sorte.m
	Sorts uniprot ids by maximum energy of XGB + direct FoldX phosphorylation. 
	input: final_output_with_predictions.csv
	output: uniout.txt

centralities.m
	Determines whether network locations with certain centrality measures are prone to harbor destabilizing phosphorylations
	input: final_output_with_predictions.csv, mmc2.xlsx
 	output: box plots and p values for centralities with low and high ddG

search_humsavar.m
	Searches the humsavar database for tyrosine to aspartate mutations at the same residue positions as phosphorylations from the cancer dataset
	input: humsavar2.txt, final_output_with_predictions.csv
	output: rows from cancer output data matching to humsavar

search_clinvar.m
	Searches the clinvar database for tyrosine to aspartate mutations at the same residue positions as phosphorylations from the cancer dataset
	input: variant_summary.txt, final_output_with_predictions.csv
	output: rows from cancer output data matching to clinvar

	
	