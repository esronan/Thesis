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
import statistics
import plotly.express as px
import plotly.graph_objs as go
from sklearn.decomposition import PCA
from scipy.stats import pearsonr
import gensim.downloader as api
from nltk.corpus import stopwords
import scipy.stats as st
import random
from matplotlib import cm

def load_wv(fil, input_dir, kv=False):
    fil = input_dir + fil
    if kv==True:
        return KeyedVectors.load(fil)
    else:
        return gensim.models.Word2Vec.load(fil).wv

def load_wvs(fils, input_dir, kv=False):
    wvs = {}
    for decade, fil in fils.items():
        wv = load_wv(fil, input_dir, kv)
        wvs[decade] = wv
    return wvs

def load_domain_dic(fname):
    df = pd.read_excel(fname).T
    dic = {x[0]: [y for y in x[1:] if not pd.isna(y)] for x in df.itertuples(index=True)}
    return dic
    
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

def create_dim(wv, ant_df, print_miss=False, eval=False):
    dims = ant_df.shape
    diffs = []
    cols = ant_df.columns
    #print(f"Positive pole: {cols[0]}\nNegative pole: {cols[1]}")
    missing = []
    for i in range(dims[0]):
        try:
            pos = ant_df[ant_df.columns[-2]].iloc[i].lower()
            pos_wv = normify_vec(wv[pos])
        except Exception as e:
            missing.append(pos)
            continue
        try:
            neg = ant_df[ant_df.columns[-1]].iloc[i].lower()
            neg_wv = normify_vec(wv[neg])
        except Exception as e:
            missing.append(neg)
            continue
        #if method == "cos":
         #   diff = np.dot(pos_wv, neg_wv)/(np.linalg.norm(pos_wv)*np.linalg.norm(neg_wv))
        #elif method == "euclid":
        diff = pos_wv - neg_wv
        norm_diff = normify_vec(diff)
        diffs.append(diff)
    print("m", missing, "p", diffs)
    dimension = sum(diffs)/len(diffs)
    norm_dimension = normify_vec(dimension)
    #print(f"{missing} not present in vocab")
    if print_miss == True:
        print(f"No. antonyms: {len(diffs)}.\nNot present in vocab: {missing}")
    return norm_dimension

def create_dim_avg(wv, ant_df, print_miss=False, eval=False):
    dims = ant_df.shape
    diffs = []
    cols = ant_df.columns
    #print(f"Positive pole: {cols[0]}\nNegative pole: {cols[1]}")
    missing = []
    pos_list = []
    neg_list = []
    for i in range(dims[0]):
        try:
            pos = ant_df[ant_df.columns[-2]].iloc[i].lower()
            vec = wv[pos]
            pos_wv = normify_vec(vec)
            if not np.isnan(np.sum(pos_wv)):
                pos_list.append(pos_wv)
        except Exception as e:
            missing.append(pos)
        try:
            neg = ant_df[ant_df.columns[-1]].iloc[i].lower()
            vec = wv[neg]
            neg_wv = normify_vec(vec)
            if not np.isnan(np.sum(neg_wv)):
                neg_list.append(neg_wv)
        except Exception as e:
            missing.append(neg)  
    neg_mean = np.mean(np.array(neg_list), axis=0)
    pos_mean = np.mean(np.array(pos_list), axis=0)
    #print(len(neg_list), len(pos_list), missing)
    dimension = pos_mean - neg_mean
    norm_dimension = normify_vec(dimension)

    if print_miss == True:
        print(f"Length of (+): {len(pos_list)}. (-): {len(neg_list)}.\nNot present in vocab: {missing}")

    if eval == True:
        evals = {}
        evals["ant_dist"] = np.linalg.norm(dimension)
        #pos_dists = np.array(pos_list)-pos_mean
        #print("dists", pos_dists.shape)
        #n = np.linalg.norm(pos_dists, axis=1).shape
        #print("norms", n)
        evals["syn_dist"] = (np.mean(np.linalg.norm(np.array(pos_list)-pos_mean, axis=1)), np.mean(np.linalg.norm(np.array(neg_list)-neg_mean, axis=1)))
        return norm_dimension, evals

    return norm_dimension

def vector_angle(v1, v2):
    v1_norm = normify_vec(v1)
    v2_norm = normify_vec(v2)
    dot = np.dot(v1_norm, v2_norm)
    angle = np.arccos(dot)
    return angle

def normify_matrix(matrix):
    for i, row in enumerate(matrix):
        matrix[i] = row/np.linalg.norm(row)
    return matrix

def normify_vec(vec):
    return vec/(np.sqrt(np.nansum(np.square(vec))))
    return vec/np.linalg.norm(vec)

def proj_dim(dim, norm_matrix):
    return np.dot(norm_matrix, dim)

def chart_project(proj_1, p1_label, proj_2, p2_label, title, word_list, wv, dim_1_span, dim_2_span, show=True):
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

    ax.set_xlim(left=dim_1_span[0], right=dim_1_span[1])
    ax.set_ylim(bottom=dim_2_span[0], top=dim_2_span[1])
    ax.axvline(x=0, c="grey", label="x=0")
    ax.axhline(y=0, c="grey", label="y=0")

    for idx, row in projs.iterrows():
        ax.annotate(text=row.name, xy=(row["dim_1"], row["dim_2"]), xytext= (3,-8), textcoords="offset points" )
    plt.savefig(title, format="png")
    if show == False:
        plt.clf()

def corr_project_dict(proj_1, proj_2, title, domain_dic, wv):
    inds = []
    projs = {cat: {"dim_1": {}, "dim_2": {}} for cat in domain_dic.keys()}
    means = {cat: {"dim_1": [], "dim_2": []} for cat in domain_dic.keys()}
  #  means["General"] = {"dim_1": [0], "dim_2": [0]}
   # projs["General"] = {"dim_1": [0], "dim_2": [0]}

    for cat, lst in domain_dic.items():
        for word in lst:
            try:
                ind = wv.get_index(word.lower())
                inds.append(ind)
                val1, val2 = proj_1[ind], proj_2[ind]
                #projs = (val1, val2)
                if val1 != val1 or val2 != val2:
                    continue
                projs[cat]["dim_1"][word] = val1
                projs[cat]["dim_2"][word] = val2
                
            except Exception as e:
                continue
    dim_1_lst = []
    dim_2_lst = []
    for cat, dic in projs.items():
        df = pd.DataFrame(dic)
        print(cat)
        print(pearsonr(df.loc[:, "dim_1"], df.loc[:, "dim_2"]))
        dim_1_lst.extend(df.loc[:, "dim_1"])
        dim_2_lst.extend(df.loc[:, "dim_2"])
    print("Overall\n", pearsonr(dim_1_lst, dim_2_lst))      


