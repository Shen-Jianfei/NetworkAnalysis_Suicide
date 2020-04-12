#Packages-------------------------------------------------------------------------------------------------------------
library(readxl) # version 1.3.1
library(qgraph) # version 1.6.5
library(bootnet) # version 1.3
library(ggplot2) # version 3.2.1
library(NetworkComparisonTest) # version 2.2.1

#Import_Data----------------------------------------------------------------------------------------------------------
SuicideBDI <- read_excel("URL of Dataset")
SuicideHAMD <- read_excel("URL of Dataset")
NosuicideBDI <- read_excel("URL of Dataset")
NosuicideHAMD <- read_excel("URL of Dataset")

#Network_Suicide_BDI--------------------------------------------------------------------------------------------------
NetSuiBDI <- estimateNetwork(SuicideBDI,  default = "EBICglasso", tuning = 0.5)
plot(NetSuiBDI, layout = "spring")
plot(NetSuiBDI, layout = "circle")
summary(NetSuiBDI)
CentrSuiBDI <- centrality(NetSuiBDI)
CentrPlotSuiBDI <- centralityPlot(NetSuiBDI)
CentrSuiBDIALL <- centralityPlot(NetSuiBDI, include = c("Strength", "Closeness", "Betweenness"))
CentrSuiBDI$OutDegree

#Network_Suicide_HAMD-------------------------------------------------------------------------------------------------
NetSuiHAMD <- estimateNetwork(SuicideHAMD,  default = "EBICglasso", tuning = 0.5)
plot(NetSuiHAMD, layout = "spring")
plot(NetSuiHAMD, layout = "circle")
summary(NetSuiHAMD)
CentrSuiHAMD <- centrality(NetSuiHAMD)
CentrPlotSuiHAMD <- centralityPlot(NetSuiHAMD)
CentrSuiHAMDALL <- centralityPlot(NetSuiHAMD, include = c("Strength", "Closeness", "Betweenness"))
CentrSuiHAMD$OutDegree

#Network_Nosuicide_BDI------------------------------------------------------------------------------------------------
NetNosuiBDI <- estimateNetwork(NosuicideBDI,  default = "EBICglasso", tuning = 0.5)
plot(NetNosuiBDI, layout = "spring")
plot(NetNosuiBDI, layout = "circle")
summary(NetNosuiBDI)
CentrNosuiBDI <- centrality(NetNosuiBDI)
CentrPlotNosuiBDI <- centralityPlot(NetNosuiBDI)
CentrNosuiBDIALL <- centralityPlot(NetNosuiBDI, include = c("Strength", "Closeness", "Betweenness"))
CentrNosuiBDI$OutDegree

#Network_Nosuicide_HAMD-----------------------------------------------------------------------------------------------
NetNosuiHAMD <- estimateNetwork(NosuicideHAMD,  default = "EBICglasso", tuning = 0.5)
plot(NetNosuiHAMD, layout = "spring")
plot(NetNosuiHAMD, layout = "circle")
summary(NetNosuiHAMD)
CentrNosuiHAMD <- centrality(NetNosuiHAMD)
CentrPlotNosuiHAMD <- centralityPlot(NetNosuiHAMD)
CentrNosuiHAMDALL <- centralityPlot(NetNosuiHAMD, include = c("Strength", "Closeness", "Betweenness"))
CentrNosuiHAMD$OutDegree

#Network_Comparison_Tests_BDI-----------------------------------------------------------------------------------------
NCTBDI <- NCT(SuicideBDI, 
              NosuicideBDI, 
              gamma = 0.5, 
              it = 1000, 
              binary.data = FALSE, paired = FALSE, test.edges = FALSE)
plot(NCTBDI, what = "network")
plot(NCTBDI, what = "strength")
summary(NCTBDI)

#Network_Comparison_Tests_HAMD----------------------------------------------------------------------------------------
NCTHAMD <- NCT(SuicideHAMD, 
              NosuicideHAMD, 
              gamma = 0.5, 
              it = 1000, 
              binary.data = FALSE, paired = FALSE, test.edges = FALSE)
plot(NCTHAMD, what = "network")
plot(NCTHAMD, what = "strength")
summary(NCTHAMD)
