#ANALISIS EXPLORATORIO DE DATOS #

#CARGAR LIBRERIAS#
#install.packages("openxlsx")
library(openxlsx)
#install.packages("ggthemes")
library(ggthemes)
#install.packages("DataExplorer")
library(DataExplorer)
library(dplyr)
library(plotly)
library(magrittr)

#cargar BD#

datos <- read.xlsx("Autoridad_indigena.xlsx",
                   sheet ="Hoja5") # , detectDates = T detectar colunas tipo dat
#seleccionar despues de la 4 columna

datos1 <- datos[,5:ncol(datos)]

#ploteo basico
str(datos1)
head(datos1)
ts.plot(datos1$MES.ACTUALIZACION)
View(datos1)
 
df <- summarise(datos1, censos = count(datos1,MES.ACTUALIZACION))
df1 <- group_by(datos1,MES.ACTUALIZACION)
View(df1)  

plot_histogram(df)

h <- plot_ly(df, x= df$censos, name ="censos 2022",  type= "bar")


df2 <- datos %>% group_by(MES.ACTUALIZACION) %>% summarise(conteo = n())

attach(datos)
pormes =aggregate(NOMBRES ~ MES.ACTUALIZACION, data = datos, FUN = count)