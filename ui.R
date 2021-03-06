library(shiny)

samp=read.delim("annotations.tsv",header=T,as.is=T,sep="\t")
N=nrow(samp)
#comps=grep("comp",colnames(samp),value=T)
comps=colnames(samp)[c(3:10,14:38)]

fluidPage(
title = 'Histogenomics',

#sidebarLayout(
#sidebarPanel(
# create some select inputs

sliderInput("size", "Image size (%)", min = 10, max = 150, value = 80),

radioButtons("which","Show zoom on selected portion of the slide or full slide:", choiceValues=c("selected","full"),
choiceNames=c("10x zoom on selection","full slide"),
selected="full"),

selectInput("comp","Select component:",
choices = comps),


#),

#mainPanel(


# UI output
lapply(1:N, function(i) {
    #    plotOutput(paste0('plot', i),height="100%")
    fluidRow(
         textOutput(paste0('lab', i)),
    imageOutput(paste0('plot', i),height="auto",width="auto")

    )
})
#)
#)
#)
)
