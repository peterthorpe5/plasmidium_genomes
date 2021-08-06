# R commands to make heat map

library(png)
library(gridExtra)
library(ggplot2)
setwd("C:/Users/pjt6/Documents/plasmidium_genomes/genic_distances/")

# how I have imported data into R before....
# wipe any previous variable
data <- ""
data<-read.table("sk048_genic_distances.heatmap.txt", header=TRUE, sep=("\t"))


p <- ggplot (data, aes(log(fiveprime), log(threeprime)))

p + geom_point(aes(colour=factor(Class), shape=factor(Class)))

### this works

p + geom_bin2d (bins = 40)+ scale_fill_gradient (low="black", high = "white")+(geom_point(aes(colour=factor(Class), shape=factor(Class))))


ggsave(filename = ("sk048_heat_maps_actual_result001.png"), plot = last_plot(), scale = 1, width = 7, height = 7, dpi = 1200, limitsize = TRUE)

ggsave(filename = ("sk048_heat_maps_actual_result001.eps"), plot = last_plot(), scale = 1, width = 7, height = 7, dpi = 1200, limitsize = TRUE)




 p + geom_bin2d (bins = 40)+ scale_fill_gradient (low="black", high = "white")+(geom_point(aes(colour=factor(Class), shape=factor(Class)))) + scale_colour_manual(values = c("green","blue", "orange", "purple"))

ggsave(filename = ("sk048_heat_maps_actual_result001_colours.pdf"), plot = last_plot(), scale = 1, width = 7, height = 7, dpi = 1200, limitsize = TRUE)

ggsave(filename = ("sk048_heat_maps_actual_result001_colours.eps"), plot = last_plot(), scale = 1, width = 7, height = 7, dpi = 1200, limitsize = TRUE)



######## to do facet with scale gradient


p + geom_bin2d (bins = 40)+ scale_fill_gradient (low="black", high = "white") + geom_point(aes(colour=factor(Class))) +facet_grid(.~Class)


#ggsave(filename = ("sk048_heat_maps_actual_result003a.png"), plot = last_plot(), scale = 1, width = 7, height = 7, dpi = 1200, limitsize = TRUE)



p + geom_bin2d (bins = 40)+ scale_fill_gradient (low="black", high = "white") + geom_point(aes(colour=factor(Class), )) +facet_grid(.~Class)



#p + geom_bin2d (bins = 40)+ scale_fill_gradient (low="black", high = "white") + geom_point(aes(colour=factor(Class))), +facet_grid(.~Class)



######### heat map facet grid


p + geom_bin2d (bins = 40)+ scale_fill_gradient (low="black", high = "white") +facet_grid(.~Class)


#p + geom_bin2d (bins = 40)+ scale_fill_gradient (low="black", high = "white") +(geom_point(aes(colour=factor(Class), +facet_grid(.~Class)

ggsave(filename = ("sk048_heat_maps_facet001.png"), plot = last_plot(), scale = 1, width = 7, height = 7, dpi = 1200, limitsize = TRUE)


ggsave(filename = ("sk048_heat_maps_facet.eps"), plot = last_plot(), scale = 1, width = 7, height = 7, dpi = 1200, limitsize = TRUE)






######################################## to specifically change to colours of the points

p + geom_bin2d (bins = 80)+ scale_fill_gradient (low="black", high = "white")+(geom_point(aes(colour=factor(Class), 
shape=factor(Class)))) + scale_colour_manual(values = c("blue"))

ggsave(filename = ("sk048_heat_maps_real001a_colours_wild.png"), plot = last_plot(), scale = 1, width = 7, height = 7, dpi = 1200, limitsize = TRUE)


 p + geom_bin2d (bins = 40)+ scale_fill_gradient (low="black", high = "white")+(geom_point(aes(colour=factor(Class), shape=factor(Class)))) + scale_colour_manual(values = c("blue"))




 p + geom_bin2d (bins = 40)+ scale_fill_gradient (low="black", high = "white")+(geom_point(aes(colour=factor(Class), shape=factor(Class)))) + scale_colour_manual(values = c("green","blue", "orange"))

#