def chart_project_dict(proj_1, p1_label, proj_2, p2_label, title, domain_dic, wv, dim_1_span, dim_2_span, show=True):
    inds = []
    projs = {cat: {"dim_1": {}, "dim_2": {}} for cat in domain_dic.keys()}
    means = {cat: {"dim_1": [], "dim_2": []} for cat in domain_dic.keys()}
  #  means["General"] = {"dim_1": [0], "dim_2": [0]}
   # projs["General"] = {"dim_1": [0], "dim_2": [0]}

    for cat, lst in domain_dic.items():
        for word in lst:
            try:
                ind = wv.get_index(word.lower())
                inds.append(ind)
                val1, val2 = proj_1[ind], proj_2[ind]
                means[cat]["dim_1"].append(val1)
                means[cat]["dim_2"].append(val2)
                #projs = (val1, val2)
                projs[cat]["dim_1"][word] = val1
                projs[cat]["dim_2"][word] = val2
                
            except Exception as e:
                continue
   
    for cat in means.keys():
        means[cat]["dim_1"] = statistics.mean(means[cat]["dim_1"])
        means[cat]["dim_2"] = statistics.mean(means[cat]["dim_2"])
    #means["General"]["dim_1"] = statistics.mean([means[cat]["dim_1"] for cat in means.keys() if cat != "General"])
    #means["General"]["dim_2"] = statistics.mean([means[cat]["dim_2"] for cat in means.keys() if cat != "General"])

    #return projs
    plt.style.use("ggplot")
    plt.rcParams["font.family"] = "Times New Roman"

    colours = cm.Dark2(np.linspace(0, 1, 7))
    #colours = {i: colour["color"] for i, colour in enumerate(plt.rcParams['axes.prop_cycle'])}
    #colours = ["red", "yellow", "blue", "orange", "green", "purple", "teal", "#CD9575", "#665D1E", "#915C83", "#841B2D", "#C46210", "#9966CC", "#0D98BA", "#4D1A7F", "#003153"]
    fig, ax = plt.subplots(figsize=((6.062958350629584, 3.747114333064086)))
    ax.set_xlabel(p1_label)
    ax.set_ylabel(p2_label)
    ax.set_xlim(left=dim_1_span[0], right=dim_1_span[1])
    ax.set_ylim(bottom=dim_2_span[0], top=dim_2_span[1])
    ax.axvline(x=0, c="grey")#, label="x=0")
    ax.axhline(y=0, c="grey")#, label="y=0")
    #ax.axvline(x=means["General"]["dim_1"], c="silver")#, label="x=0")
    #ax.axhline(y=means["General"]["dim_2"], c="silver")#, label="y=0")
    ax
    i = 0
    for cat, dic in projs.items():
        ax.scatter(means[cat]["dim_1"], means[cat]["dim_2"], marker = "o", s=150, color = colours[i])
        ax.annotate(text= "Mean: " + cat, xy=(means[cat]["dim_1"], means[cat]["dim_2"]),
                    xytext= (3,-8), textcoords="offset points" )
        df = pd.DataFrame(dic)
        ax.scatter(df.loc[:, "dim_1"], df.loc[:, "dim_2"], label=cat, s=50, marker="o", alpha= 0.8, color=colours[i])
        for idx, row in df.iterrows():
                ax.annotate(text=row.name.capitalize(), xy=(row["dim_1"], row["dim_2"]), xytext= (3,-8), textcoords="offset points" )
        i += 1
    ax.legend()
    plt.savefig(title, format="png")
    if show == False:
        plt.clf()

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

def most_similar_tag(word, wv, tagger, inc_val=False, dim=False, topn=100, selectn=10, select=False): 
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
            if inc_val:
                try:
                    tags[tg].append(el)
                except:
                    tags[tg] = [el]
            else:
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

def most_similar_wlist(word, wv, word_list, inc_val=False, dim=False, topn=100, selectn=10): 
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
        if word_list:
            if el[0] not in word_list:
                continue
        if inc_val==True:
            words.append(el)
        else:   
            words.append(el[0])
    try:
        words = words[:selectn]
    except Exception as e:
        pass
    #print("Words not present in embeddings:", not_pres)
    return words

def measure_word_space(wv, norm_matrix, word_list): 
    #measure the contraction or expansion of a word space, this does one word embedding space at a time
    for i, word in enumerate(word_list):
        try:
            vec = wv[word.lower()].reshape(1,300)
        except:
            continue
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

def stereotype_through_time(wvs, word, word_list, type="tag", inc_val=False, select="JJ", selectn=10, topn= 100): #INCOMPLETE
    '''wvs is an ordered dict, domain_list is a list of words, type is type of tagging, 
    select is specifics of tag'''
    stereotypes = {decade: {} for decade, wv in wvs.items()}
    if type == "tag":
        df = {}
        for decade, wv in wvs.items():
            df[decade] = {i: "" for i in range(selectn)}
            sims = most_similar_tag(word, wv, uni_tagger, topn=100, inc_val=inc_val, selectn=selectn, select=select)
            for i,sim in enumerate(sims):  
                df[decade][i] = sim
    else:
        df= {}
        for decade, wv in wvs.items():
            df[decade] = {i: "" for i in range(selectn)}
            sims = most_similar_wlist(word, wv, word_list, inc_val=inc_val, topn=100, selectn=selectn)
            for i,sim in enumerate(sims): 
                if inc_val==True: 
                    df[decade][i] = sim
                else:
                    df[decade][i] = sim[0]
    df = pd.DataFrame(df)
    return df

def get_most_similar(wv, norm_matrix, word):
    vocab = wv.index_to_key
    distance_vecs = norm_matrix - np.array(normify_vec(wv[word])).reshape(1,300)
    norms = np.linalg.norm(distance_vecs, axis= 1)
    args = list(np.argsort(norms, axis=0))
    sorted_vocab = [(vocab[ind], norm_matrix[ind]) for ind in args]
    return sorted_vocab

def aggregate_word_line_graph(class_obj, wlist): #Can also be used for a single word if that single word is a single element in a list
    wlist_projs  = {dim: {dec: [] for dec, wv in class_obj.wvs.items()} for dim in class_obj.dims}
    word_projs = {dim: {} for dim in class_obj.dims}
    for dec, wv in class_obj.wvs.items():
        for dim in class_obj.dims:
            for word in wlist: 
                try:
                    ind = wv.get_index(word.lower())
                except:
                    continue
                proj = class_obj.projs[dec][dim][ind]
                if pd.isna(proj):
                    continue
                wlist_projs[dim][dec].append(proj)
               # print(dec, dim, word, proj)
            wlist_projs[dim][dec] = np.mean(wlist_projs[dim][dec])
            try:
                ind = wv.get_index(word.lower())
            except:
                continue
            proj = class_obj.projs[dec][dim][ind]
            word_projs[dim][dec] = proj
    df = pd.DataFrame(wlist_projs)
    plt.style.use("ggplot")
    plt.rcParams["figure.figsize"] = (10,5)
    df.plot.line()

def polar_graph(class_obj, wlist): #Can also be used for a single word if that single word is a single element in a list
    wlist_projs  = {dim: {dec: [] for dec, wv in class_obj.wvs.items()} for dim in class_obj.dims}
    word_projs = {dim: {} for dim in class_obj.dims}
    for dec, wv in class_obj.wvs.items():
        for dim in class_obj.dims:
            for word in wlist: 
                ind = wv.get_index(word.lower())
                proj = class_obj.projs[dec][dim][ind]
                if pd.isna(proj):
                    continue
                wlist_projs[dim][dec].append(proj)
               # print(dec, dim, word, proj)
            wlist_projs[dim][dec] = np.mean(wlist_projs[dim][dec])
            ind = wv.get_index(word.lower())
            proj = class_obj.projs[dec][dim][ind]
            word_projs[dim][dec] = proj
    df = pd.DataFrame(wlist_projs)
    plt.style.use("ggplot")
    plt.rcParams["figure.figsize"] = (10,5)
    n = pd.DataFrame(df.stack()).reset_index()
    n.columns = ["Decade", "Dimension", "Projection"]
    px.line_polar(n, r="Projection", theta="Dimension", color="Decade", line_close=True,
                        color_discrete_sequence=px.colors.sequential.Plasma_r,
                        template="ggplot2")

def append_list(sim_words, words):
    #Code modified from original located at: https://towardsdatascience.com/visualizing-word-embedding-with-pca-and-t-sne-961a692509f5
    
    list_of_words = []
    
    for i in range(len(sim_words)):
        
        sim_words_list = list(sim_words[i])
        sim_words_list.append(words)
        sim_words_tuple = tuple(sim_words_list)
        list_of_words.append(sim_words_tuple)
        
    return list_of_words

def prep_vars(input_list):
    #Code modified from original located at: https://towardsdatascience.com/visualizing-word-embedding-with-pca-and-t-sne-961a692509f5

    input_word = ""
    for i,el in enumerate(input_list):
        input_word = input_word + el.lower()+ ","
    input_word = input_word[:-1] #delete last commar
    #input_word = "manager, 
    topn = 5
    user_input = [x.strip() for x in input_word.split(',')]
    result_word = []

    for words in user_input:

            sim_words = wv.most_similar(words.lower(), topn = topn)
            sim_words = append_list(sim_words, words)

            result_word.extend(sim_words)

    similar_word = [word[0] for word in result_word]
    similarity = [word[1] for word in result_word] 
    similar_word.extend(user_input)
    labels = [word[2] for word in result_word]
    label_dict = dict([(y,x+1) for x,y in enumerate(set(labels))])
    color_map = [label_dict[x] for x in labels]
    return similar_word, labels, label_dict, color_map

