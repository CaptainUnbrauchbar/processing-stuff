float theta = 0;                // zufälliges Ergebnis pro Wurf
float hist[]  = new float[6];   // Array mit den Häufigkeiten der Zahlen
float sum = 0;                  // Summe aller bisherigen Ergebnisse 
float count = 0;                // Anzahl Würfe bisher
int fr = 100;                   // Frame Rate
String av;                      // Hilfsstring für das Runden des Durchschnitts

void setup() {
  size(700,700); 
  background(255);
  frameRate(fr);
  
  // initialisieren aller Variabler
  theta = 0;
  sum = 0;
  count = 0;
  for(int i = 0; i < 6; i++){ hist[i]=0;}
  stroke(67); // Farbe der Außenlinie
  strokeWeight(5); // Dicke der Außenlinie
}

void draw() {

  background(67);
  
  theta = (int)(random(1,7)); // Würfelergebnis
  
  hist[(int)theta-1] += 1;
  count += 1;
  sum += theta;
  
  fill(255); 
  textSize(24); 
  textAlign(LEFT);
  text("Anzahl Würfe: "+(int)count, 50,100);
  av = nf(sum/count,0,1);
  text("Durchschnitt: "+av,400,100);
  
  // Zeichnen der aktuellen Zahlen als Balkendiagramm
  for(int i = 0; i < 6; i++){
    fill(255-i*32,185,i*32);
    strokeWeight(9);
    rect(50+i*100,550,100,-500*3*hist[i]/count,15);
    
    textAlign(CENTER);
    text((int)hist[i],100+i*100,585);
    
    fill(255);
    rect(75+i*100, 600,50,50,12);
    
    fill(67);
    strokeWeight(3);
    
    // Würfel unter jeden Balken zeichnen
    switch(i) {
      case 0: 
        ellipse(100+i*100,625,5,5);
        break;
      case 1:
        ellipse(110+i*100,635,5,5);
        ellipse(90+i*100,615,5,5);
        break;
      case 2:
        ellipse(100+i*100,625,5,5);
        ellipse(110+i*100,635,5,5);
        ellipse(90+i*100,615,5,5);
        break;
      case 3:
        ellipse(90+i*100,635,5,5);
        ellipse(110+i*100,635,5,5);
        ellipse(90+i*100,615,5,5);
        ellipse(110+i*100,615,5,5);
        break;
      case 4:
        ellipse(100+i*100,625,5,5);
        ellipse(90+i*100,635,5,5);
        ellipse(110+i*100,635,5,5);
        ellipse(90+i*100,615,5,5);
        ellipse(110+i*100,615,5,5);
        break;
      case 5:
        ellipse(90+i*100,625,5,5);
        ellipse(110+i*100,625,5,5);
        ellipse(90+i*100,635,5,5);
        ellipse(110+i*100,635,5,5);
        ellipse(90+i*100,615,5,5);
        ellipse(110+i*100,615,5,5);
        break;
        
    }
  }
  
}

// ein paar Tastaturbefehle. 
// s stoppt die Simulation, 
// g lässt sie weiterlaufen, 
// Enter-Taste reinitialisiert alles
void keyPressed() {
  if (key == ENTER) { setup(); }
  if (key == 's') { noLoop(); } 
  if (key == 'g') { loop(); }
}