library(png)
library(gridExtra)
library(ggplot2)


# how I have imported data into R before....
data<-read.table("../P.psue.v1.heatmap.txt", header=TRUE)


p <- ggplot (data, aes(fiveprime, threeprime))


p + geom_bin2d (bins = 40)


#ggsave(filename = ("Ppsue_heat_maps_001.png"), plot = last_plot(), scale = 1, width = 7, height = 7, dpi = 1200, limitsize = TRUE)



p + geom_bin2d (bins = 40)+ scale_fill_gradient (low="black", high = "white")



#ggsave(filename = ("Ppsue_heat_maps_002.png"), plot = last_plot(), scale = 1, width = 7, height = 7, dpi = 1200, limitsize = TRUE)


p + geom_bin2d (bins = 40)+ scale_fill_gradient (low="black", high = "white", limits = c(0, 2000))


#ggsave(filename = ("Ppsue_heat_maps_003.png"), plot = last_plot(), scale = 1, width = 7, height = 7, dpi = 1200, limitsize = TRUE)




#p + geom_point(aes(colour=class, shape=Class, size = 8))




#ggsave(filename = ("Ppsue_heat_maps_004.png"), plot = last_plot(), scale = 1, width = 7, height = 7, dpi = 1200, limitsize = TRUE)




p + geom_point(aes(colour=factor(Class), shape=factor(Class), size=Class))

p + geom_point(aes(colour=factor(Class), shape=factor(Class)))


#ggsave(filename = ("Ppsue_heat_maps_005.png"), plot = last_plot(), scale = 1, width = 7, height = 7, dpi = 1200, limitsize = TRUE)


t3 <- data[data$Class==3,]








p <- ggplot (data, aes(log(fiveprime), log(threeprime)))


p + geom_point(aes(colour=factor(Class), shape=factor(Class)))



#ggsave(filename = ("Ppsue_heat_maps_007.eps"), plot = last_plot(), scale = 1, width = 7, height = 7, dpi = 1200, limitsize = TRUE)


p + geom_point(aes(colour=factor(Class), shape=factor(Class))) +facet_grid(.~Class)


