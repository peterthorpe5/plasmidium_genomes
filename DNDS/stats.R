#####
# commands in R to compare dnds values

library(dplyr)
library(ggplot2)

my_data <- read.table("dnds_values.txt", header=TRUE)
my_data
levels(my_data$group)

my_data$group <- ordered(my_data$group,
                         levels = c("BUSCO", "KIR", "SICAVARI", "SICAVARII"))
                         
                         
group_by(my_data, group) %>%
  summarise(
    count = n(),
    mean = mean(dnds, na.rm = TRUE),
    sd = sd(dnds, na.rm = TRUE),
    median = median(dnds, na.rm = TRUE),
    IQR = IQR(dnds, na.rm = TRUE)
  )                       

 
  group     count  mean    sd median   IQR
  <ord>     <int> <dbl> <dbl>  <dbl> <dbl>
1 BUSCO       153 0.353 0.723  0.101 0.270
2 KIR          26 2.35  1.19   1.99  1.50 
3 SICAVARI     15 2.40  1.31   2.37  1.86 
4 SICAVARII     5 2.74  2.54   1.83  4.02 


# box plot with points on

ggplot(my_data, aes(x = group, y = dnds)) +
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
  kruskal.test(dnds ~ group, data = my_data)
  
  
  data:  dnds by group
Kruskal-Wallis chi-squared = 86.237, df = 3, p-value < 2.2e-16

YES!!!

# to see the pairwise comparisons, we use post hoc correction

pairwise.wilcox.test(my_data$dnds, my_data$group, p.adj="bonferroni", exact=F)


	Pairwise comparisons using Wilcoxon rank sum test 

data:  my_data$dnds and my_data$group 

          BUSCO   KIR    SICAVARI
KIR       6.7e-13 -      -       
SICAVARI  4.1e-08 1.0000 -       
SICAVARII 0.0063  1.0000 1.0000  

P value adjustment method: bonferroni 
  