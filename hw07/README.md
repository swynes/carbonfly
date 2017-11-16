##[hw07](https://github.com/swynes/STAT545-hw-wynes-chris/tree/master/hw07/mydata)

**Please open the link above to access the correct folder. I have saved some files in this homework folder for my reference from early attempts.

**REFLECTION**

I had a lot of trouble getting make downloaded onto my computer. The instructions provided to associate the correct path with make were for
windows 7 which I don't have and I wasn't comfortable making guesses to try and close the gap between operating systems with such sensitive
procedures. Because of this I was limited to the version that operates only within R.

My code seems to generally work correctly. I downloaded my own data about NBA players to try and do something different from gapminder
or other files that have been found for us. I used one R script to download the correct file, another R script to clean the data (which
had some significant issues) as well as briefly perform some statistics, and then a third R script to produce a plot from the dataframe
written to file in the second R script. Finally there is a top R script or makefile that combines all of the other three.

When the makefile combines the other three files it creates an error related to two of the column names. When executing the R scripts
separately these errors do not occur and I unfortunately ran out of time to troubleshoot this problem. Still, the makefile produces the
final plot and saves it to file as I wanted.
