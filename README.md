# The Intuition
This project builds itself on the intuition that Bourdieu best articulated: Why is it that so many choices in lifestyle seem to follow societal structures? It is obvious to our intuitions that sports like golf are for the rich, sports like fighting for the poor, and sports like football is for everyone. These are stereotypes that are embedded in our cultural sense and are what we tap when we make choices in life, talk about our taste, and laugh at jokes. There seems to be a collective body of stereotypes that - true or untrue - we are intuitively well aware of. 

But how do we uncover that body of stereotypes empirically? Bourdieu asked people questions about their lifestyles - their activities, their taste in art and music, their taste in food and drink, and much more - and compared these with their level of income & wealth, their level of education, as well as that of their family. He found a natural grouping of lifestyles according to membership in economic and cultural class that very well replicated stereotypes of these lifestyles in France int he 1970's. 

# The Method
This thesis used the new large language modelling method of word embeddings to attempt to uncover this body of stereotypes. Using the newly available google N-grams data, a series of word embeddings were trained on N-grams from each decade in the 20th century. These yielded a set of language models that were able to model the semantic relationship between words. It took lead from the methods for solving anagrams with word embeddings to create a set of semantic dimensions in the word space. Words could be projected on these semantic dimensions and would yield a value equivalent to their degree of association with a semantic concept - such as race, class, cultivation - which would in turn function as a proxy for their stereotype. 

This was then used to test some hypotheses in the domain of sociology, including: the cultural rise of the professions, the establishment of a managerial capitalism, and the embourgoisement of cultural activities (middle-classification). 

# Guide to files

### Preprocessing and training (located in "src") ###

pull_ngrams.ipynb - Script to pull the ngrams data from the website
final_word2vec - The script used to train ENG_GB word embeddings. Includes both standard and iterable implementations.
ngram_partitioner - The script used to partition the data into gzip files corresponding to each decade
partition_diagnostics.py - Analyse results of partitioning
Convert2Word2Vec.py - Converts files stored as arrays into files useable by Gensim's Word2Vec module
surveypreprocessing.ipynb - Preprocessing of the surveys used for the correlational analyses
external_model_downloader - Download external models to use as benchmarks 
word_tools.py - Functions used to scrape and compile word lists to use for analysis



### Specific analysis files (located in "notebooks") ###

Scripts according to each focal point of analyses. Corresponds approximately to the rounds of analysis described in the paper
1. Manager analyses
2. Professions analyses
3. Lifestyle analyses
4. Occupations analyses

### General analysis files (located in "src") ###

vec_tools.py - Collection of functions used for analysis in the specific analyses made in aforementioned files
explore_embeddings_modular.ipynb - First implementation of embeddings analysis functionality. Includes functions for testing dimension stability, silhouettes, dimension pole associations, and correlating individual lifestyle domains.
evaluate_embeddings.ipynb (mostly outdated - most up-to-date in vec_tools.py)- Scripts for most of the initial rounds of embeddings evaluation, including correlation with all 4 of the surveys. 

### Folders ###
data - Folder storing data used for analyses (original data removed)
src - Preprocessing and analyses scripts
notebooks - Specific analyses for the final report
outputs - Folder for storing graphs and evaluation files
old - dump for older versions of files
