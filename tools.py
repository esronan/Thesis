import pandas as pd
import gensim
from gensim.models import Word2Vec, KeyedVectors
import gzip 
import math
import itertools
from time import time
from tqdm import tqdm
import tqdm.notebook as tq
import os
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
from collections import OrderedDict
import numpy as np
import os
import tools
import wikipedia
import nltk
from nltk.tag import UnigramTagger
from nltk.corpus import brown
from nltk.corpus import wordnet as wn

def load_wv(fil, input_dir, kv=False):
    fil = input_dir + fil
    if kv==True:
        return KeyedVectors.load(fil)
    else:
        return gensim.models.Word2Vec.load(fil).wv

def load_wvs(fils, input_dir, kv=False):
    wvs = {}
    print(input_dir)
    for decade, fil in fils.items():
        wv = load_wv(fil, input_dir, kv)
        wvs[decade] = wv
    return wvs
    
def vector_angle(v1, v2):
    v1_norm = v1/np.linalg.norm(v1)
    v2_norm = v2/np.linalg.norm(v2)
    dot = np.dot(v1_norm, v2_norm)
    angle = np.arccos(dot)
    return angle

def check_words(wv):
    for index, word in enumerate(wv.index_to_key):
        if index == 10:
            break
        print(f"word #{index}/{len(wv.index_to_key)} is {word}")

def calc_similarity(wv, w1, w2):
    print(f"Similarity between {w1} and {w2}: ", wv.similarity(w1, w2))

def create_dim(wv, ant_df):
    dims = ant_df.shape
    diffs = []
    cols = ant_df.columns
    #print(f"Positive pole: {cols[0]}\nNegative pole: {cols[1]}")
    missing = []
    for i in range(dims[0]):
        try:
            pos = ant_df.iloc[i,0].lower()
            pos_wv = wv[pos]
        except Exception as e:
            missing.append(pos)
            continue
        try:
            neg = ant_df.iloc[i,1].lower()
            neg_wv = wv[neg]
        except Exception as e:
            missing.append(neg)
            continue
        diff = pos_wv - neg_wv
        diffs.append(diff)
    dimension = sum(diffs)/dims[0]
    #print(f"{missing} not present in vocab")
    return dimension

def vector_angle(v1, v2):
    v1_norm = v1/np.linalg.norm(v1)
    v2_norm = v2/np.linalg.norm(v2)
    dot = np.dot(v1_norm, v2_norm)
    angle = np.arccos(dot)
    return angle

def normify_matrix(matrix):
    for i, row in enumerate(matrix):
        matrix[i] = row/np.linalg.norm(row)
    return matrix

def proj_dim(dim, wv):
    return np.dot(wv, dim)

def chart_project(proj_1, p1_label, proj_2, p2_label, title, word_list, wv):
    inds = []
    projs = {"dim_1": {}, "dim_2": {}}
    for word in word_list:
        try:
            ind = wv.get_index(word.lower())
            inds.append(ind)
            val1, val2 = proj_1[ind], proj_2[ind]
            #projs = (val1, val2)
            projs["dim_1"][word] = val1
            
            projs["dim_2"][word] = val2
        except Exception as e:
            continue
    projs = pd.DataFrame(projs)
    #return projs
    plt.style.use("ggplot")
    fig, ax = plt.subplots(figsize=(15, 10))
    ax.scatter(projs.loc[:, "dim_1"], projs.loc[:, "dim_2"])
    #ax = projs.plot(x="dim_1", y="dim_2", kind="scatter")
    ax.set_xlabel(p1_label)
    ax.set_ylabel(p2_label)
    for idx, row in projs.iterrows():
        ax.annotate(text=row.name, xy=(row["dim_1"], row["dim_2"]), xytext= (3,-8), textcoords="offset points" )
    plt.savefig(title, format="png")

def wiki2words(page):
    words = wikipedia.page(page).links
    words_1gram = []
    for word in words:
        spl = word.split()
        if len(spl) > 1:
            continue
        else: 
            words_1gram.append(word)
    return words_1gram

def uni_tagger(word, multiple=False):
    return nltk.pos_tag([word])[0][1]
    return unitagger.tag([word])[0][1]

def wn_tagger(word, multiple=True):
    if multiple==True:
        poses = list(set([syn.pos() for syn in wn.synsets(word)]))
        return poses
    return wn.synsets(word)[0].pos()

