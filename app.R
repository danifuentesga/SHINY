# ---------- GLOBAL ----------

library(shiny)

# ---------- Ui ----------

ui <- navbarPage(
  title = div(
    style="display:flex; align-items:center; margin-left:120px;",
    tags$img(src="nafe.png", style="height:100px; margin-right:20px;")
  ),
  
  theme = NULL,
  
  header = tags$head(
    # Fuente moderna desde Google Fonts
    tags$link(rel = "stylesheet", 
              href = "https://fonts.googleapis.com/css2?family=Montserrat:wght@400;600&display=swap"),
    
    tags$style(HTML("
    body {
      font-family: 'Montserrat', sans-serif;
    }

    /* Scroll suave a las secciones */
    html { scroll-behavior: smooth; }

    /* Navbar full width */
    .navbar .container {
      width: 100% !important;
      max-width: 100% !important;
      padding-left: 0;
      padding-right: 0;
    }
    .navbar-default {
      background-color: white;
      border-color: white;
      min-height: 80px;   /* altura navbar para que quepa el logo */
    }
    .navbar-brand {
      padding: 0px 15px;
      height: auto;
    }
    /* Tabs */
    .navbar-default .navbar-nav {
      margin-left: 50px;   /* empuja títulos a la derecha */
    }
    .navbar-default .navbar-nav > li > a {
      color: #008B8B; 
      font-weight: 600;
      font-size: 22px;
      font-family: 'Montserrat', sans-serif;
      line-height: 50px;   /* alinea verticalmente con logo */
    }
    .navbar-default .navbar-nav > li > a:hover {
      color: #006666;
      background-color: #E6F7F7;
    }
    .navbar-default .navbar-nav > .active > a {
      color: white !important;
      background-color: #008B8B !important;
    }

    /* Títulos */
    h1, h2, h3 {
      font-family: 'Montserrat', sans-serif;
      font-weight: 600;
    }

    /* Cuadros clicables con imagen de fondo */
    .tile-link { text-decoration: none !important; }
    .tile {
      cursor: pointer;
      margin: 20px auto;
      max-width: 900px;
      height: 140px;
      border-radius: 14px;
      display: flex;
      align-items: center;
      justify-content: center;
      background-size: cover;
      background-position: center;
      box-shadow: 0 10px 24px rgba(0,0,0,0.15);
      position: relative;
      overflow: hidden;
      transition: transform .2s ease, box-shadow .2s ease;
    }
    .tile:hover {
  transform: scale(1.12); /* 👈 zoom más grande (10–12%) */
  box-shadow: 0 18px 40px rgba(0,0,0,0.35);
  z-index: 5;             /* asegura que se vea encima */
}

    .tile::before {
      content: '';
      position: absolute; inset: 0;
      background: rgba(255,255,255,0.0); /* transparente total (si quieres velo pon 0.1-0.2) */
    }
    .tile-content {
  position: relative;
  color: white;        /* 👈 todo el texto en blanco */
  text-align: center;
  padding: 16px 24px;
  font-family: 'Montserrat', sans-serif;
}
.tile-content h3 { margin: 0 0 6px 0; font-weight: 700; color: white; }
.tile-content p  { margin: 0; color: white; }

  "))
  )
  
  
  ,
  
  ## ---------- INICIO ----------
  tabPanel("INICIO",
           fluidPage(
             tags$head(
               tags$style(HTML("
               #welcome-message {
                 opacity: 0;
                 transform: translateY(30px);
                 transition: opacity 3s ease, transform 3s ease;
               }
               #welcome-message.show {
                 opacity: 1;
                 transform: translateY(0);
               }

               /* Tarjetas indicadores */
               .card-container {
                 display: flex;
                 justify-content: space-around;
                 flex-wrap: nowrap;   /* 👈 fuerza a una fila */
                 gap: 20px;
                 margin-top: 50px;
               }
               .card {
                 background-color: rgba(255,255,255,0.9);
                 color: #008B8B;
                 border-radius: 12px;
                 padding: 40px 20px;
                 flex: 1;   /* 👈 cada tarjeta se adapta al ancho disponible */
                 text-align: center;
                 box-shadow: 0 6px 18px rgba(0,0,0,0.2);
                 transition: transform 0.3s ease, box-shadow 0.3s ease;
                 min-width: 200px;
               }
               .card:hover {
                 transform: scale(1.1);
                 box-shadow: 0 12px 28px rgba(0,0,0,0.3);
               }
               .card h3 {
                 font-size: 40px;    /* 👈 número más grande */
                 margin-bottom: 15px;
                 font-weight: 800;
               }
               .card p {
                 font-size: 20px;    /* 👈 texto más grande */
                 margin: 0;
               }
             ")),
               tags$script(HTML("
               document.addEventListener('DOMContentLoaded', function() {
                 var msg = document.getElementById('welcome-message');
                 if(msg){
                   msg.classList.add('show');
                 }
               });
             "))
             ),
             
             div(
               style="
               width:100%; 
               margin-top:5px;             
               padding:180px 20px; 
               text-align:center; 
               background-image: url('fondo3.png'); 
               background-size: cover; 
               background-position: center; 
               background-repeat: no-repeat;
               color:white;
             ",
               
               div(
                 id="welcome-message",
                 style="max-width:1000px; margin:auto;",
                 
                 h2("Bienvenido al Observatorio de Natalidad y Fecundidad en México",
                    style="font-weight:700; font-size:32px; color:white; margin-bottom:30px;"),
                 
                 p("Aquí encontrarás tendencias, datos y visualizaciones interactivas que muestran cómo cambió la historia poblacional de México.",
                   style="font-size:20px; color:white;"),
                 
                 # TARJETAS
                 div(class="card-container",
                     # Tarjeta con icono personalizado
                     div(class="card",
                         tags$img(src="icono_nat.png", 
                                  style="height:160px; margin-bottom:1px;"),  # 👈 tu icono
                         h3("17.5", style="margin-top:0;"),
                         p("Tasa de Natalidad")
                     )
                     ,
                     # Tarjeta con icono personalizado para Fecundidad
                     div(class="card",
                         tags$img(src="icono_fec.png", 
                                  style="height:160px; margin-bottom:1px;"),  # 👈 icono de fecundidad
                         h3("1.9", style="margin-top:0;"),
                         p("Tasa de Fecundidad")
                     )
                     ,
                     # Tarjeta con icono personalizado para Mortalidad
                     div(class="card",
                         tags$img(src="icono_mort.png", 
                                  style="height:160px; margin-bottom:1px;"),  # 👈 icono de mortalidad
                         h3("2.4%", style="margin-top:0;"),
                         p("Tasa de Mortalidad")
                     )
                     ,
                     # Tarjeta con icono personalizado para Proyección
                     div(class="card",
                         tags$img(src="icono_pro.png", 
                                  style="height:160px; margin-bottom:1px;"),  # 👈 icono de proyección
                         h3("1.7", style="margin-top:0;"),
                         p("Proyección 2050")
                     )
                     
                 )
               )
             )
           )
  )
  
  ,
  
  ## ---------- PREGUNTA ----------
  tabPanel("PREGUNTA",
           fluidPage(
             div(
               style="
               width:100%; 
               padding:180px 20px; 
               text-align:center; 
               background-image: url('fondo6.png'); 
               background-size: cover; 
               background-position: center; 
               background-repeat: no-repeat;
               color:white;
             ",
               h2("Nuestra pregunta", 
                  style="font-size:32px; font-weight:600;"),
               p("¿Cómo han cambiado las tasas de fecundidad y natalidad en México en los últimos 20 años?",
                 style="font-size:18px; max-width:900px; margin:auto;")
             )
           )
  ),
  
  ## ---------- DATOS ----------
  tabPanel("DATOS",
           fluidPage(
             div(
               style="
               width:100%; 
               padding:120px 20px; 
               text-align:center; 
               background-image: url('fondo5.png'); 
               background-size: cover; 
               background-position: center; 
               background-repeat: no-repeat;
               color:white;
             ", id = "datos",
               
               h2("¿Con qué trabajamos?", 
                  style="font-size:32px; font-weight:600;"),
               p("Datos de INEGI, CONAPO y encuestas poblacionales.",
                 style="font-size:18px; max-width:900px; margin:auto;"),
               br(),
               
               # CUADRO clicable Natalidad (imagen de fondo)
               a(href = "#natalidad", class = "tile-link",
                 div(class = "tile", style = "background-image:url('fondo_nat.png');",
                     div(class = "tile-content",
                         h3("Natalidad en México"),
                         p("Haz clic para ver más sobre natalidad.")
                     )
                 )
               )
               ,
               
               # CUADRO clicable Fecundidad (imagen de fondo)
               a(href = "#fecundidad", class = "tile-link",
                 div(class = "tile", style = "background-image:url('fondo_fec.png');",
                     div(class = "tile-content",
                         h3("Fecundidad en México"),
                         p("Haz clic para ver más sobre fecundidad.")
                     )
                 )
               )
               ,
               
               # CUADRO clicable Mortalidad (imagen de fondo)
               a(href = "#mortalidad", class = "tile-link",
                 div(class = "tile", style = "background-image:url('fondo_mort.png');",
                     div(class = "tile-content",
                         h3("Mortalidad en México"),
                         p("Haz clic para ver más sobre mortalidad.")
                     )
                 )
               )
               ,
               
               br(), br(),
               
               #### ---------- NATALIDAD ----------
               div(
                 id = "natalidad",
                 style = "
    margin:40px auto; 
    padding:80px 50px; 
    background-image:url('fondo_nat.png'); 
    background-size:cover; 
    background-position:center; 
    background-repeat:no-repeat; 
    color:white; 
    border-radius:12px; 
    max-width:1000px;
  ",
                 h1("Natalidad", style="font-weight:700; color:white;"),
                 p("Aquí se presentan los principales indicadores y tendencias sobre la natalidad en México.",
                   style="font-size:18px; color:white; max-width:900px; margin:auto;")
               )
               ,
               
               #### ---------- FECUNDIDAD ----------
               div(
                 id = "fecundidad",
                 style = "
    margin:40px auto; 
    padding:80px 50px; 
    background-image:url('fondo_fec.png'); 
    background-size:cover; 
    background-position:center; 
    background-repeat:no-repeat; 
    color:white; 
    border-radius:12px; 
    max-width:1000px;
  ",
                 h1("Fecundidad", style="font-weight:700; color:white;"),
                 p("Aquí se muestran los datos y hallazgos sobre fecundidad en México.",
                   style="font-size:18px; color:white; max-width:900px; margin:auto;")
               )
               ,
               
               ##### ---------- MORTALIDAD ----------
               div(
                 id = "mortalidad",
                 style = "
    margin:40px auto; 
    padding:80px 50px; 
    background-image:url('fondo_mort.png'); 
    background-size:cover; 
    background-position:center; 
    background-repeat:no-repeat; 
    color:white; 
    border-radius:12px; 
    max-width:1000px;
  ",
                 
                 h1("Mortalidad", style="font-weight:700; color:white;"),
                 
                 p("Aquí se detallan los principales indicadores de mortalidad en México.",
                   style="font-size:18px; color:white; max-width:900px; margin:auto;"),
                 
                 # --- Gráfica Mortalidad ---
                 plotlyOutput("grafico_mortalidad", height = "500px"),
                 
                 # Botón después de la gráfica
                 div(
                   style = "margin-top:20px; text-align:center;",
                   tags$a("↩ Volver a DATOS", 
                          href = "#datos", 
                          style = "font-family:Montserrat, sans-serif; 
                    font-weight:bold; 
                    font-size:16px; 
                    color:white; 
                    background-color:darkturquoise; 
                    padding:10px 20px; 
                    border-radius:6px; 
                    text-decoration:none;")
                 ),
                 
                 br(), br(),
                 
                 # --- Filtros Año y Sexo ---
                 selectInput("year", "Selecciona un año:", choices = 2010:2024, selected = 2010),
                 selectInput("sexo", "Selecciona sexo:", choices = c("Hombres" = 1, "Mujeres" = 0), selected = 1),
                 
                 br(),
                 
                 # --- Mapa ---
                 leafletOutput("mapa_mortalidad", height = "600px"),
                 
                 # Botón después del mapa
                 div(
                   style = "margin-top:20px; text-align:center;",
                   tags$a("↩ Volver a DATOS", 
                          href = "#datos", 
                          style = "font-family:Montserrat, sans-serif; 
                    font-weight:bold; 
                    font-size:16px; 
                    color:white; 
                    background-color:darkturquoise; 
                    padding:10px 20px; 
                    border-radius:6px; 
                    text-decoration:none;")
                 ),
                 
                 br(), br(),
                 
                 # --- Nueva Gráfica de Sobremortalidad ---
                 plotlyOutput("grafico_sobremortalidad", height = "500px"),
                 
                 # Botón después de la gráfica de sobremortalidad
                 div(
                   style = "margin-top:20px; text-align:center;",
                   tags$a("↩ Volver a DATOS", 
                          href = "#datos", 
                          style = "font-family:Montserrat, sans-serif; 
                    font-weight:bold; 
                    font-size:16px; 
                    color:white; 
                    background-color:darkturquoise; 
                    padding:10px 20px; 
                    border-radius:6px; 
                    text-decoration:none;")
                 )
               )
               
               
               
               
               
             )
           )
  )
  
  
  ,
  
  ## ---------- RESULTADOS ----------
  tabPanel("RESULTADOS",
           fluidPage(
             div(
               style="
               width:100%; 
               padding:180px 20px; 
               text-align:center; 
               background-image: url('fondo3.png'); 
               background-size: cover; 
               background-position: center; 
               background-repeat: no-repeat;
               color:white;
             ",
               h2("Resultados principales", 
                  style="font-size:32px; font-weight:600;"),
               plotOutput("grafico1", height="400px")
             )
           )
  )
  ,
  
  
  ## ---------- CONCLUSIONES ----------
  tabPanel("CONCLUSIONES",
           fluidPage(
             div(
               style="
               width:100%; 
               padding:180px 20px; 
               text-align:center; 
               background-image: url('fondo6.png'); 
               background-size: cover; 
               background-position: center; 
               background-repeat: no-repeat;
               color:white;
             ",
               h2("Conclusiones", 
                  style="font-size:32px; font-weight:600;"),
               p("Los resultados muestran cambios importantes con implicaciones en política pública.",
                 style="font-size:18px; max-width:900px; margin:auto;")
             )
           )
  )
  
)




# ---------- SERVER  ----------

server <- function(input, output, session) {
  
  ### ---------- GRAFICO PLOTLY ----------
  
  output$grafico_mortalidad <- renderPlotly({
    
    # Leer base dentro de Shiny
    mortalidad <- readr::read_csv("www/mortalidad.csv")
    
    # Plot
    plot_ly(
      data = mortalidad,
      x = ~periodo,
      y = ~mortalidad,
      type = 'bar',
      marker = list(color = '#40E0D0'),
      hovertemplate = paste(
        "<b>Año:</b> %{x}<br>",
        "<b>Defunciones registradas:</b> %{y:,}<extra></extra>"
      )
    ) %>%
      layout(
        title = list(
          text = "Defunciones registradas en México",
          font = list(family = "Montserrat, sans-serif", size = 34, color = "#008B8B"),
          x = 0.5,
          y = 0.95,
          xanchor = "center",
          yanchor = "top"
        ),
        xaxis = list(
          title = "Año",
          tickfont = list(family = "Montserrat, sans-serif", size = 18, color = "black"),
          titlefont = list(family = "Montserrat, sans-serif", size = 20, color = "black")
        ),
        yaxis = list(
          title = "Número de defunciones",
          tick0 = 100000,
          dtick = 100000,
          tickformat = ",",
          tickfont = list(family = "Montserrat, sans-serif", size = 18, color = "black"),
          titlefont = list(family = "Montserrat, sans-serif", size = 20, color = "black")
        ),
        margin = list(t = 100),
        font = list(family = "Montserrat, sans-serif")
      )
  })
  
  # ---------- MAPA LEAFLET ----------
  output$mapa_mortalidad <- renderLeaflet({
    validate(
      need(input$year, "Selecciona un año"),
      need(input$sexo, "Selecciona sexo")
    )
    
    mexico <- st_read("www/mexico.shp", quiet = TRUE)
    mortalidad <- read.csv("www/base_mortalidad.csv", fileEncoding = "UTF-8")
    
    mexico$CVE_ENT <- as.character(mexico$CVE_ENT)
    mortalidad$CVE_ENT <- sprintf("%02d", mortalidad$CVE_ENT)
    
    mortalidad_sel <- mortalidad %>%
      filter(periodo == input$year, sexo == input$sexo)
    
    mexico_data <- left_join(mexico, mortalidad_sel, by = "CVE_ENT")
    mexico_leaflet <- st_transform(mexico_data, crs = 4326)
    
    # Paleta
    pal <- colorNumeric(
      palette = c("azure", "darkturquoise"),
      domain = mexico_leaflet$mortalidad
    )
    
    # 1) Construir las etiquetas (una por feature)
    labels <- sprintf(
      "<div style='font-family:Montserrat, sans-serif;'>
     <b style='color:darkturquoise;'>%s</b><br>
     <span style='color:black;'>Defunciones: %s</span>
   </div>",
      mexico_leaflet$entidad,
      scales::comma(mexico_leaflet$mortalidad)
    ) |> lapply(htmltools::HTML)
    
    # 2) Mapa
    leaflet(mexico_leaflet) %>%
      addPolygons(
        fillColor   = ~pal(mortalidad),
        weight      = 1, color = "black",
        fillOpacity = 0.8,
        label       = labels,                      # ← vector 1:1 con las features
        highlight   = highlightOptions(
          weight = 3, color = "white", fillOpacity = 0.9, bringToFront = TRUE
        ),
        labelOptions = labelOptions(
          style = list("font-family" = "Montserrat, sans-serif",
                       "font-size"   = "13px"),
          direction = "auto",
          sticky    = FALSE                        # ← que NO se acumulen
        )
      ) %>%
      addLegend(pal = pal, values = ~mortalidad, opacity = 0.7,
                title = "Defunciones", position = "bottomright")%>%
      addControl(
        html = "<div style='font-family:Montserrat, sans-serif; 
                       font-weight:bold; 
                       font-size:18px; 
                       color:black; 
                       background:white; 
                       padding:6px; 
                       border-radius:6px; 
                       box-shadow: 2px 2px 5px rgba(0,0,0,0.3);'>
              Defunciones Anuales por Entidad Federativa y Sexo
            </div>",
        position = "topright"
      )
    
    
  })
  
  # ---------- SOBRE MORTALIDAD----------
  
  output$grafico_sobremortalidad <- renderPlotly({
    
    # Leer base dentro de Shiny
    sobre_mortalidad <- readr::read_csv("www/sobremortalidad.csv")
    
    # Plot
    plot_ly(
      data = sobre_mortalidad,
      x = ~periodo,
      y = ~sobre_masc,
      type = 'bar',
      marker = list(color = '#40E0D0'),
      hovertemplate = paste(
        "<b>Año:</b> %{x}<br>",
        "<b>Defunciones masculinas por cada 100 femeninas:</b> %{y}<extra></extra>"
      )
    ) %>%
      layout(
        title = list(
          text = "Sobremortalidad masculina en México",
          font = list(family = "Montserrat, sans-serif", size = 34, color = "#008B8B"),
          x = 0.5,
          y = 0.95,
          xanchor = "center",
          yanchor = "top"
        ),
        xaxis = list(
          title = "Año",
          tickfont = list(family = "Montserrat, sans-serif", size = 18, color = "black"),
          titlefont = list(family = "Montserrat, sans-serif", size = 20, color = "black")
        ),
        yaxis = list(
          title = "Sobremortalidad",
          tickfont = list(family = "Montserrat, sans-serif", size = 18, color = "black"),
          titlefont = list(family = "Montserrat, sans-serif", size = 20, color = "black")
        ),
        margin = list(t = 120),
        font = list(family = "Montserrat, sans-serif"),
        
        # Nota aclaratoria
        annotations = list(
          list(
            text = "Nota: Defunciones masculinas por cada 100 femeninas",
            font = list(family = "Montserrat, sans-serif", size = 14, color = "black"),
            showarrow = FALSE,
            xref = "paper", yref = "paper",
            x = 0, y = -0.15,     # posición debajo del eje x
            xanchor = "left", yanchor = "auto"
          )
        )
      )
  })
  
  
  
}


shinyApp(ui = ui, server = server)