def display_pca_scatterplot_3D(model, user_input=None, words=None, label=None, color_map=None, similars=True, topns=5, sample=10):
    #Code modified from original located at: https://towardsdatascience.com/visualizing-word-embedding-with-pca-and-t-sne-961a692509f5

    if words == None:
        if sample > 0:
            words = np.random.choice(list(model.vocab.keys()), sample)
        else:
            words = [ word for word in model.vocab ]

    word_vectors = []
    for w in words:
        try:
            word_vectors.append(model[w.lower()])
        except:
            pass
    word_vectors = np.array(word_vectors)
    #word_vectors = np.array([model[w.lower()] for w in words])
    
    three_dim = PCA(random_state=0).fit_transform(word_vectors)[:,:3]
    
    if similars:
        topns = [topns for i in range(len(user_input))]
        
        

    data = []
    count = 0
    means = []
    
    for i in range (len(user_input)):
                if not similars:
                    topn = topns[i]
                trace = go.Scatter3d(
                    x = three_dim[count:count+topn,0], 
                    y = three_dim[count:count+topn,1],  
                    z = three_dim[count:count+topn,2],
                    text = words[count:count+topn],
                    name = user_input[i],
                    textposition = "top center",
                    textfont_size = 20,
                    mode = 'markers+text',
                    marker = {
                        'size': 10,
                        'opacity': 0.8,
                        'color': 2
                    }
       
                )
                means.append((np.mean(three_dim[count:count+topn], axis=0)))
                # For 2D, instead of using go.Scatter3d, we need to use go.Scatter and delete the z variable. Also, instead of using
                # variable three_dim, use the variable that we have declared earlier (e.g two_dim)
            
                data.append(trace)
                count = count+topns[i]
    means=np.array(means)
    if similars:
        trace_input = go.Scatter3d(
                        x = three_dim[count:,0], 
                        y = three_dim[count:,1],  
                        z = three_dim[count:,2],
                        text = words[count:],
                        name = 'input words',
                        textposition = "top center",
                        textfont_size = 20,
                        mode = 'markers+text',
                        marker = {
                            'size': 10,
                            'opacity': 1,
                            'color': 'black'
                        }
                        )
    else:
        trace_input = go.Scatter3d(
                        x = means[:,0], 
                        y = means[:,1], 
                        z = means[:,2],
                        text = words[count:],
                        name = 'Means',
                        textposition = "top center",
                        textfont_size = 20,
                        mode = 'markers+text',
                        marker = {
                            'size': 10,
                            'opacity': 1,
                            'color': 'black'
                        }
                        )
        

    # For 2D, instead of using go.Scatter3d, we need to use go.Scatter and delete the z variable.  Also, instead of using
    # variable three_dim, use the variable that we have declared earlier (e.g two_dim)
            
        data.append(trace_input)
    
# Configure the layout

    layout = go.Layout(
        margin = {'l': 0, 'r': 0, 'b': 0, 't': 0},
        showlegend=True,
        legend=dict(
        x=1,
        y=0.5,
        font=dict(
            family="Courier New",
            size=10,
            color="black"
        )),
        font = dict(
            family = " Courier New ",
            size = 8),
        autosize = False,
        width = 1000,
        height = 800
        )
    plot_figure = go.Figure(data = data, layout = layout)
    plot_figure.show()

def display_pca_scatterplot_2D(model, user_input=None, words=None, label=None, color_map=None, similars=True, topns=5, sample=10):
    #Code modified from original located at: https://towardsdatascience.com/visualizing-word-embedding-with-pca-and-t-sne-961a692509f5

    if words == None:
        if sample > 0:
            words = np.random.choice(list(model.vocab.keys()), sample)
        else:
            words = [ word for word in model.vocab ]
    
    word_vectors = []
    for w in words:
        try:
            word_vectors.append(model[w.lower()])
        except:
            pass
    word_vectors = np.array(word_vectors)
    #word_vectors = np.array([model[w.lower()] for w in words])
    
    three_dim = PCA(random_state=0).fit_transform(word_vectors)[:,:2]
    
    if similars:
        topns = [topns for i in range(len(user_input))]
        
        

    data = []
    count = 0
    means = []
    
    for i in range (len(user_input)):
                if not similars:
                    topn = topns[i]

                trace = go.Scatter(
                    x = three_dim[count:count+topn,0], 
                    y = three_dim[count:count+topn,1],  
                    text = words[count:count+topn],
                    name = user_input[i],
                    textposition = "top center",
                    textfont_size = 10,
                    mode = 'markers+text',
                    marker = {
                        'size': 10,
                        'opacity': 0.8,
                        'color': 2
                    }
       
                )
                means.append((np.mean(three_dim[count:count+topn], axis=0)))
                # For 2D, instead of using go.Scatter3d, we need to use go.Scatter and delete the z variable. Also, instead of using
                # variable three_dim, use the variable that we have declared earlier (e.g two_dim)
            
                data.append(trace)
                count = count+topns[i]
    means=np.array(means)
    if similars:
        trace_input = go.Scatter(
                        x = three_dim[count:,0], 
                        y = three_dim[count:,1],  
                        text = words[count:],
                        name = 'input words',
                        textposition = "top center",
                        textfont_size = 10,
                        mode = 'markers+text',
                        marker = {
                            'size': 10,
                            'opacity': 1,
                            'color': 'black'
                        }
                        )
    else:
        trace_input = go.Scatter(
                        x = means[:,0], 
                        y = means[:,1], 
                        text = words[count:],
                        name = 'Means',
                        textposition = "top center",
                        textfont_size = 10,
                        mode = 'markers+text',
                        marker = {
                            'size': 10,
                            'opacity': 1,
                            'color': 'black'
                        }
                        )

    # For 2D, instead of using go.Scatter3d, we need to use go.Scatter and delete the z variable.  Also, instead of using
    # variable three_dim, use the variable that we have declared earlier (e.g two_dim)
            
        data.append(trace_input)
    
# Configure the layout

    layout = go.Layout(
        margin = {'l': 0, 'r': 0, 'b': 0, 't': 0},
        showlegend=True,
        legend=dict(
        x=1,
        y=0.5,
        font=dict(
            family="Courier New",
            size=10, #originally 25
            color="black"
        )),
        font = dict(
            family = " Courier New ",
            size = 8), #originally 15
        autosize = False,
        width = 1000, #originally 1000x 1000
        height = 800
        )
    plot_figure = go.Figure(data = data, layout = layout)
    plot_figure.show()

def polar_chart(iter_obj, wlist):
    wlist_projs  = {dim: {dec: [] for dec, wv in iter_obj.wvs.items()} for dim in iter_obj.dims}
    word_projs = {dim: {} for dim in iter_obj.dims}
    for dec, wv in iter_obj.wvs.items():
        for dim in iter_obj.dims:
            for word in wlist: 
                ind = wv.get_index(word.lower())
                proj = iter_obj.projs[dec][dim][ind]
                if pd.isna(proj):
                    continue
                wlist_projs[dim][dec].append(proj)
               # print(dec, dim, word, proj)
            wlist_projs[dim][dec] = np.mean(wlist_projs[dim][dec])
            ind = wv.get_index(word.lower())
            proj = iter_obj.projs[dec][dim][ind]
            word_projs[dim][dec] = proj
    df = pd.DataFrame(wlist_projs)
    plt.style.use("ggplot")
    plt.rcParams["figure.figsize"] = (10,5)
    df.plot.line()
    df.unstack()
    n = pd.DataFrame(df.stack()).reset_index()
    n.columns = ["Decade", "Dimension", "Projection"]
    px.line_polar(n, r="Projection", theta="Dimension", color="Decade", line_close=True,
                        color_discrete_sequence=px.colors.sequential.Plasma_r,
                        template="ggplot2",)



