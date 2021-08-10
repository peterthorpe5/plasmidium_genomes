#####
# commands in R to compare dnds values

library(dplyr)
library(ggplot2)

library(png)
library(gridExtra)
library(ggplot2)
setwd("C:/Users/pjt6/Documents/plasmidium_genomes/genic_distances/")

my_data <- read.table("all_geneic_distances", header=TRUE, sep="\t")
my_data
levels(my_data$group)

my_data$group <- ordered(my_data$group,
                         levels = c("busco", "KIR", "sicavarI", "sicavarII", "Other"))
                         
                         
group_by(my_data, group) %>%
  summarise(
    count = n(),
    mean = mean(fiveprime, na.rm = TRUE),
    sd = sd(fiveprime, na.rm = TRUE),
    median = median(fiveprime, na.rm = TRUE),
    IQR = IQR(fiveprime, na.rm = TRUE)
  )                       

 # summary for the 5' direction
  group     count  mean     sd median   IQR
  <ord>     <int> <dbl>  <dbl>  <dbl> <dbl>
1 busco       609 2310.  2686.  1504  1695 
2 KIR          95 6393.  8341.  3566  5175 
3 sicavarI    269 9221. 11491.  5460  9965 
4 sicavarII    20 5584.  6268.  3420. 2870.
5 Other     18867 2386.  3375.  1458  1752 
   

   
group_by(my_data, group) %>%
  summarise(
    count = n(),
    mean = mean(threeprime, na.rm = TRUE),
    sd = sd(threeprime, na.rm = TRUE),
    median = median(threeprime, na.rm = TRUE),
    IQR = IQR(threeprime, na.rm = TRUE)
  )     


# sumamry for the 3' direction
  group     count  mean     sd median    IQR
  <ord>     <int> <dbl>  <dbl>  <dbl>  <dbl>
1 busco       609 2372.  3389.  1622   1629 
2 KIR          95 5156.  6243.  3298   3336.
3 sicavarI    269 8848. 10260.  5659  10072.
4 sicavarII    20 3692.  3694.  2398.  2996.
5 Other     18867 2398.  3457.  1456.  1757 


# box plot with points on

ggplot(my_data, aes(x = group, y = threeprime)) +
  geom_boxplot(fill = "grey92") +
  ## use either geom_point() or geom_jitter()
  geom_point(
    ## draw bigger points
    size = 2,
    ## add some transparency
    alpha = .3,
    ## add some jittering
    position = position_jitter(
      ## control randomness and range of jitter
      seed = 1, width = .2
    )
  )
  
  
  ggplot(my_data, aes(x = group, y = fiveprime)) +
  geom_boxplot(fill = "grey92") +
  ## use either geom_point() or geom_jitter()
  geom_point(
    ## draw bigger points
    size = 2,
    ## add some transparency
    alpha = .3,
    ## add some jittering
    position = position_jitter(
      ## control randomness and range of jitter
      seed = 1, width = .2
    )
  )
  
  
  # non parametric ANOVA to see if any difference. 
  kruskal.test(threeprime ~ group, data = my_data)
  
  
	Kruskal-Wallis rank sum test

data:  threeprime by group
Kruskal-Wallis chi-squared = 272.15, df = 4, p-value < 2.2e-16

YES!!!

# to see the pairwise comparisons, we use post hoc correction

pairwise.wilcox.test(my_data$threeprime, my_data$group, p.adj="bonferroni", exact=F)


	Pairwise comparisons using Wilcoxon rank sum test 

data:  my_data$threeprime and my_data$group 

          busco   KIR     sicavarI sicavarII
KIR       1.1e-10 -       -        -        
sicavarI  < 2e-16 0.007   -        -        
sicavarII 0.457   1.000   0.106    -        
Other     0.825   1.5e-12 < 2e-16  0.325  

P value adjustment method: bonferroni 


########################################################

  # non parametric ANOVA to see if any difference. 
  kruskal.test(fiveprime ~ group, data = my_data)
  
  	Kruskal-Wallis rank sum test

data:  fiveprime by group
Kruskal-Wallis chi-squared = 269.33, df = 4, p-value < 2.2e-16

yes!!
pairwise.wilcox.test(my_data$fiveprime, my_data$group, p.adj="bonferroni", exact=F)

  	Pairwise comparisons using Wilcoxon rank sum test 

data:  my_data$fiveprime and my_data$group 

          busco   KIR     sicavarI sicavarII
KIR       3.6e-09 -       -        -        
sicavarI  < 2e-16 0.08042 -        -        
sicavarII 0.00123 1.00000 1.00000  -        
Other     1.00000 3.7e-11 < 2e-16  0.00078  

P value adjustment method: bonferroni 