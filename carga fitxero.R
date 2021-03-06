library(stringi)
library(stringr)
library(rebus)
library(dplyr)


setwd("C:/Users/cecil/OneDrive/BUSINESS DATA ANALYTICS/PRIMERO/DATA SCIENCE/RETO 4/EXAMEN DS/Archivos_examen_ds")
load("muestra10.RData", envir = parent.frame(), verbose = FALSE)
dim(muestra10) #dimensiones 335686      3
colnames(muestra10)

#cambiamos nombre de las variables
names (muestra10)[1] = "nif"
names (muestra10)[2] = "nombre"
names (muestra10)[3] = "genero"

#eliminaremos del dataset original todos los registros que no tienen el formato adecuado para esta variable (8 d�gitos y una letra)

nif <-muestra10[1]
regexp <-  grepl('[[:digit:]]{8}[[:alpha:]]{1}', muestra10$nif)
grepl(pattern = regexp, x =muestra10$nif) #no cumple pq no tiene dos digitos

cumple <- which(regexp == T)
final <- muestra10[cumple, ]

#eliminar las filas false

#imputar g�nero
dim(muestra10)

muestra10<-mutate(muestra10,frecuencia=1)

mujeres<-muestra10%>%
  filter(genero=="M")%>%
  group_by(nombre)%>%
  summarise(frec=sum(frecuencia))

todos<-merge(mujeres,hombres)