class AllDecsIterator():
    def __init__(self, coll, dims, kv, test=False):
        self.coll = coll
        self.dims = dims
        self.stereotypes = {}
        self.test=test
        self.kv = kv
        
    def iterate(self):
        self.input_dir = f"D:/google_ngrams/vectors/{self.coll}/"
        decades_dict = OrderedDict()
        if self.test == True:
            rng = 2
        else: 
            rng = 10
        for i in range(rng):
            decades_dict[str(1900+10*i)] = str(1900+10*i)+'_model'
        self.wvs = load_wvs(decades_dict, self.input_dir, kv=self.kv)
        self.ants = {dec : {} for dec, val in self.wvs.items()}
        self.projs = {dec : {} for dec, val in self.wvs.items()}
        self.dim_vecs = {dec : {} for dec, val in self.wvs.items()}
        self.angles = {dec : {} for dec, val in self.wvs.items()}
        self.norm_matrix = {dec : {} for dec, val in self.wvs.items()}
        self.stereotypes = {dec : {} for dec, val in self.wvs.items()}
        
        for dec, wv in self.wvs.items():
            matrix = wv.get_normed_vectors()
            self.norm_matrix[dec] = normify_matrix(matrix)

            for dim in self.dims:
                self.ants[dec][dim] = pd.read_csv(f"G:/My Drive/KU/Thesis/data/word_pairs/{dim}_antonyms_goc.csv", header = 0, names = ("pos_ant", "neg_ant"))
                self.ants[dec][dim] = self.ants[dec][dim].rename(columns= {"pos_ant":self.ants[dec][dim].iloc[0,0],"neg_ant":self.ants[dec][dim].iloc[0,1]})
                self.dim_vecs[dec][dim] = create_dim_avg(wv, self.ants[dec][dim])
                self.projs[dec][dim] = proj_dim(self.dim_vecs[dec][dim], self.norm_matrix[dec])
               # print(dec, dim, self.projs[dec][dim])
            
            #Calculate angles between dimensions per decade
            self.angles[dec] = {dim : {} for dim in self.dims}
            for dim1 in self.dims:
                for dim2 in self.dims:
                    angle = vector_angle(self.dim_vecs[dec][dim1], self.dim_vecs[dec][dim2])
                    self.angles[dec][dim1][dim2] = angle
            self.angles[dec] = pd.DataFrame(self.angles[dec])
    
    def stability_through_time(self, n=50):
        '''Retuns dictionary of dictionaries that shows the difference the average of
        the distances between each stop word for each decade'''
        
        print("Calculating stability through time...")
        words = ["f_words", "rand_words"]
        w_lists = {}
        
        w_lists["f_words"] =  stopwords.words('english')
        self.vocab_size = self.norm_matrix["1900"].shape[0]
        rand_inds = [random.randint(0, self.vocab_size) for i in range(n)]
        rand_words = [self.wvs["1900"].index_to_key[ind] for ind in rand_inds]
        w_lists["rand_words"] = []
        for word in rand_words:
            for dec, wv in self.wvs.items():
                try:
                    vec = wv[word]
                except:
                    break
            w_lists["rand_words"].append(word)
        
        dists = {}
        avg_dists = {}
        diffs = {}
        for w_list in words:
            dists[w_list] = {}
            avg_dists[w_list] = {}
            for dec, wv in self.wvs.items():
                dists[w_list][dec] = {}
                for i, fword_1 in enumerate(w_lists[w_list]):
                    dists[w_list][dec][fword_1] = {}
                    for fword_2 in w_lists[w_list][i:]:
                        try:
                            wv_1, wv_2 = wv[fword_1], wv[fword_2]
                            dist = np.linalg.norm(wv_1 - wv_2)
                            dists[w_list][dec][fword_1][fword_2] = dist
                        except:
                            continue
                #avg_dists[dec] = np.mean(dists[dec].values)
            diffs[w_list] = {dec: {} for dec, wv in self.wvs.items()}
            for dec_1, wv in self.wvs.items():
                for dec_2, wv in self.wvs.items():
                    diffs[w_list][dec_1][dec_2] = []
                    for i, fword_1 in enumerate(w_lists[w_list]):
                        for fword_2 in w_lists[w_list][i:]:
                            try:
                                diffs[w_list][dec_1][dec_2].append(abs(dists[w_list][dec_2][fword_1][fword_2] - dists[w_list][dec_1][fword_1][fword_2]))
                            except:
                                continue
                    data = diffs[w_list][dec_1][dec_2]
                    diffs[w_list][dec_1][dec_2] = (round(np.mean(data),3), [round(a,3) for a in st.t.interval(alpha=0.95, df=len(data)-1, loc=np.mean(data), scale=st.sem(data))])
        #df = pd.DataFrame()
        diffs["f_words"] = diffs["f_words"]["1900"]
        diffs["rand_words"] = diffs["rand_words"]["1900"]
        return pd.DataFrame(diffs) 
    
    def avg_distance(self, n=50): #e.g. self.norm_matrix["decade"]
        print("Calculating average distance...")
        self.dists = {dec:[] for dec, wv in self.wvs.items()}
        for dec, norm_matrix in self.norm_matrix.items():
            rand_inds = [random.randint(0, norm_matrix.shape[0]) for i in range(n)]
            for ind_1 in rand_inds:
                for ind_2 in rand_inds:
                    self.dists[dec].append(np.linalg.norm(norm_matrix[ind_1] - norm_matrix[ind_2]))
            self.dists[dec] = [el for el in self.dists[dec] if not pd.isna(el)]
            self.dists[dec] = statistics.mean(self.dists[dec])
        self.dists = pd.DataFrame(self.dists, index=["Mean distance"])
        return self.dists
             
    def stereotype_through_time(self, word, word_list=[], type="tag", inc_val=False, select="a", selectn=10, topn= 100): #INCOMPLETE
        '''wvs is an ordered dict, domain_list is a list of words, type is type of tagging, 
        select is specifics of tag'''
        self.stereotypes[word] = {}
        if type == "tag":
            df = {}
            for decade, wv in self.wvs.items():
                df[decade] = {i: "" for i in range(selectn)}
                sims = most_similar_tag(word, wv, wn_tagger, topn=topn, inc_val=inc_val, selectn=selectn, select=select)
                for i,sim in enumerate(sims):  
                    df[decade][i] = sim
        elif type == None: 
            df= {}
            for decade, wv in self.wvs.items():
                df[decade] = {i: "" for i in range(selectn)}
                sims = most_similar_wlist(word, wv, word_list=False, inc_val=inc_val, topn=topn, selectn=selectn)
                for i,sim in enumerate(sims): 
                    if inc_val==True: 
                        df[decade][i] = (sim[0], round(sim[1],3))
                    else:
                        df[decade][i] = sim[0]
        else:
            df= {}
            for decade, wv in self.wvs.items():
                df[decade] = {i: "" for i in range(selectn)}
                sims = most_similar_wlist(word, wv, word_list, inc_val=inc_val, topn=topn, selectn=selectn)
                for i,sim in enumerate(sims):  
                    if inc_val==True: 
                        df[decade][i] = (sim[0], round(sim[1],3))
                    else:
                        df[decade][i] = sim[0]
        df = pd.DataFrame(df)
        self.stereotypes[word] = df
    
    def word_charts_through_time(self, domain, domain_dic, dim_1, dim_2, dom_type="word_list", title=False):
        '''dims = list of two strings which refer to dimensions to be projected on'''
        try:
            os.makedirs(f"G:/My Drive/KU/Thesis/Outputs/Graphs/{domain}_{dim_1}_{dim_2}")
        except Exception as e:
            pass
        #Get stats on projections to align output graphs with one another
        data_projs = {dim_1: [], dim_2: []}
        stats = ["min", "max", "mean", "median", "variance", "dev"]
        chart_vals = {stat : {dim: 0 for dim in [dim_1, dim_2]} for stat in stats}
                      
        if dom_type == "word_dict":
              #  print(domain_dic[domain])
            word_list = [word for cat in domain_dic[domain].keys() for word in domain_dic[domain][cat]]
        else:
            word_list = [word for word in domain_dic[domain]]
                     
        for dim in [dim_1, dim_2]:
            for dec, wv in self.wvs.items():
                for word in word_list: 
                    try:
                        ind = wv.get_index(word.lower())
                        proj = self.projs[dec][dim][ind]
                        data_projs[dim].append(proj)
                    except Exception as e:
                        pass
                #data_projs[dim][dec] = [val for val in data_projs[dim][dec] if np.isnan(val)==False] 
                #chart_vals["min"][dim][dec] = min(data_projs[dim][dec])
                #chart_vals["max"][dim][dec] = max(data_projs[dim][dec])
                #chart_vals["median"][dim][dec] = statistics.median(data_projs[dim][dec])
                #chart_vals["mean"][dim][dec] = statistics.mean(data_projs[dim][dec])
                #chart_vals["variance"][dim][dec] = np.var(data_projs[dim][dec])
            df = data_projs
            chart_vals["min"][dim] = min(df[dim])
            chart_vals["max"][dim] = max(df[dim])
            chart_vals["median"][dim] = statistics.median(df[dim])
            chart_vals["mean"][dim] = statistics.mean(df[dim])
            chart_vals["variance"][dim] = np.var(df[dim])
        #Generate a chart for each decade
        for dec, wv in self.wvs.items():
            if not title:
                try:
                    os.mkdirs(f"G:/My Drive/KU/Thesis/Outputs/Graphs/{domain}_{dim_1}_{dim_2}/")
                except:
                    pass
                fname = f"G:/My Drive/KU/Thesis/Outputs/Graphs/{domain}_{dim_1}_{dim_2}/{self.coll}_{dec}.png"
            dim1_label = self.ants[dec][dim_1].columns[1] + " <------ " + dim_1 + " ------> " + self.ants[dec][dim_1].columns[0]
            dim2_label = self.ants[dec][dim_2].columns[1] + " <------ " + dim_2 + " ------> " + self.ants[dec][dim_2].columns[0]
            if dom_type == "word_dict":
                chart_project_dict(proj_1=self.projs[dec][dim_1], 
                                    p1_label=dim1_label, 
                                    proj_2=self.projs[dec][dim_2], 
                                    p2_label=dim2_label,
                                    title=fname, 
                                    domain_dic=domain_dic[domain], 
                                    wv=wv, 
                                    show=False,
                                    dim_1_span=(chart_vals["min"][dim_1],chart_vals["max"][dim_1]), 
                                    dim_2_span= (chart_vals["min"][dim_2],chart_vals["max"][dim_2]))
                                 #  dim_1_span=(chart_vals["min"][dim_1]["overall"],chart_vals["max"][dim_1]["overall"]), 
                                  #                 dim_2_span= (chart_vals["min"][dim_2]["overall"],chart_vals["max"][dim_2]["overall"]))
          
            else:
                chart_project(proj_1=self.projs[dec][dim_1], 
                                        p1_label=dim1_label, 
                                        proj_2=self.projs[dec][dim_2], 
                                        p2_label=dim2_label,
                                        title=fname, 
                                        word_list=domain_dic[domain], 
                                        wv=wv, 
                                        show=False,
                                       dim_1_span=(chart_vals["min"][dim_1],chart_vals["max"]), 
                                                   dim_2_span= (chart_vals["min"][dim_2],chart_vals["max"][dim_2]))
    def chart_iterate(self, dims, doms, domain_dic, dom_type):
        for i, dim_1 in enumerate(dims):
            for dim_2 in dims_of_interest[i+1:]:
                for domain, word_list in domain_dic.items():
                    if domain not in doms:
                        continue
                    print(f"Charting domain {domain} against dims ({dim_1} x {dim_2})")
                    self.word_charts_through_time(domain=domain, domain_dic=domain_dic, dom_type=dom_type, dim_1=dim_1, dim_2=dim_2, title=False)
                # print(f"{fname} SAVED")


