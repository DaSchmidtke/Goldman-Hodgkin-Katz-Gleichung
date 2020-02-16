#install.packages("shiny")
#install.packages("shinyWidgets")
#install.packages("ggplot2")
#install.packages("jpeg")
library(shiny)
library(shinyWidgets)
library(ggplot2)
library(jpeg)

ui <- fluidPage(
  
  titlePanel("Goldman-Hodgkin-Katz-Gleichung"),
  h2(""),
  
  imageOutput("Gleichung", height = "25%"),
  #img(src = "Gleichung2.jpg", height = 68, width = 550),
  h2(""),
  
  shinyjs::useShinyjs(),
  
  fluidRow(
    
    
    column(4,
           h4("Relative Permeabilitaet"),
  
  sliderInput(inputId = "PNa",
               label = "Natrium-Ionen",
               value = 0.04, min = 0, max = 20, width = "100%", step = 0.04),
  sliderInput(inputId = "PK",
               label = "Kalium-Ionen",
               value = 1, min = 0, max = 20, width = "100%"),
  sliderInput(inputId = "PCl",
               label = "Chlorid-Ionen",
               value = 0.45, min = 0, max = 20, width = "100%", step = 0.04)
  
  ),
  
  
    
  column(4,
         
         h4("Innenkonzentration [mmol/l]"),
  
  sliderInput(inputId = "IntraNa",
               label = "Natrium-Ionen",
               value = 15, min = 0, max = 600, width = "100%"),
  sliderInput(inputId = "IntraK",
               label = "Kalium-Ionen",
               value = 140, min = 0, max = 600, width = "100%"),
  sliderInput(inputId = "IntraCl",
               label = "Chlorid-Ionen",
               value = 10, min = 0, max = 600, width = "100%")
  
    
  ),
    
  
    column(4,
           h4("Aussenkonzentration [mmol/l]"),
  
  sliderInput(inputId = "ExtraNa",
               label = "Natrium-Ionen",
               value = 150, min = 0, max = 600, width = "100%"),
  sliderInput(inputId = "ExtraK",
               label = "Kalium-Ionen",
               value = 5, min = 0, max = 600, width = "100%"),
  sliderInput(inputId = "ExtraCl",
               label = "Chlorid-Ionen",
               value = 120, min = 0, max = 600, width = "100%")
    ),
  

  
    column(4,
           h2(""),
           h3("Oszillogramm"),
  #setBackgroundImage(src = "Oszi.jpg"),
  #img(src = "Oszi.jpg", height = 300, width = 600),
  plotOutput(outputId = "plot1")
  #uiOutput(outputId = "MP"))
  ),
  
  column(4,
         h2(""),
         h3("Variablen"),
         uiOutput(outputId = "Perms"),
         uiOutput(outputId = "Intras"),
         uiOutput(outputId = "Extras"),
         h4(" "),
         h3("Konstanten"),
         h5("R =  8.314 (kPa*L)/(mol*K)"),
         h5(paste("T = 310.150 K \u2259 37\u00B0C")),
         h5("F = 96485.332 A/mol")
         ),
  
  column(4,
         #setBackgroundImage(src = "Oszi.jpg"),
         #img(src = "Oszi.jpg", height = 300, width = 600),
         #plotOutput(outputId = "plot1"),
         h3("Berechnungen"),
         #setBackgroundImage(src = "Oszi.jpg"),
         #img(src = "Oszi.jpg", height = 300, width = 600),
         #plotOutput(outputId = "plot1"),
         uiOutput(outputId = "MP"),
         uiOutput(outputId = "MP2"),
         uiOutput(outputId = "MP3"),
         uiOutput(outputId = "MP4"),
         radioButtons(inputId = "Presets", h3("Voreinstellungen"),
                     choices = list("Keine"=1, 
                                    "Ruhepotential: Cephalopoda"=2, 
                                    "Aktionspotential (Peak): Cephalopoda"=3, 
                                    "Ruhepotential: Mammalia"=4, 
                                    "Aktionspotential (Peak): Mammalia"=5), selected=1)

  )
  
  
  
)
)