ggsave(filename = ("Ppsue_heat_maps_008.png"), plot = last_plot(), scale = 1, width = 7, height = 7, dpi = 1200, #limitsize = TRUE)


ggsave(filename = ("Ppsue_heat_maps_008.eps"), plot = last_plot(), scale = 1, width = 7, height = 7, dpi = 1200, limitsize = TRUE)


p + geom_point(aes(colour=factor(Class), shape=factor(Class))) +facet_wrap(~Class)


#ggsave(filename = ("Ppsue_heat_maps_009.png"), plot = last_plot(), scale = 1, width = 7, height = 7, dpi = 1200, limitsize = TRUE)





######### pete playing#######
#this code is the essential ines
p + geom_bin2d (bins = 40)+ scale_fill_gradient (low="black", high = "white")


#ggsave(filename = ("Ppsue_heat_maps_010.png"), plot = last_plot(), scale = 1, width = 7, height = 7, dpi = 1200, limitsize = TRUE)

#ggsave(filename = ("Ppsue_heat_maps_010.eps"), plot = last_plot(), scale = 1, width = 7, height = 7, dpi = 1200, limitsize = TRUE)

p + geom_bin2d (bins = 60)+ scale_fill_gradient (low="black", high = "white")


#ggsave(filename = ("Ppsue_heat_maps_011.png"), plot = last_plot(), scale = 1, width = 7, height = 7, dpi = 1200, limitsize = TRUE)



### this works

p + geom_bin2d (bins = 40)+ scale_fill_gradient (low="black", high = "white")+(geom_point(aes(colour=factor(Class), shape=factor(Class))))


ggsave(filename = ("Ppsue_heat_maps_actual_result001.png"), plot = last_plot(), scale = 1, width = 7, height = 7, dpi = 1200, limitsize = TRUE)

ggsave(filename = ("Ppsue_heat_maps_actual_result001.eps"), plot = last_plot(), scale = 1, width = 7, height = 7, dpi = 1200, limitsize = TRUE)


#messing
        
p + geom_bin2d (bins = 40)+ scale_fill_gradient (low="black", high = "white")+(geom_point(aes(colour=factor(Class) + geom_point(colour="grey90", size = 4, show_guide = TRUE), shape=factor(Class)))) 


#ggsave(filename = ("Ppsue_heat_maps_actual_result002.png"), plot = last_plot(), scale = 1, width = 7, height = 7, dpi = 1200, limitsize = TRUE)




p + geom_bin2d (bins = 60)+ scale_fill_gradient (low="black", high = "white")+(geom_point(aes(colour=factor(Class), size = 3, shape=factor(Class))))



p + geom_bin2d (bins = 60)+ scale_fill_gradient (low="black", high = "white")+(geom_point(aes(colour=factor(Class), size = 1, shape=factor(Class))))



p + geom_point(aes(colour=factor(Class), shape=factor(Class)))



######## to do facet with scale gradient


p + geom_bin2d (bins = 40)+ scale_fill_gradient (low="black", high = "white") + geom_point(aes(colour=factor(Class))) +facet_grid(.~Class)


#ggsave(filename = ("Ppsue_heat_maps_actual_result003a.png"), plot = last_plot(), scale = 1, width = 7, height = 7, dpi = 1200, limitsize = TRUE)



p + geom_bin2d (bins = 40)+ scale_fill_gradient (low="black", high = "white") + geom_point(aes(colour=factor(Class), )) +facet_grid(.~Class)



#p + geom_bin2d (bins = 40)+ scale_fill_gradient (low="black", high = "white") + geom_point(aes(colour=factor(Class))), +facet_grid(.~Class)



######### heat map facet grid


p + geom_bin2d (bins = 40)+ scale_fill_gradient (low="black", high = "white") +facet_grid(.~Class)


#p + geom_bin2d (bins = 40)+ scale_fill_gradient (low="black", high = "white") +(geom_point(aes(colour=factor(Class), +facet_grid(.~Class)

ggsave(filename = ("Ppsue_heat_maps_facet001_wild_HCE.png"), plot = last_plot(), scale = 1, width = 7, height = 7, dpi = 1200, limitsize = TRUE)


ggsave(filename = ("Ppsue_heat_maps_facet.eps"), plot = last_plot(), scale = 1, width = 7, height = 7, dpi = 1200, limitsize = TRUE)



#################################################### to get it to produce heat map

p <- ggplot (data, aes(fiveprime, threeprime))

p + geom_bin2d (bins = 40)

p + geom_bin2d (bins = 40)+ scale_fill_gradient (low="black", high = "white")
p <- ggplot (data, aes(log(fiveprime), log(threeprime)))
p + geom_bin2d (bins = 40)+ scale_fill_gradient (low="black", high = "white")+(geom_point(aes(colour=factor(Class), shape=factor(Class))))

p + geom_bin2d (bins = 40)+ scale_fill_gradient (low="black", high = "white")

p + geom_bin2d (bins = 40)+ scale_fill_gradient (low="black", high = "white")  +facet_grid(.~Class) 

#p + geom_bin2d (bins = 40)+ scale_fill_gradient (low="black", high = "white") +(geom_point(aes(colour=factor(Class) +facet_grid(.~Class)





######################################## to specifically change to colours of the points

p + geom_bin2d (bins = 80)+ scale_fill_gradient (low="black", high = "white")+(geom_point(aes(colour=factor(Class), shape=factor(Class)))) + scale_colour_manual(values = c("blue"))

ggsave(filename = ("Ppsue_heat_maps_real001a_colours_wild.png"), plot = last_plot(), scale = 1, width = 7, height = 7, dpi = 1200, limitsize = TRUE)


 p + geom_bin2d (bins = 40)+ scale_fill_gradient (low="black", high = "white")+(geom_point(aes(colour=factor(Class), shape=factor(Class)))) + scale_colour_manual(values = c("blue"))




 p + geom_bin2d (bins = 40)+ scale_fill_gradient (low="black", high = "white")+(geom_point(aes(colour=factor(Class), shape=factor(Class)))) + scale_colour_manual(values = c("green","blue", "orange"))

#







library(png)
library(gridExtra)
library(ggplot2)


# how I have imported data into R before....
data<-read.table("../P.boem.v1.heatmap.txt", header=TRUE)


p <- ggplot (data, aes(fiveprime, threeprime))


p + geom_bin2d (bins = 40)


#ggsave(filename = ("Pboe_heat_maps_001.png"), plot = last_plot(), scale = 1, width = 7, height = 7, dpi = 1200, limitsize = TRUE)



p + geom_bin2d (bins = 40)+ scale_fill_gradient (low="black", high = "white")



#ggsave(filename = ("Pboe_heat_maps_002.png"), plot = last_plot(), scale = 1, width = 7, height = 7, dpi = 1200, limitsize = TRUE)


p + geom_bin2d (bins = 40)+ scale_fill_gradient (low="black", high = "white", limits = c(0, 2000))


#ggsave(filename = ("Pboe_heat_maps_003.png"), plot = last_plot(), scale = 1, width = 7, height = 7, dpi = 1200, limitsize = TRUE)




#p + geom_point(aes(colour=class, shape=Class, size = 8))




#ggsave(filename = ("Pboe_heat_maps_004.png"), plot = last_plot(), scale = 1, width = 7, height = 7, dpi = 1200, limitsize = TRUE)




p + geom_point(aes(colour=factor(Class), shape=factor(Class), size=Class))

p + geom_point(aes(colour=factor(Class), shape=factor(Class)))


#ggsave(filename = ("Pboe_heat_maps_005.png"), plot = last_plot(), scale = 1, width = 7, height = 7, dpi = 1200, limitsize = TRUE)


t3 <- data[data$Class==3,]








p <- ggplot (data, aes(log(fiveprime), log(threeprime)))


p + geom_point(aes(colour=factor(Class), shape=factor(Class)))



#ggsave(filename = ("Pboe_heat_maps_007.eps"), plot = last_plot(), scale = 1, width = 7, height = 7, dpi = 1200, limitsize = TRUE)


p + geom_point(aes(colour=factor(Class), shape=factor(Class))) +facet_grid(.~Class)


ggsave(filename = ("Pboe_heat_maps_008.png"), plot = last_plot(), scale = 1, width = 7, height = 7, dpi = 1200, #limitsize = TRUE)


ggsave(filename = ("Pboe_heat_maps_008.eps"), plot = last_plot(), scale = 1, width = 7, height = 7, dpi = 1200, limitsize = TRUE)


p + geom_point(aes(colour=factor(Class), shape=factor(Class))) +facet_wrap(~Class)


#ggsave(filename = ("Pboe_heat_maps_009.png"), plot = last_plot(), scale = 1, width = 7, height = 7, dpi = 1200, limitsize = TRUE)





######### pete playing#######
#this code is the essential ines
p + geom_bin2d (bins = 40)+ scale_fill_gradient (low="black", high = "white")


#ggsave(filename = ("Pboe_heat_maps_010.png"), plot = last_plot(), scale = 1, width = 7, height = 7, dpi = 1200, limitsize = TRUE)

#ggsave(filename = ("Pboe_heat_maps_010.eps"), plot = last_plot(), scale = 1, width = 7, height = 7, dpi = 1200, limitsize = TRUE)

p + geom_bin2d (bins = 60)+ scale_fill_gradient (low="black", high = "white")


#ggsave(filename = ("Pboe_heat_maps_011.png"), plot = last_plot(), scale = 1, width = 7, height = 7, dpi = 1200, limitsize = TRUE)



### this works

p + geom_bin2d (bins = 40)+ scale_fill_gradient (low="black", high = "white")+(geom_point(aes(colour=factor(Class), shape=factor(Class))))


ggsave(filename = ("Pboe_heat_maps_actual_result001.png"), plot = last_plot(), scale = 1, width = 7, height = 7, dpi = 1200, limitsize = TRUE)

ggsave(filename = ("Pboe_heat_maps_actual_result001.eps"), plot = last_plot(), scale = 1, width = 7, height = 7, dpi = 1200, limitsize = TRUE)


#messing
        
p + geom_bin2d (bins = 40)+ scale_fill_gradient (low="black", high = "white")+(geom_point(aes(colour=factor(Class) + geom_point(colour="grey90", size = 4, show_guide = TRUE), shape=factor(Class)))) 


#ggsave(filename = ("Pboe_heat_maps_actual_result002.png"), plot = last_plot(), scale = 1, width = 7, height = 7, dpi = 1200, limitsize = TRUE)




p + geom_bin2d (bins = 60)+ scale_fill_gradient (low="black", high = "white")+(geom_point(aes(colour=factor(Class), size = 3, shape=factor(Class))))



p + geom_bin2d (bins = 60)+ scale_fill_gradient (low="black", high = "white")+(geom_point(aes(colour=factor(Class), size = 1, shape=factor(Class))))



p + geom_point(aes(colour=factor(Class), shape=factor(Class)))



######## to do facet with scale gradient


p + geom_bin2d (bins = 40)+ scale_fill_gradient (low="black", high = "white") + geom_point(aes(colour=factor(Class))) +facet_grid(.~Class)


#ggsave(filename = ("Pboe_heat_maps_actual_result003a.png"), plot = last_plot(), scale = 1, width = 7, height = 7, dpi = 1200, limitsize = TRUE)



p + geom_bin2d (bins = 40)+ scale_fill_gradient (low="black", high = "white") + geom_point(aes(colour=factor(Class), )) +facet_grid(.~Class)



#p + geom_bin2d (bins = 40)+ scale_fill_gradient (low="black", high = "white") + geom_point(aes(colour=factor(Class))), +facet_grid(.~Class)



######### heat map facet grid


p + geom_bin2d (bins = 40)+ scale_fill_gradient (low="black", high = "white") +facet_grid(.~Class)


#p + geom_bin2d (bins = 40)+ scale_fill_gradient (low="black", high = "white") +(geom_point(aes(colour=factor(Class), +facet_grid(.~Class)

ggsave(filename = ("Pboe_heat_maps_facet001_wild_HCE.png"), plot = last_plot(), scale = 1, width = 7, height = 7, dpi = 1200, limitsize = TRUE)


ggsave(filename = ("Pboe_heat_maps_facet.eps"), plot = last_plot(), scale = 1, width = 7, height = 7, dpi = 1200, limitsize = TRUE)



#################################################### to get it to produce heat map

p <- ggplot (data, aes(fiveprime, threeprime))

p + geom_bin2d (bins = 40)

p + geom_bin2d (bins = 40)+ scale_fill_gradient (low="black", high = "white")
p <- ggplot (data, aes(log(fiveprime), log(threeprime)))
p + geom_bin2d (bins = 40)+ scale_fill_gradient (low="black", high = "white")+(geom_point(aes(colour=factor(Class), shape=factor(Class))))

p + geom_bin2d (bins = 40)+ scale_fill_gradient (low="black", high = "white")

p + geom_bin2d (bins = 40)+ scale_fill_gradient (low="black", high = "white")  +facet_grid(.~Class) 

#p + geom_bin2d (bins = 40)+ scale_fill_gradient (low="black", high = "white") +(geom_point(aes(colour=factor(Class) +facet_grid(.~Class)





######################################## to specifically change to colours of the points

p + geom_bin2d (bins = 80)+ scale_fill_gradient (low="black", high = "white")+(geom_point(aes(colour=factor(Class), shape=factor(Class)))) + scale_colour_manual(values = c("blue"))

ggsave(filename = ("Pboe_heat_maps_real001a_colours_wild.png"), plot = last_plot(), scale = 1, width = 7, height = 7, dpi = 1200, limitsize = TRUE)


 p + geom_bin2d (bins = 40)+ scale_fill_gradient (low="black", high = "white")+(geom_point(aes(colour=factor(Class), shape=factor(Class)))) + scale_colour_manual(values = c("blue"))




 p + geom_bin2d (bins = 40)+ scale_fill_gradient (low="black", high = "white")+(geom_point(aes(colour=factor(Class), shape=factor(Class)))) + scale_colour_manual(values = c("green","blue", "orange"))

#