class EvalEmbeddings():
    # self.evals to access evaluation scores
    def __init__(self, dir, files, kv, dl=False):
        self.fils = files
        self.dl = dl
        #Change directory
        os.chdir(dir)
        self.models = {}
        self.evals = {}
        self.kv = kv

    def load_wv(self, fil):
        #True for external models that need downloading
        if self.dl == False:
            #For if model stored in KeyedVectors format
            if self.kv == True:
                wv = KeyedVectors.load(fil)
                self.models[fil] = wv
                return wv
            #Normal word2vec format
            elif os.path.isfile(fil):
                model = gensim.models.Word2Vec.load(fil)
                self.models[fil] = model.wv
                return model.wv
            else: 
                print(f"{fil} embeddings do not exist!")
                return 0
        else: 
            print("Loading", fil, "...")
            model = api.load(fil)
            self.models[fil] = model
            print("Loading finished.")
            return model
    def save(self, fname):
        self.df = pd.DataFrame(self.evals)
        self.df.to_csv("G:/My Drive/KU/Thesis/outputs/evals/" + fname)
        
    def iterate(self, kv=False):
        for fil in self.fils:
            wv = self.load_wv(fil)
            if wv == 0: #load_wv returns wv if embeddings don't exist
                continue
            else: #create dic for decade
                self.eval_embed(fil)
        self.evals_df = pd.DataFrame(self.evals)
               
    def eval_embed(self, fil):
        self.evals[fil] = {}
        print(f"\n*****Starting evaluation for {fil}*****")
        
        # Evaluate one set of embeddings (for one decade) - scores stored under "analogy_score", and "word_pair_pearson/spearman"
        print("Starting analogy evaluation...")
        analog = self.models[fil].evaluate_word_analogies('C:/ProgramData/Anaconda3/Lib/site-packages/gensim/test/test_data/questions-words.txt')
        self.evals[fil]["analogy_score"] = analog[0]
        
        print("Starting word pair similarity evaluation...")
        #Evaluating similarity of word pairs compared with human assigned scores, check goldberg notes for other datasets
        word_pairs = self.models[fil].evaluate_word_pairs('C:/ProgramData/Anaconda3/Lib/site-packages/gensim/test/test_data/wordsim353.tsv')
        self.evals[fil]["word_pair_pearson"]= word_pairs[0][0]#tuple with correlation score & 2-tailed p-value
        self.evals[fil]["word_pair_pearson_p_value"]  = word_pairs[0][1]
        
        self.evals[fil]["word_pair_spearman"]= word_pairs[1][0]
        self.evals[fil]["word_pair_spearman_p_value"] = word_pairs[1][1]
        
        #Evaluating against surveys
        print("Starting survey evaluation...")
        self.evals[fil] =  self.evals[fil] | self.corr_survey(fil)
        
        print(f"{fil} embeddings evaluated.\n")
    
    def create_dim(self, model, df):
        dims = []
        for row in df.iterrows():
            cols = df.columns
            pos = self.models[model].get_vector(cols[0], norm=True)
            neg = self.models[model].get_vector(cols[1], norm=True)
            dim = pos - neg
            dims.append(dim)
        final_dim = np.mean(np.array(dims), axis = 0)
        return final_dim

    def proj_dim(self, model, dim):
        embed = self.models[model].get_normed_vectors()
        proj = np.dot(embed, dim)
        return proj
    
    def corr_gss(self, model,table=False):
        survey = pd.read_csv(f"G:/My Drive/KU/Thesis/data/survey_data/gss_averages.csv", index_col = "capital")
        music_genres_conv = {"bigband": "big-band","blugrass": "bluegrass", "country": "country", "blues": "blues", "musicals": "musicals", "classicl": "classical", "folk": "folk", "gospel": "gospel", "jazz": "jazz", "latin": ["salsa", "samba", "bachata", "kilomba", "tango", "rumba", "bolero"], "moodeasy": "easy-listening", "newage": ["new-age", "newage"], "opera": "opera", "rap": "rap", "reggae": "reggae", "conrock": "rock", "oldies": "oldies", "hvymetal": "heavy-metal"}
        music_genres_conv = {"bigband": "big-band","blugrass": "bluegrass", "country": "country", "blues": "blues", "musicals": "musicals", "classicl": "classical", "folk": "folk", "gospel": "gospel", "jazz": "jazz", "latin": "salsa", "moodeasy": "easy-listening", "newage": "new-age", "opera": "opera", "rap": "rap", "reggae": "reggae", "conrock": "rock", "oldies": "oldies", "hvymetal": "heavy-metal"}
        music_genres = {v: k for k, v  in music_genres_conv.items()}
        activities_conv = {"attsprts":"sports", "visitart":"art", "makeart":"art", "autorace":"autosport", "camping":"camping", "garden":"gardening", "dance":["dancing","dance"], "gomusic":["concert", "gig"],"huntfish":["hunting","fishing"], "perform":[], "dosports":["sports", "sport"], "seemovie":[], "usevcr":[], "plymusic":[], "readfict":"reading", "popmusic":"pop", "drama":[], "relart":[], "volarts":[]}
        activities_conv = {"attsprts":"sports", "visitart":"art", "makeart":"art", "autorace":"autosport", "camping":"camping", "garden":"gardening", "dance":"dancing", "gomusic":"concert","huntfish":"fishing", "dosports":"sports", "seemovie":[], "usevcr":[], "plymusic":[], "readfict":"reading", "popmusic":"pop", "drama":[], "relart":[], "volarts":[]}
        activities = {v: k for k, v in activities_conv.items() if type(v) != list}
        capitals = {"educ":"education", "prestg80":"status", "rincome":"affluence", "educ":"cultivation"}#, "class":"affluence"}#, "class"]
        cats = capitals.values()
        capitals = {v: k for k, v in capitals.items()}
        domains = {"music":music_genres_conv, "activities": activities_conv}

        
        vals = {domain: {} for domain in domains.keys()}
        self.vals = {}
        ant_pairs = {}
        projs = {}
        dims = {}
        embed = self.models[model]
        print(survey.columns)
        for domain, dic in domains.items():
            for cat in cats:
                ant_pairs[cat] = pd.read_csv(f"G:/My Drive/KU/Thesis/data/word_pairs/{cat}_antonyms_goc.csv", header = None, names = ("pos_ant", "neg_ant"))
                ant_pairs[cat] = ant_pairs[cat].rename(columns= {"pos_ant":ant_pairs[cat].iloc[0,0],"neg_ant":ant_pairs[cat].iloc[0,1]})
                #prepare dictionaries for survey & projection values
                vals[domain][cat + "_survey"] = {}
                vals[domain][cat + "_proj"] = {}
                #calculate dimensions from antonym pairs
                dims[cat] = create_dim_avg(embed, ant_pairs[cat])
                #project embeddings onto dimension
                projs[cat] = self.proj_dim(model, dims[cat])
                #iterate through words
                not_in_vocab = []
                for index, row in survey.iterrows():
                    #print(row.name)
                    try:
                        word = dic[row.name].lower()
                        #print(word)
                        #retrieve index in embeddings
                        ind = embed.get_index(word)
                        #retrieve projected value using index
                        val = projs[cat][ind]
                        #add all to DF
                        vals[domain][cat + "_survey"][word] = row[capitals[cat] + "_mean"]
                        vals[domain][cat + "_proj"][word] = val
                    except Exception as e:
                        pass
                       # print(e)
                        #not_in_vocab.append(word)

                #print(f"{not_in_vocab} not in embeddings vocab!")
            self.vals[domain] = pd.DataFrame(vals[domain])
        corrs = {}
        table_corrs = {}
        for domain in domains.keys():
            table_corrs[domain.title()] = {}
            for cat in cats:
          #  print(self.vals[cat + "_survey"], self.vals[cat + "_proj"])
                corrs[domain + "_" + cat + "_survey_corr"] = pearsonr(self.vals[domain][cat + "_survey"], self.vals[domain][cat + "_proj"])
                pear = pearsonr(self.vals[domain][cat + "_survey"], self.vals[domain][cat + "_proj"])
                v = round(pear[0],3)
                if pear[1] < 0.001:
                    v = str(v) + "***"
                if pear[1] < 0.01:
                    v = str(v) + "**"
                if pear[1] < 0.05:
                    v = str(v) + "*"
                else:
                    v = str(v)
                if cat == "activities":
                    cat = "leisure"
                table_corrs[domain.title()][cat.title()] = v
            #corrs[cat + "_survey_corr"] = self.vals[[cat + "_survey", cat + "_proj"]].corr(method="pearson").iloc[0,1]
        if table:
            return table_corrs
        return corrs
        
    def corr_gbcs(self, model, table=False):
        survey = pd.read_csv("G:/My Drive/KU/Thesis/data/survey_data/gbcs_averages.csv", index_col = 0)
        activities_conv = {"carts":"gallery", "cbingo":"bingo", "csportw":"sport", "ctheatre":"theatre", 
                "copera":"opera", "cdance":"dance","cmags":"magazine", "cdiy":"diy", 
                "pub":"pub", "cclassic":"classical", "cshopping":"shopping", "cresta":"restaurant",
                "ctv":["tv", "television"], "cbooks":"reading", "cgig":"gig"}
        music_conv = {"mreggae":"reggae", "mjazz":"jazz", "mpop":"pop", "mfolk":"folk",
             "mclassic":"classical"}#, "mrock":"rock", "mcountry":"country" "mmetal":"metal","
        domains = {"activities":activities_conv, "music": music_conv}                                   
        activities = {v: k for k, v in activities_conv.items() if type(v) != list}
        capitals = {"hhincome": "affluence", "educ":"education", "chigh":"cultivation"}
        music_genres = {v: k for k, v  in music_conv.items()}
        cats = capitals.values()
        capitals = {v: k for k, v in capitals.items()}

        ant_pairs = {}
        vals = {domain: {} for domain in domains.keys()}
        projs = {}
        dims = {}
        embed = self.models[model]
        self.vals = {}

        for domain, dic in domains.items():
            for cat in cats:
                #print(domain, cat)
                ant_pairs[cat] = pd.read_csv(f"G:/My Drive/KU/Thesis/data/word_pairs/{cat}_antonyms_goc.csv", header = None, names = ("pos_ant", "neg_ant"))
                ant_pairs[cat] = ant_pairs[cat].rename(columns= {"pos_ant":ant_pairs[cat].iloc[0,0],"neg_ant":ant_pairs[cat].iloc[0,1]})
                #prepare dictionaries for survey & projection values
                vals[domain][cat + "_survey"] = {}
                vals[domain][cat + "_proj"] = {}
                #calculate dimensions from antonym pairs
                dims[cat] = create_dim_avg(embed, ant_pairs[cat])
                #project embeddings onto dimension
                projs[cat] = self.proj_dim(model, dims[cat])
                #iterate through words
                not_in_vocab = []
                for index, row in survey.iterrows():
                    #print(index, row)
                    try:
                        word = dic[row.name].lower()
                        #print(word)
                        #retrieve index in embeddings
                        ind = embed.get_index(word)
                        #retrieve projected value using index
                        val = projs[cat][ind]
                        #add all to DF
                        vals[domain][cat + "_survey"][word] = row[capitals[cat] + "_mean"]
                        vals[domain][cat + "_proj"][word] = val
                    except Exception as e:
                        pass
                        #not_in_vocab.append(word)

             #   print(f"{not_in_vocab} not in embeddings vocab!")
            self.vals[domain] = pd.DataFrame(vals[domain])
        corrs = {}
        table_corrs = {}
        for domain, dic in domains.items():
            table_corrs[domain.title()] = {}
            for cat in cats:
               # print(self.vals[domain][cat + "_survey"], self.vals[domain][cat + "_proj"])
                corrs[domain + "_" + cat + "_survey_corr"] = pearsonr(self.vals[domain][cat + "_survey"], self.vals[domain][cat + "_proj"])
                #corrs[cat + "_survey_corr"] = self.vals[[cat + "_survey", cat + "_proj"]].corr(method="pearson").iloc[0,1]
                pear = pearsonr(self.vals[domain][cat + "_survey"], self.vals[domain][cat + "_proj"])
                v = round(pear[0],3)
                if pear[1] < 0.001:
                    v = str(v) + "***"
                if pear[1] < 0.01:
                    v = str(v) + "**"
                if pear[1] < 0.05:
                    v = str(v) + "*"
                else:
                    v = str(v)
                if cat == "activities":
                    cat = "leisure"
                table_corrs[domain.title()][cat.title()] = v
            #corrs[cat + "_survey_corr"] = self.vals[[cat + "_survey", cat + "_proj"]].corr(method="pearson").iloc[0,1]
        if table:
            return table_corrs
        return corrs

    def corr_census(self, model, labels="words", outliers=[], table=False):
        survey = pd.read_csv("G:/My Drive/KU/Thesis/data/us_census/census_1990_OCC1950.csv", index_col = 0)
        occ_map = pd.read_csv("G:/My Drive/KU/Thesis/data/garg/occupation_map.csv", index_col="Occupation, 1950 basis").to_dict()["Single words"]
                           
        occs = {v: k for k, v in occ_map.items() if type(v) != list}
        capitals = {"EDUC":"Education", "PRESGL":"Status", "INCTOT":"Affluence"}
        cats = capitals.values()
        capitals = {v: k for k, v in capitals.items()}

        ant_pairs = {}
        vals = {}
        projs = {}
        dims = {}
        embed = self.models[model]
        self.vals = {}

        for cat in cats:
            #print(domain, cat)
            ant_pairs[cat] = pd.read_csv(f"G:/My Drive/KU/Thesis/data/word_pairs/{cat}_antonyms_goc.csv", header = None, names = ("pos_ant", "neg_ant"))
            ant_pairs[cat] = ant_pairs[cat].rename(columns= {"pos_ant":ant_pairs[cat].iloc[0,0],"neg_ant":ant_pairs[cat].iloc[0,1]})
            #prepare dictionaries for survey & projection values
            vals[cat + "_survey"] = {}
            vals[cat + "_proj"] = {}
            #calculate dimensions from antonym pairs
            dims[cat] = create_dim_avg(embed, ant_pairs[cat])
            #project embeddings onto dimension
            projs[cat] = self.proj_dim(model, dims[cat])
            #iterate through words
            not_in_vocab = []
            nan = False
            for index, row in survey.iterrows():
                #print(index, row)
                try:
                    if row.name in outliers:
                        continue
                    #print( occ_map[row.name])
                    occ_spl = occ_map[row.name].lower().split()
                #    print(occ_spl)
                    w_projs = []
                    for w in occ_spl:
                        if w == "nan":
                            continue
                        if w[-1] == ",":
                            w = w[:-1]
                        try:
                            ind = embed.get_index(w)
                            proj = projs[cat][ind]
                        except: 
                            continue
                        if proj != proj:
                            continue
                        w_projs.append(proj)
                    #    print(row.name, w_projs)
                        val = np.mean(w_projs)
                        #add all to DF
                        if labels == "words":
                            label =  occ_map[row.name].title()
                        else:
                            label =  row.name
                        vals[cat + "_survey"][label] = row[capitals[cat] + "_mean"]
                        vals[cat + "_proj"][label] = val
                except Exception as e:
                    pass
                    #print(e)
                    #not_in_vocab.append(word)

         #   print(f"{not_in_vocab} not in embeddings vocab!")
        self.vals = pd.DataFrame(vals)
        corrs = {}
        table_corrs = {}
        for cat in cats:
           # print(self.vals[domain][cat + "_survey"], self.vals[domain][cat + "_proj"])
           # print(self.vals[cat + "_survey"], self.vals[cat + "_proj"])
            corrs[cat + "_survey_corr"] = pearsonr(self.vals[cat + "_survey"], self.vals[cat + "_proj"])
            pear = pearsonr(self.vals[cat + "_survey"], self.vals[cat + "_proj"])
            v = round(pear[0],3)
            if pear[1] < 0.001:
                v = str(v) + "***"
            elif pear[1] < 0.01:
                v = str(v) + "**"
            elif pear[1] < 0.05:
                v = str(v) + "*"
            else:
                v = str(v)
            table_corrs[cat.title()] = v
            #corrs[cat + "_survey_corr"] = self.vals[[cat + "_survey", cat + "_proj"]].corr(method="pearson").iloc[0,1]
        if table:
            return table_corrs
        return corrs

              
        def corr_census_old(self, model, dec):
            survey = pd.read_csv(f"G:/My Drive/KU/Thesis/data/us_census/census_{dec}_OCC1950.csv", index_col = 0)
            occ_map = pd.read_csv("G:/My Drive/KU/Thesis/data/garg/occupation_map.csv", index_col="Occupation, 1950 basis").to_dict()["Single words"]
                               
            occs = {v: k for k, v in occ_map.items() if type(v) != list}
            capitals = {"EDUC":"Education", "PRESGL":"Status", "INCTOT":"Affluence"}
            cats = capitals.values()
            capitals = {v: k for k, v in capitals.items()}

            ant_pairs = {}
            vals = {}
            projs = {}
            dims = {}
            embed = self.models[model]
            self.vals = {}

            for cat in cats:
                #print(domain, cat)
                ant_pairs[cat] = pd.read_csv(f"G:/My Drive/KU/Thesis/data/word_pairs/{cat}_antonyms_goc.csv", header = None, names = ("pos_ant", "neg_ant"))
                ant_pairs[cat] = ant_pairs[cat].rename(columns= {"pos_ant":ant_pairs[cat].iloc[0,0],"neg_ant":ant_pairs[cat].iloc[0,1]})
                #prepare dictionaries for survey & projection values
                vals[cat + "_survey"] = {}
                vals[cat + "_proj"] = {}
                #calculate dimensions from antonym pairs
                dims[cat] = create_dim_avg(embed, ant_pairs[cat])
                #project embeddings onto dimension
                projs[cat] = self.proj_dim(model, dims[cat])
                #iterate through words
                not_in_vocab = []
                for index, row in survey.iterrows():
                    #print(index, row)
                    try:
                        word = occ_map[row.name].lower()
                        #print(word)
                        #retrieve index in embeddings
                        ind = embed.get_index(word)
                        #retrieve projected value using index
                        val = projs[cat][ind]
                        #add all to DF
                        vals[cat + "_survey"][word] = row[capitals[cat] + "_mean"]
                        vals[cat + "_proj"][word] = val
                    except Exception as e:
                        pass
                        #not_in_vocab.append(word)

             #   print(f"{not_in_vocab} not in embeddings vocab!")
        self.vals = pd.DataFrame(vals)
        corrs = {}
        for cat in cats:
           # print(self.vals[cat + "_survey"], self.vals[cat + "_proj"])
            corrs[cat + "_survey_corr"] = pearsonr(self.vals[cat + "_survey"], self.vals[cat + "_proj"])
            #corrs[cat + "_survey_corr"] = self.vals[[cat + "_survey", cat + "_proj"]].corr(method="pearson").iloc[0,1]
        return corrs
                        
    def corr_survey(self, model):
        survey = pd.read_csv("G:/My Drive/KU/Thesis/data/survey_data/survey_means_weighted.csv")
        survey = survey.rename(columns= {"Unnamed: 0": "words"})
        survey = survey.set_index("words")
        cats =  ["race", "gender", "affluence"]

        
        ant_pairs = {}
        vals = {}
        projs = {}
        dims = {}
        embed = self.models[model]

        for cat in cats:
            ant_pairs[cat] = pd.read_csv(f"G:/My Drive/KU/Thesis/data/word_pairs/{cat}_antonyms_goc.csv", header = None, names = ("pos_ant", "neg_ant"))
            ant_pairs[cat] = ant_pairs[cat].rename(columns= {"pos_ant":ant_pairs[cat].iloc[0,0],"neg_ant":ant_pairs[cat].iloc[0,1]})
            #prepare dictionaries for survey & projection values
            vals[cat + "_survey"] = {}
            vals[cat + "_proj"] = {}
            #calculate dimensions from antonym pairs
            dims[cat] = create_dim_avg(embed, ant_pairs[cat])
            #project embeddings onto dimension
            projs[cat] = self.proj_dim(model, dims[cat])
            #iterate through words
            not_in_vocab = []
            for row in survey.iterrows():
                word = row[0].lower()
                try:
                    #print(word)
                    #retrieve index in embeddings
                    ind = embed.get_index(word)
                    #retrieve projected value using index
                    val = projs[cat][ind]
                    #add all to DF
                    vals[cat + "_survey"][word] = row[1][cat + "_mean"]
                    vals[cat + "_proj"][word] = val
                except Exception as e:
                    not_in_vocab.append(word)
                    
          #  print(f"{not_in_vocab} not in embeddings vocab!")
        self.vals = pd.DataFrame(vals)
        corrs = {}
        for cat in ["race", "gender", "affluence"]:
            corrs[cat + "_survey_corr"] = pearsonr(self.vals[cat + "_survey"], self.vals[cat + "_proj"])
           # corrs[cat + "_survey_corr"] = self.vals[[cat + "_survey", cat + "_proj"]].corr(method="pearson").iloc[0,1]
        return corrs


    def corr_survey_grouped(self, model):
        survey = pd.read_csv("G:/My Drive/KU/Thesis/data/survey_data/survey_means_weighted.csv")
        survey = survey.rename(columns= {"Unnamed: 0": "words"})
        survey = survey.set_index("words")
        cats =  ["race", "gender", "affluence"]
        groups = load_domain_dic(f"G:/My Drive/KU/Thesis/data/domains/dicts/goc_culture_domains.xlsx")
        
        ant_pairs = {}
        vals = {}
        projs = {}
        dims = {}
        embed = self.models[model]
        for group, items in groups.items():
            items = [item.lower() for item in items]
            vals[group] = {}
            for cat in cats:
                ant_pairs[cat] = pd.read_csv(f"G:/My Drive/KU/Thesis/data/word_pairs/{cat}_antonyms_goc.csv", header = None, names = ("pos_ant", "neg_ant"))
                ant_pairs[cat] = ant_pairs[cat].rename(columns= {"pos_ant":ant_pairs[cat].iloc[0,0],"neg_ant":ant_pairs[cat].iloc[0,1]})
                #prepare dictionaries for survey & projection values
                vals[group][cat + "_survey"] = {}
                vals[group][cat + "_proj"] = {}
                #calculate dimensions from antonym pairs
                dims[cat] = create_dim_avg(embed, ant_pairs[cat])
                #project embeddings onto dimension
                projs[cat] = self.proj_dim(model, dims[cat])
                #iterate through words
                not_in_vocab = []
                for row in survey.iterrows():
                    word = row[0].lower()
                    if word not in items:
                       # print(word, items)
                        continue
                    try:
                        #print(word)
                        #retrieve index in embeddings
                        ind = embed.get_index(word)
                        #retrieve projected value using index
                        val = projs[cat][ind]
                        #add all to DF
                        vals[group][cat + "_survey"][word] = row[1][cat + "_mean"]
                        vals[group][cat + "_proj"][word] = val
                    except Exception as e:
                        not_in_vocab.append(word)

          #  print(f"{not_in_vocab} not in embeddings vocab!")
        self.vals = vals#pd.DataFrame(vals)
        corrs = {group: {} for group in groups.keys()}
       # print(vals)
        for group, items in groups.items():
            for cat in ["race", "gender", "affluence"]:
                #print(self.vals[group][cat + "_survey"], self.vals[group][cat + "_proj"])
                corrs[group][cat + "_survey_corr"] = pearsonr(list(self.vals[group][cat + "_survey"].values()), list(self.vals[group][cat + "_proj"].values()))    
               # corrs
        return corrs

