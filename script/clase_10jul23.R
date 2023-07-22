#Clase 10/07/2023 
#Descargar paquetes----
#Cargar paquetes----
lapply(paqueteria,library,character.only=TRUE)
library(tibble)

#visualizacion base de datos original----
str(data_banco)

#arrange verbos de dplyer----
#organiza las columnas como yo quiero es como un filtro personalizado
data_banco %>% arrange(Transaccion,desc(Tiempo_Servicio_seg)) %>% view ("arrangeTiempoSeryTransaccion")
data_banco %>% arrange(desc(Satisfaccion)) %>% view ("arrangeSatisfaccion")
data_banco %>% arrange(Tiempo_Servicio_seg) %>% view ("arrangeTiempoServ2")
data_banco %>% arrange(desc(Tiempo_Servicio_seg)) %>% view ("arrangeTiempoServdesc")

#mutate-transmute----
#crear la variable de tiempo de serv en minutos 
data_banco %>%  mutate(Tiempo_Servicio_min=Tiempo_Servicio_seg/60) %>%  view ("mutate1anadetiempoen min")
#mutate es una funcion que anade la cariable creada a la tabla original 
#transmute crea otra variable y solo guarda las variables nuevas 
data_banco %>%  transmutate(Tiempo_Servicio_min=Tiempo_Servicio_seg/60) %>%  view ("transmutate1tiempoenmin")

#Glimpse----
#Se usa con tibble str
#tibble es una estructura de datos es decir un dataframe MEJORADO 
#puedo descargar el paquete o puedo coersionar el objeto
data_banco <- tibble::as_tibble(data_banco)
glimpse(data_banco)


data_banco_3 <- data_banco %>% mutate(Monto=str_replace(Monto,pattern=",",replacement=".")) %>% 
  mutate(Sucursal=as.character(Sucursal),
         Cajero=as.character(Cajero),
         Satisfaccion=parse_factor(Satisfaccion,levels=c("Muy Malo","Malo","Regular","Bueno","Muy Bueno"),ordered=T),
         Monto=parse_number(Monto,locale=locale(decimal_mark = ".")))
glimpse(data_banco_3)
