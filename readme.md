## Goldman-Hodgkin-Katz-Gleichung

Diese Shiny-App ist eine interaktive Version der Goldman-Hodkin-Katz/Gleichung zur Berechnung des Membranpotentials einer Zelle in Abhängigkeit der relativen Permeabilitäten sowie der inneren and äußeren Konzentrationen verschiedener Ionenspezies (Kalium, Natrium und Chlorid).

Die Gleichung lautet wie folgt:


![Equation](/www/Equation.jpg)

### Interaktive Benutzeroberfläche
In der laufenden App kann man verschiedene Werte für die relativen Permeabilitäten sowie die extra- und intrazellulären Ionenkonzentrationen  von Kalium, Natrium und Chlor auswählen, um zu simulieren, wie diese das Membranpotential beeinflussen.


![Sliders](/www/Slider.jpg)

Please note that the permeability of potassium cannot be changed, as the permeabilities for sodium and chloride ions are specified relative to that for potassium (P(K) = 1).

### Output
The output panel of the App provides both, graphical output in form of an oscillogram, showing the current membrane potential in mV, and text output of the calculated membrane potential as well as the Nernst potentials for each ion species at the chosen concentrations.

![Output](/www/Output.jpg)

Finally, the App allows you to choose between the following presets:

Resting membrane potential of a cephalopod neuron\
Peak membrane potential of a cephalopod neuron during spiking\
Resting membrane potential of a mammalian neuron\
Peak membrane potential of a mammalian neuron during spiking


## Local installation

Make sure that you have R and the following R packages installed on your machine and loaded in your R session:

**shiny**, **shinyWidgets**, **shinyjs**, **ggplot2**, **jpeg**

    # Install packages from the R console via:
    install.packages("shiny")
    install.packages("shinyWidgets")
    install.packages("shinyjs")
    install.packages("ggplot2")
    install.packages("jpeg")
    
    # Load packages from the R console via:
    library(shiny)
    library(shinyWidgets)
    library(shinyjs)
    library(ggplot2)
    library(jpeg)
    
## Using the App locally

Once you have installed and loaded all the packages, you can start the App from the R console using:

    runGitHub( "Goldman-Hodgkin-Katz-Equation", "DaSchmidtke")
    
## Using the App online

An online version of the App can be found here:

German version:
https://daschmidtke.shinyapps.io/goldman_app/

English version:
ToDo

Access to the shiny server, however, is limited to 25 hours per month, so these links are for testing purposes only. If you want to use the App for longer durations, please use a local installation.

## Author

**Daniel Schmidtke**