def to_latex(df, title):
    df.to_latex(f"G:/My Drive/KU/Thesis/outputs/tables/{title}.tex")


def get_projection_corrs(self, input_words, p_val=False):
    if input_words == "top words":
        input_words = pd.read_csv("G:/My Drive/KU/Thesis/data/unigram_freq.csv").to_list()[:10000]
    q = 0
    l = 0
    w = True
    for dec, wv in self.wvs.items():
        ind2key = wv.index_to_key
        norm = self.norm_matrix[dec]
        if q == 0:
            words = []
            for word in input_words:
                try:
                    vec = wv[word]
                except:
                    continue
                if np.mean(vec) == 0:
                    w = False
                for e in vec:
                    if e != e:
                        w = False
                if w == True:
                    words.append(word)
                w = True
            words = set(words)
            q += 1
        elif q == "PREVIOUS VERSION":
            words = []
            for i, vec in enumerate(norm):
                for e in vec:
                    if e != e:
                        w = False
                if w == True:
                    l += 1
                    words.append(ind2key[i])
                w = True
            words = set(words)
            q = 1
        else: 
            words2 = []
            for i, vec in enumerate(norm):
                for e in vec:
                    if e != e:
                        w = False
                if w == True:
                    words2.append(ind2key[i])
                w = True
            words2 = set(words2)
            words = words.intersection(words2)
    words = list(words)
    dics = {}
    self.inds = {}
    for dec, wv in self.wvs.items():
        dic = wv.key_to_index
        norm = self.norm_matrix[dec]
        self.inds[dec] = []
        for word in words:
            self.inds[dec].append(dic[word])

    self.proj_corrs = {}
    for dim in self.dims:
        self.proj_corrs[dim] = {}    
        for dec1, wv1 in self.wvs.items():
            self.proj_corrs[dim][dec1] = {}
            for dec2, wv2 in self.wvs.items():
                self.proj_corrs[dim][dec1][dec2] = {}
                projs1 = [self.projs[dec1][dim][ind] for ind in self.inds[dec1]]
                projs2 = [self.projs[dec2][dim][ind] for ind in self.inds[dec2]]
                if p_val:
                    self.proj_corrs[dim][dec1][dec2] = pearsonr(projs1, projs2)
                else:
                    self.proj_corrs[dim][dec1][dec2] = pearsonr(projs1, projs2)[0]