def most_similar_tag(word, wv, tagger, dim=False, topn=100, selectn=10, select=False): 
    '''Finds most similar words and splits them according to tag, returning dict of tag: [list of words],
    select can be defined so as to only return certain word types'''
    #FIX: ADD MULTIPLE WORD TYPES - if multiple word meanings, add to al lists
    if dim == True:
        pos = []
        neg = []
        not_pres = []
        for x in word[0]:
            try:
                w = wv[x]
                pos.append(x)
            except:
                not_pres.append(x)
        for x in word[1]:
            try:
                w = wv[x]
                neg.append(x)
            except:
                not_pres.append(x)
        lst = wv.most_similar(positive=pos, negative = neg, topn=topn)
    else: 
        lst =  wv.most_similar(positive=[word], topn=topn)
    tags = {}
    for el in lst:
        #print(el[0])
        try:
            tgs = tagger(el[0], multiple=True)
        except Exception as e:
            print(e)
            #print("Word untaggable!")
            tgs = [None]
        for tg in tgs:
            try:
                tags[tg].append(el[0])
            except:
                tags[tg] = [el[0]]
    if select:
        try: 
            words = [v for k,v in tags.items() if k == select][0]
        except: 
            words = []
        
    else:
        words = []
        for k,v in tags.items():
            words += v
        #tags = {k:v for k,v in tags.items() if k == select}
    try:
            words = words[:selectn]
    except Exception as e:
        print(e)
        pass
    if not dim:
        #print("Words not present in embeddings:", not_pres)
        pass
    return words

def most_similar_wlist(word, wv, word_list, dim=False, topn=100, selectn=10): 
    '''Finds all most similar words that are within a defined list.
    Input: word= 2-tuple of lists (pos, neg) if wanting dimension (dim=True), else one word.
    topn = top n similar words, selectn = amount of top words returned
    returns list of tuples of (word, similarity score)'''
    #print(f"5 most similar to {w1}: ", wv.most_similar(positive=[word], topn=n))
    if dim == True:
        pos = []
        neg = []
        not_pres = []
        for x in word[0]:
            try:
                wv = wv[x]
                pos.append(x)
            except:
                not_pres.append(x)
        for x in word[1]:
            try:
                wv = wv[x]
                neg.append(x)
            except:
                not_pres.append(x)
                
        lst = wv.most_similar(positive=pos, negative = neg, topn=topn)
    else: 
        lst =  wv.most_similar(positive=[word], topn=topn)
    words = []
    for el in lst:
        #print(el[0])
        if el[0] in word_list:
            words.append(el)
    try:
        words = words[:total_n]
    except:
        pass
    #print("Words not present in embeddings:", not_pres)
    return words

def measure_word_space(wv, norm_matrix, word_list): 
    for i, word in enumerate(word_list):
        vec = wv[word].reshape(1,300)
        if i == 0:
            mat = vec
            continue
        mat = np.vstack((mat, vec))
    norms = []
    for row in mat:
        reshape = row.reshape(1,300)
        distances = mat-reshape
        norm = np.linalg.norm(np.mean(distances, axis=0))
        norms.append(norm)
    return np.mean(norms)

def stereotype_through_time(wvs, word, word_list, type="tag", select="JJ", selectn=10, topn= 100): #INCOMPLETE
    '''wvs is an ordered dict, domain_list is a list of words, type is type of tagging, 
    select is specifics of tag'''
    stereotypes = {decade: {} for decade, wv in wvs.items()}
    if type == "tag":
        df = {}
        for decade, wv in wvs.items():
            df[decade] = {i: "" for i in range(selectn)}
            sims = most_similar_tag(word, wv, uni_tagger, topn=100, selectn=selectn, select=select)
            for i,sim in enumerate(sims):  
                df[decade][i] = sim
    else:
        df= {}
        for decade, wv in wvs.items():
            df[decade] = {i: "" for i in range(selectn)}
            sims = most_similar_wlist(word, wv, word_list, topn=100, selectn=selectn)
            for i,sim in enumerate(sims):  
                df[decade][i] = sim[0]
    df = pd.DataFrame(df)
    return df

def get_most_similar(wv, norm_matrix, word):
    vocab = wv.index_to_key
    distance_vecs = norm_matrix - np.array(wv[word]).reshape(1,300)
    norms = np.linalg.norm(distance_vecs, axis= 1)
    args = list(np.argsort(norms, axis=0))
    sorted_vocab = [(vocab[ind], norm_matrix[ind]) for ind in args]
    return sorted_vocab