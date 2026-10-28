# the_skool_morris_aronsson
Assignment reposatory for SQL 1 Lab

0 - Warmup
a) 
I created the repo and named it the_skool_morris_aronsson then I cloned it into my Oracle Linux.

b)
I made the .gitignore using the same code as for the previous assignment.

c)
I downloaded the data sheet.

d)
I deleted all the sheets except Tabell 3

e)
I loaded it into the repo on my Linux using: scp "resultat-ansokningsomgang-2025.xlsx" linton@oracle_dba26:/home/linton/Documents/github/the_skool_morris_aronsson

f) 



1 - EDA
I began looking through the data and found that the sheet didnt recognize the columns with their correct names. So I renamed them accordingly to what they are supposed to be.
Then there is a whole mess of text in the beginningw hich I can replace using REGEXP_REPLACE, but its just easier for me to delete the text and reload the table so I´ll just do that.
I reloaded the table and it is now much easier to navigate. Now I will start filtering. 
