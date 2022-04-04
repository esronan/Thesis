from bs4 import BeautifulSoup
from urllib.request import Request, urlopen
import requests as re
import regex
import os
import pandas as pd
import vec_tools

def add_to_ant_df(dim, pos_ant, neg_ant):
    df = pd.read_csv(f"G:/My Drive/KU/Thesis/data/word_pairs/{dim}_antonyms.csv")
    print(df.columns)
    df = df.append({df.columns[1]: neg_ant, df.columns[2]: pos_ant}, ignore_index=True)
    df.to_csv()

def list2file(input_list, output_dir):
    f = open(output_dir, "w", encoding="utf-8")
    for el in input_list:
        f.write(el + "\n")
    f.close()

def url_dl(url, path):
  #  if coll[-2:] == "12":
        #name = reg.search("01-.+.gz", url).start()
    rx = regex.split("\/", url)
    name = rx[-1]
    path = path + name
        
    print(f"\nStarting: ",path)
    r = re.get(url, stream=True)
#     r.raise_for_status()
    initial_pos = 0
    print(path)
    with open(path, "wb") as f: 
        for chunk in r.iter_content(chunk_size=8192):  
            f.write(chunk)

def get_collins_list(title):
    hdr = {'User-Agent': 'Mozilla/5.0'}
    url = f"https://www.collinsdictionary.com/word-lists/{title}"
    req = Request(url, headers=hdr)
    html_page = urlopen(req)

    soup = BeautifulSoup(html_page, "lxml")
    lst = []

    for link in soup.findAll('a'):
        #print(link)
        title = link.get("title")
       #print(title)
        try: 
            ind = regex.match("Definition of ", title).end()
            if len(title[ind:].split()) > 4: #get rid of irrelevant suggestions
                pass
            if regex.match("or", title):
                splt = title[ind:].split()
                for i, el in emuerate(splt):
                    if el == "or":  
                        lst.append(" ".join(splt[:i]))
                        lst.append(" ".join(splt[i+1:]))
                        break
            else:
                lst.append(title[ind:])
        except:
            continue
    return lst

def load_list(fname):
    li = open(fname, encoding="utf-8").readlines()
    lst = [el.strip() for el in li]
    return lst