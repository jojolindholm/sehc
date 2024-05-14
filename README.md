# The Swedish High Court (SeHC) Package

_Johan Lindholm<sup>1</sup>, Mattias Derlén<sup>1</sup>, and Daniel Naurin<sup>2</sup>_

<sup>1</sup> Umeå University Department of Law
<sup>2</sup> University of Oslo, ARENA Centre for European Studies

------------------

## Introduction

The package 'sehc' primarily contains a database on the Swedish high courts, more specifically the Supreme Court (“Högsta domstolen” or “HD”) and the Supreme Administrative Court (“Högsta förvaltningsdomstolen”, previously “Regeringsrätten”, or “HFD”). It contains data on both the judgments of the Supreme Court (presented for example in cases, opinions), as well as on the individual Justices that have served on the Supreme Court and the Supreme Administrative Court (presented in the table appointments). It also contains a number of handy functions for manipulating datasets and combining variables from multiple datasets to conduct common types of analysis. 

The data has been collected as part of a research project: [Judicial Power and Power over the Judiciary: An Interdisciplinary Study of the Shifting Role of Judges](https://www.umu.se/en/research/projects/judicial-power-and-power-over-the-judiciary-an-interdisciplinary-study-of-the-shifting-role-of-judges-/). The project involved researchers at the Department of Law at Umeå University and the Department of Political Science at Gothenburg University. The research, including the publication of this database, has been approved by the Swedish Ethical Review Authority (dnr 2019-03783) The creation of the database was made possible with the financial support of the Swedish Research Council (project number 2018–1383). We also want to express our gratitude to our research assistants at Umeå University for their invaluable help in compiling the data: Erik Engman Jonsson, Thomasine Francke Rydén, Angelica Kullström, Carl Lexenberg, Malin Thorneman, and Juni Wikman.

If you have any questions regarding the data, the coding process, or commercial use of the data, please contact [Johan Lindholm](mailto:johan.lindholm@umu.se).

## Install

In your R console run:
 
'library(devtools)

install_github("jojolindholm/sehc")'

## The Data

The datasets are available as separate R-data files (.rda) in the folder "/data". Additionally, they are also made available as comma-separated values (.csv) files in the folder "/csv-data".

For more information about the datasets and the variables they contain, please consult [the code book](sehc_code_book.pdf).

Stable releases of the database and the code are stored with [Zenodo](https://zenodo.org/account/settings/github/repository/jojolindholm/sehc).

## Using the Package

Not sure where to start? Check out the [example script](example.R).

## Citing

Please cite as "Johan Lindholm, Mattias Derlén, and Daniel Naurin. 2023. Swedish High Court Database (version 0.9.1, 1 May 2023). DOI:  10.5281/zenodo.7883860".

## Publications

The package and the datasets have been used in the following studies:
* Johan Lindholm, Mattias Derlén, and Daniel Naurin, 'The Ideal Justice: Who Are Selected to Serve and What Does It Say about Swedish High Courts?' Tidsskrift for Rettsvitenskap, 2022, 135(4), pp. 397-431. DOI: [10.18261/tfr.135.4.1](https://doi.org/10.18261/tfr.135.4.1)