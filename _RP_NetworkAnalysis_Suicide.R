#Packages-------------------------------------------------------------------------------------------------------------
library(qgraph)
library(bootnet)
library(ggplot2)
library(readxl)

#Import Data----------------------------------------------------------------------------------------------------------
SuicideBDI <- read_excel("URL of Dataset")
SuicideHAMD <- read_excel("URL of Dataset")
NosuicideBDI <- read_excel("URL of Dataset")
NosuicideHAMD <- read_excel("URL of Dataset")

#Network_Suicide_BDI--------------------------------------------------------------------------------------------------
NetSuiBDI <- estimateNetwork(SuicideBDI,  default = "EBICglasso", tuning = 0.5)
plot(NetSuiBDI, layout = "spring")
CentrSuiBDI <- centrality(NetSuiBDI)
CentrPlotSuiBDI <- centralityPlot(NetSuiBDI)
CentrSuiBDIALL <- centralityPlot(NetSuiBDI, include = c("Strength", "Closeness", "Betweenness"))

#Network_Suicide_HAMD-------------------------------------------------------------------------------------------------
NetSuiHAMD <- estimateNetwork(SuicideHAMD,  default = "EBICglasso", tuning = 0.5)
plot(NetSuiHAMD, layout = "spring")
CentrSuiHAMD <- centrality(NetSuiHAMD)
CentrPlotSuiHAMD <- centralityPlot(NetSuiHAMD)
CentrSuiHAMDALL <- centralityPlot(NetSuiHAMD, include = c("Strength", "Closeness", "Betweenness"))

#Network_Nosuicide_BDI------------------------------------------------------------------------------------------------
NetNosuiBDI <- estimateNetwork(NosuicideBDI,  default = "EBICglasso", tuning = 0.5)
plot(NetNosuiBDI, layout = "spring")
CentrNosuiBDI <- centrality(NetNosuiBDI)
CentrPlotNosuiBDI <- centralityPlot(NetNosuiBDI)
CentrNosuiBDIALL <- centralityPlot(NetNosuiBDI, include = c("Strength", "Closeness", "Betweenness"))

#Network_Nosuicide_HAMD-----------------------------------------------------------------------------------------------
NetNosuiHAMD <- estimateNetwork(NosuicideHAMD,  default = "EBICglasso", tuning = 0.5)
plot(NetNosuiHAMD, layout = "spring")
CentrNosuiHAMD <- centrality(NetNosuiHAMD)
CentrPlotNosuiHAMD <- centralityPlot(NetNosuiHAMD)
CentrNosuiHAMDALL <- centralityPlot(NetNosuiHAMD, include = c("Strength", "Closeness", "Betweenness"))
