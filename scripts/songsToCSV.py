#!/usr/bin/python
# -*- coding: utf-8 -*-

"""
Author: auralcat

***
NOTICE/LICENSE
***

TODO

- Ajeitar a saída pro arquivo CSV assim:
    <nome_do_arquivo_música>, <nota>
    * Ordenar o nome dos arquivos por número
- Separar o programa em módulos
- Fazer o programa correr todo o diretório de músicas - OK (use os.walk())

"""

import csv
import os

def generateFileName():
    """Generates the CSV file's name"""
    lastDirName = os.getcwd().split("/")[-1];
    print lastDirName
    return lastDirName + ".csv"

mylist = [str(n) + "\n" for n in range(1, 20)]
print "The CSV file will be written in %s" % os.getcwd()

with open(generateFileName(), 'wb') as outputFile:
    wr = csv.writer(outputFile, quoting=csv.QUOTE_ALL)
    wr.writerow(mylist)
