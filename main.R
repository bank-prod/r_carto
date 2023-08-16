library(sf)
library(cartography)
library(ggplot2)

district <- read_sf("shapefile/DISTRICTS_SANITAIRES/District.shp")

# Cartography package -----
# plot(st_geometry(district), col = NA, border = "#aadaff", bg = "white")
plot(st_geometry(district), col = NA, border = "orange", bg = "white")

plot(st_geometry(district[district$District%in%c("Ténado","Ziniaré"), ]), col = "orange", border = "orange", bg = "white", add=T)

# labels for a few  municipalities
labelLayer(x = district[district$District%in%c("Ténado","Ziniaré"), ], txt = "District", 
           cex = 0.9, halo = TRUE, r = 0.15)
# title, source, author
layoutLayer(title = "District EDM",
            sources = "Sources: Terre des hommes", 
            author = paste0("cartography ", packageVersion("cartography")), 
            north = FALSE, tabtitle = TRUE, postitle = "right",
            frame = TRUE,
            col = "gray", coltitle = "black") 
# north arrow
north(pos = "topleft")


#GGplot package -----
ggplot() +
  geom_sf(data = district, colour="orange", fill="white")+
  geom_sf(data = district[district$District%in%c("Ténado","Ziniaré"), ], colour = "orange", fill="orange" )+
  geom_sf_label(data = district[district$District%in%c("Ténado","Ziniaré"), ],
                aes(label = District), label.padding = unit(1, "mm"))+
  theme_bw()+
  theme(axis.title = element_blank(),
        axis.text = element_blank(),
        axis.line = element_blank(),
        axis.ticks = element_blank())
  
