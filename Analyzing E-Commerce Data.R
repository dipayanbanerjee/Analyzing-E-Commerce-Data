rm(list = ls())
setwd("~/Documents/Datasets")

# Required Library
library(readr)
library(magrittr)
library(dplyr)
library(tidyr)
library(lubridate)

# Importing Data, Data Overview
data.e_commerce <- read_csv(file = "E-Commerce.csv",col_names = TRUE,trim_ws = TRUE)
View(data.e_commerce)
glimpse(data.e_commerce)

# Feature formatting
data.e_commerce$InvoiceNo <- as.factor(data.e_commerce$InvoiceNo)
levels(data.e_commerce$InvoiceNo)

data.e_commerce$StockCode <- as.factor(data.e_commerce$StockCode)
levels(data.e_commerce$StockCode)

data.e_commerce$Country <- as.factor(data.e_commerce$Country)
levels(data.e_commerce$Country)

data.e_commerce$InvoiceDate <- lubridate::as_date(data.e_commerce$InvoiceDate)
str(data.e_commerce$InvoiceDate)



# Creating Customer table
data.e_commerce %>% select(CustomerID,InvoiceNo,InvoiceDate,UnitPrice,Country) %>% group_by(CustomerID,InvoiceNo) %>% 
  summarise(Total = sum(UnitPrice,na.rm = TRUE)) %>% View()


# Creating 