server <- function(input, output, session) {
  observe({
    
    val <-  input$Presets
    
    if(val==2){
      updateSliderInput(session, "PNa", value = 0.03)
      updateSliderInput(session, "PK", value = 1)
      updateSliderInput(session, "PCl", value = 0.1)
      updateSliderInput(session, "ExtraNa", value = 440)
      updateSliderInput(session, "ExtraK", value = 20)
      updateSliderInput(session, "ExtraCl", value = 560)
      updateSliderInput(session, "IntraNa", value = 50)
      updateSliderInput(session, "IntraK", value = 400)
      updateSliderInput(session, "IntraCl", value = 40)
      shinyjs::disable("PNa")    
      shinyjs::disable("PCl")
      shinyjs::disable("ExtraNa")
      shinyjs::disable("ExtraK")
      shinyjs::disable("ExtraCl")
      shinyjs::disable("IntraNa")
      shinyjs::disable("IntraK")
      shinyjs::disable("IntraCl")
    }
    else if(val==3){
      updateSliderInput(session, "PNa", value = 12)
      updateSliderInput(session, "PK", value = 1)
      updateSliderInput(session, "PCl", value = 0.45)
      updateSliderInput(session, "ExtraNa", value = 440)
      updateSliderInput(session, "ExtraK", value = 20)
      updateSliderInput(session, "ExtraCl", value = 560)
      updateSliderInput(session, "IntraNa", value = 50)
      updateSliderInput(session, "IntraK", value = 400)
      updateSliderInput(session, "IntraCl", value = 40)
      shinyjs::disable("PNa")    
      shinyjs::disable("PCl")
      shinyjs::disable("ExtraNa")
      shinyjs::disable("ExtraK")
      shinyjs::disable("ExtraCl")
      shinyjs::disable("IntraNa")
      shinyjs::disable("IntraK")
      shinyjs::disable("IntraCl")
    }
    else if(val==4){
      updateSliderInput(session, "PNa", value = 0.04)
      updateSliderInput(session, "PK", value = 1)
      updateSliderInput(session, "PCl", value = 0.45)
      updateSliderInput(session, "ExtraNa", value = 150)
      updateSliderInput(session, "ExtraK", value = 5)
      updateSliderInput(session, "ExtraCl", value = 120)
      updateSliderInput(session, "IntraNa", value = 15)
      updateSliderInput(session, "IntraK", value = 140)
      updateSliderInput(session, "IntraCl", value = 10)
      shinyjs::disable("PNa")    
      shinyjs::disable("PCl")
      shinyjs::disable("ExtraNa")
      shinyjs::disable("ExtraK")
      shinyjs::disable("ExtraCl")
      shinyjs::disable("IntraNa")
      shinyjs::disable("IntraK")
      shinyjs::disable("IntraCl")
    }
    else if(val==5){
      updateSliderInput(session, "PNa", value = 15)
      updateSliderInput(session, "PK", value = 1)
      updateSliderInput(session, "PCl", value = 0.1)
      updateSliderInput(session, "ExtraNa", value = 150)
      updateSliderInput(session, "ExtraK", value = 5)
      updateSliderInput(session, "ExtraCl", value = 120)
      updateSliderInput(session, "IntraNa", value = 15)
      updateSliderInput(session, "IntraK", value = 140)
      updateSliderInput(session, "IntraCl", value = 10)
      shinyjs::disable("PNa")    
      shinyjs::disable("PCl")
      shinyjs::disable("ExtraNa")
      shinyjs::disable("ExtraK")
      shinyjs::disable("ExtraCl")
      shinyjs::disable("IntraNa")
      shinyjs::disable("IntraK")
      shinyjs::disable("IntraCl")
    }
    else if(val==1){
      shinyjs::enable("PNa")
      shinyjs::enable("PCl")
      shinyjs::enable("ExtraNa")
      shinyjs::enable("ExtraK")
      shinyjs::enable("ExtraCl")
      shinyjs::enable("IntraNa")
      shinyjs::enable("IntraK")
      shinyjs::enable("IntraCl")
    }
  })
  
  output$Gleichung <- renderImage({
    
    filename <- "./www/Gleichung.jpg"
    list(src = filename)
  }, deleteFile = FALSE)
  
  output$MP <- renderUI({
    paste("Membranpotential = ", as.character(round((8.314*310.15/96485.33289)*log(((input$PNa*input$ExtraNa)+(input$PK*input$ExtraK)+(input$PCl*input$IntraCl))/((input$PNa*input$IntraNa)+(input$PK*input$IntraK)+(input$PCl*input$ExtraCl)))*1000, digits=2)), " mV")
    #paste("Membranpotential = ", as.character((8.314*310.15/96485.33289)*input$ExtraNa))
          #*log(((input$PNa*input$ExtraNa)+(input$PK*input$ExtraK)+(input$PCl*input$IntraCl))/((input$PNa*input$IntraNa)+(input$PK*input$IntraK)+(input$PCl*input$ExtraCl)))))
    })
  
  output$MP2 <- renderUI({
    paste("Nernstpotential (Na) = ", as.character(round((8.314*310.15/96485.33289)*log(input$ExtraNa/input$IntraNa)*1000, digits=2)), " mV")
    #paste("Membranpotential = ", as.character((8.314*310.15/96485.33289)*input$ExtraNa))
    #*log(((input$PNa*input$ExtraNa)+(input$PK*input$ExtraK)+(input$PCl*input$IntraCl))/((input$PNa*input$IntraNa)+(input$PK*input$IntraK)+(input$PCl*input$ExtraCl)))))
  })
  
  output$MP3 <- renderUI({
    paste("Nernstpotential (K) = ", as.character(round((8.314*310.15/96485.33289)*log(input$ExtraK/input$IntraK)*1000, digits=2)), " mV")
    #paste("Membranpotential = ", as.character((8.314*310.15/96485.33289)*input$ExtraNa))
    #*log(((input$PNa*input$ExtraNa)+(input$PK*input$ExtraK)+(input$PCl*input$IntraCl))/((input$PNa*input$IntraNa)+(input$PK*input$IntraK)+(input$PCl*input$ExtraCl)))))
  })
  
  output$MP4 <- renderUI({
    paste("Nernstpotential (Cl) = ", as.character(round((8.314*310.15/96485.33289)*log(input$IntraCl/input$ExtraCl)*1000, digits=2)), " mV")
    #paste("Membranpotential = ", as.character((8.314*310.15/96485.33289)*input$ExtraNa))
    #*log(((input$PNa*input$ExtraNa)+(input$PK*input$ExtraK)+(input$PCl*input$IntraCl))/((input$PNa*input$IntraNa)+(input$PK*input$IntraK)+(input$PCl*input$ExtraCl)))))
  })
  
  output$Perms <- renderUI({
    HTML(paste("Relative Permeabilitaeten: ", paste("K: ", input$PK, "; Na: ", input$PNa, "; Cl: ", input$PCl, sep = ""), sep="<br/>"))
  })
  
  output$Extras <- renderUI({
    HTML(paste("Aussenkonzentrationen: ", paste("K: ", input$ExtraK, " mmol/l; Na: ", input$ExtraNa, " mmol/l; Cl: ", input$ExtraCl, " mmol/l"), sep="<br/>"))
  })
  
  output$Intras <- renderUI({
    HTML(paste("Innenkonzentrationen: ", paste("K: ", input$IntraK, " mmol/l; Na: ", input$IntraNa, " mmol/l; Cl: ", input$IntraCl, " mmol/l"), sep="<br/>"))
  })
  
  shinyjs::disable("PK")
  
  output$plot1 <- renderPlot({
    
    x <- seq(0,
             4, 
             by = 1)
    

    newY <- ((8.314*310.15/96485.33289)*log(((input$PNa*input$ExtraNa)+(input$PK*input$ExtraK)+(input$PCl*input$IntraCl))/((input$PNa*input$IntraNa)+(input$PK*input$IntraK)+(input$PCl*input$ExtraCl)))*1000)
    
    y <- c(newY, newY, newY, newY, newY)
    
    dat <- data.frame(Zeit = x,
                      Spannung = y)
    
    datPoint <- data.frame(Zeit = x[3],
                           Spannung = y[3])
    
    #oszi <- readJPEG("Oszi.jpg")
    #rasterImage(oszi, xleft=0, xright=5, ybottom=-100, ytop=100)
    #points(x,y)
    
    ggplot(dat, aes(x=Zeit,y=Spannung))+
      #geom_point()+
      geom_point(data=datPoint, mapping=aes(x=Zeit,y=Spannung), color="green", size=5) +
      geom_point(data=datPoint, mapping=aes(x=Zeit,y=Spannung), color="white", size=4) +
      geom_line(color="green", size=2)+
      geom_line(color="white", size=1)+
      #geom_hline(yintercept=0, size=0.5)+
      xlim(0,4)+
      ylim(-100,100)+
      xlab("Zeit [ms]")+
      ylab("Spannung [mV]")+
      theme(axis.text=element_text(size=12), axis.title=element_text(size=14,face="bold"))+
      theme(panel.background = element_rect(fill = 'dark green', colour = 'black'))+
      theme(panel.grid.minor = element_blank())
    #plot(x,y, xlab = "Time", ylab = "Membranpotential [mV]", xlim = c(0,5), ylim = c(-100,100))
    
    
    }, height = 280)
  
  
  
}

#options(browser = "C:/Program Files (x86)/Mozilla Firefox/firefox.exe")
#options(launch.browser =T)
options(shiny.port = 7924)
shinyApp(ui = ui, server = server)
