# The Swedish High Court (SeHC) Package

_Johan Lindholm, Mattias Derlén, and Daniel Naurin_

------------------

## Introduction

The package 'sehc' primarily contains a database on the Swedish high courts, more specifically the Supreme Court (“Högsta domstolen” or “HD”) and the Supreme Administrative Court (“Högsta förvaltningsdomstolen”, previously “Regeringsrätten”, or “HFD”). It contains data on both the judgments of the Supreme Court (presented for example in cases, opinions), as well as on the individual Justices that have served on the Supreme Court and the Supreme Administrative Court (presented in the table appointments). It also contains a number of handy functions for manipulating datasets and combining variables from multiple datasets to conduct common types of analysis. 

The data has been collected as part of a research project involving researchers at the Department of Law at Umeå University and the Department of Political Science at Gothenburg University. The creation of the database was made possible with the financial support of the Swedish Research Council (project number 2018–1383). We also want to express our gratitude to our research assistants at Umeå University for their invaluable help in compiling the data: Erik Engman Jonsson, Thomasine Francke Rydén, Angelica Kullström, Carl Lexenberg, Malin Thorneman, and Juni Wikman.

If you have any questions regarding the data, the coding process, or commercial use of the data, please contact Johan Lindholm (johan.lindholm@umu.se).

## Install

In your R console run:
 
  library(devtools)
  install_github("jojolindholm/sehc")

## The Data

The datasets are available as separate R-data files (.rda) in the folder "/data". Additionally, they are also made available as comma-separated values (.csv) files in the folder "/csv-data".

For more information about the datasets and the variables they contain, please consult the code book (https://github.com/jojolindholm/sehc/blob/main/sehc_code_book.pdf).

Stable releases of the database and the code are stored with Zenodo (https://zenodo.org/account/settings/github/repository/jojolindholm/sehc). 

## Citing

Please cite as "Johan Lindholm, Mattias Derlén, and Daniel Naurin. 2023. Swedish High Court Database (version 0.9.1, 1 May 2023). DOI:  10.5281/zenodo.7883860".
