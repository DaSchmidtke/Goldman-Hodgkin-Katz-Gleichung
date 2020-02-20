## Goldman-Hodgkin-Katz-Gleichung

Diese Shiny-App ist eine interaktive Version der Goldman-Hodkin-Katz-Gleichung zur Berechnung des Membranpotentials einer Zelle in Abhängigkeit der relativen Permeabilitäten sowie der inneren and äußeren Konzentrationen verschiedener Ionenspezies (Kalium, Natrium und Chlorid).

Die Gleichung lautet wie folgt:


![Equation](/www/Gleichung.jpg)

### Interaktive Benutzeroberfläche
In der laufenden App kann man verschiedene Werte für die relativen Permeabilitäten sowie die extra- und intrazellulären Ionenkonzentrationen  von Kalium, Natrium und Chlor auswählen, um zu simulieren, wie diese das Membranpotential beeinflussen.


![Sliders](/www/Eingabe.jpg)

Bitte beachten Sie, dass die Permeabilität von Kalium dabei nicht verändert werden kann, da die Permeabilität der anderen Ionenspezies (Natrium und Chlorid) relativ zu der von Kalium angegeben wird. P(K) beträgt daher stets 1.

### Ausgabe
Die Ausgabe der App erfolgt zum Einen graphisch, in Form eines Oszillograms, welches das Membranpotential bei gegebenen einstellungen in mV anzeigt, zum Anderen über eine Textausgabe. Die Textausgabe beinhaltet sowohl das berechnete Membranpotential als auch die Nernstpotentiale der einzelnen Ionenspezies bei gegebenem Konzentrationsgradienten zwischen intra- und extrazellulärem Medium.

![Output](/www/Ausgabe.jpg)

Zu guter Letzt erlaubt die App die Auswahl der folgenden Voreinstellungen:

Ruhepotential beim Cephalopoden-Neuron\
Maximales Membranpotential des Cephalopoden-Neurons während des Aktionspotentials\
Ruhepotential beim Säugetier-Neuron\
Maximales Membranpotential des Säugetier-Neurons während des Aktionspotentials

## Lokale Installation der App

Gehen Sie vor der Installation sicher, dass sie R und die folgenden R-Pakete auf Ihrem Rechner installiert und ind er laufenden R-Session geladen haben:

**shiny**, **shinyWidgets**, **shinyjs**, **ggplot2**, **jpeg**

    # Installation der Pakete aus der R-Eingabeaufforderung (Konsole) heraus:
    install.packages("shiny")
    install.packages("shinyWidgets")
    install.packages("shinyjs")
    install.packages("ggplot2")
    install.packages("jpeg")
    
    # Laden der Pakete aus der R-Eingabeaufforderung (Konsole) heraus:
    library(shiny)
    library(shinyWidgets)
    library(shinyjs)
    library(ggplot2)
    library(jpeg)
    
## Lokale Benutzung der App

Sobald die oben gelisteten R-Packete installiert und geladen sind, kann die App aus der Eingabeaufforderung (Konsole) heraus mit folgender Zeile gestartet werden:

    runGitHub( "Goldman-Hodgkin-Katz-Gleichung", "DaSchmidtke")
    
## Benutzung der Online-Version der App

Eine Online-Version der App ist unter folgendem Link bereitgestellt:

Deutsche Version:
https://daschmidtke.shinyapps.io/goldman_app/

Englische Version:
https://daschmidtke.shinyapps.io/Goldman-Hodgkin-Katz-Equation/

Der Zugriff auf den Shiny-Server ist dabei jedoch auf 25 Stunden pro Monat begrenzt. Nutzen Sie die Online-Version also bitte nur zum Ausprobieren der App. Wenn Sie die App länger benutzen möchten, verwenden Sie bitte eine lokale Installation.

## Autor

**Daniel Schmidtke**
