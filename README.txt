Guide to files:

### Preprocessing and training ###

pull_ngrams.ipynb - Script to pull the ngrams data from the website
final_word2vec - The script used to train ENG_GB word embeddings. Includes both standard and iterable implementations.
ngram_partitioner - The script used to partition the data into gzip files corresponding to each decade
partition_diagnostics.py - Analyse results of partitioning
Convert2Word2Vec.py - Converts files stored as arrays into files useable by Gensim's Word2Vec module
surveypreprocessing.ipynb - Preprocessing of the surveys used for the correlational analyses
external_model_downloader - Download external models to use as benchmarks 
word_tools.py - Functions used to scrape and compile word lists to use for analysis



### Specific analysis files ###

Scripts according to each focal point of analyses. Corresponds approximately to the rounds of analysis described in the paper
1. Manager analyses
2. Professions analyses
3. Lifestyle analyses
4. Occupations analyses

### General analysis files ###

vec_tools.py - ***Most important***. Collection of almost all functions used for analysis in the specific analysis files above
explore_embeddings_modular.ipynb - First implementation of embeddings analysis functionality. Includes functions for testing dimension stability, silhouettes, dimension pole associations, and correlating individual lifestyle domains.
evaluate_embeddings.ipynb (mostly outdated - most up-to-date in vec_tools.py)- Scripts for most of the initial rounds of embeddings evaluation, including correlation with all 4 of the surveys. 

### Folders ###
Data - Folder storing data used for analyses (original data removed)
Outputs - Folder for storing graphs and evaluation files
Old - dump for older versions of files