def plot_projection_corrs(self, n,k, save=None):
    fig, ax = plt.subplots(nrows=int((n+(k/2))//k), ncols=k, figsize = (15*k,15*int((n+(k/2))//k)))
    plt.style.use("ggplot")
    rdpu = cm.get_cmap('BuPu', n+2)
    colours = rdpu(range(n+2))

    parameters = {'figure.titlesize':20,#'axes.labelsize': 25,
                  'font.family':'Helvetica',

              'axes.titlesize': 25}
    plt.rcParams.update(parameters)


    for i,dim in enumerate(self.dims):
        done_decs = []
        j = 0
        for dec, wv in self.wvs.items():
            done_decs.append(dec)
            x = [deca for deca, val in self.proj_corrs[dim][dec].items() if deca not in done_decs]
            y = [val for deca, val in self.proj_corrs[dim][dec].items() if deca not in done_decs]
            ax[i//2, i%2].plot(x,y, color = colours[9-j], label = dec)
            ax[i//2, i%2].set_xlabel('Decade', fontsize = 20)
            ax[i//2, i%2].set_ylabel("Pearson's r", fontsize = 20)
            ax[i//2, i%2].tick_params(axis='both', which='major', labelsize=20)
            ax[i//2, i%2].set_ylim([0, 1])
            #ax[i//2, i%2].legend(shadow=True, fancybox=True)
          #  ax[i//2, i%2].tick_params(axis='both', which='minor', labelsize=8)
            handles, labels = ax[i//2, i%2].get_legend_handles_labels()
            #fig.legend(handles, labels, loc='lower right')

            tit = str(dim).title()
            ax[i//2, i%2].title.set_text(tit)
         #   ax[i//2, i%2]..titlesize
            j+=1
    if save:
        plt.savefig(f"G:/My Drive/KU/Thesis/outputs/graphs/{save}.jpg")