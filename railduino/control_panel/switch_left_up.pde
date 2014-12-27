
class switch_left_up{
  
  //dichiarazioni delle variabili funzionali all'esecuzione della classe
  
  PImage switch_left_up_div;  //definizione dell'immagine del pulsante on, nel programma sarà richiamata imgBt1On
  PImage switch_left_up_str;
  int x;
  int y;
  int i;
  int butt = 0;
  String ButtonLable;
  Serial this_porta;
  //costruttore 
  switch_left_up(int tempX, int tempY, String lable, Serial porta){ 
    //la Classe Button necessita di tre campi che devono essere definiti quando si istanzia un nuovo oggetto
    //la posizione X, Y ed una stringa che definisce l'etichetta 
    x = tempX; //il campo tempX viene passato alla variabile globale della Classe X
    y = tempY; //il campo tempY viene passato alla variabile globale della Classe Y

    Serial this_porta = porta;

    ButtonLable = lable;  //il campo lable viene passato alla variabile globale della Classe LedLable
    
    switch_left_up_div = loadImage("switch_left_up_div.png");  //caricamento dell'immagine del pulsante on
    switch_left_up_str = loadImage("switch_left_up_str.png");  //caricamento dell'immagine del pulsante off
    
    textSize(20); //viene definita la dimensione del carattere
    textAlign(LEFT);//viene definito l'allineamento del testo, a sinistra
                     //questi parametri servono per la rappresentazione dell'etichetta
                     
  }
  //  
  //METODO right() --------------------------------------------------------------------------------------------
  //  
  int right(){
    return x + 100;
  }
  //  
  //METODO left() ---------------------------------------------------------------------------------------------
  //  
  int left(){
    return x - 100;
  }
  //  
  //METODO straight() -----------------------------------------------------------------------------------------
  //  
  boolean straight(){  
    // Il metodo è definito come un boolean se la variabile butt = 1 allora il metodo 
    // restituisce "true" altrimenti "false". Serve ad indicare se lo scambio e' disposto 
    // o meno per il corretto tracciato.
    if (butt == 1){  
     return true;
     }
     else{
     return false;
    }
  }
  //  
  //METODO display() -------------------------------------------------------------------------------------------
  //  
  void display(){
    fill(0);
    //scrittura dell'etichetta sotto all'interruttore
    text(ButtonLable,x,y + 90); 
    
    if (butt == 0){           
      // visualizzazione dell'immagine del deviatoio con tracciato deviato
      image(switch_left_up_div, x,y); 
    }
    else{  
      // viene visualizzata, nella stessa posizione, l'immagine del deviatorio
      // in posizione di corretto tracciato       
      image(switch_left_up_str, x,y);   
    }

    // gestore scambio
    strokeWeight(3);  //spessore del bordo
    if (overRect(x,y,100,100)){//la funzione overRect restituisce TRUE se il mouse è sopra il rettangolo 
                               //che rappresenta l'interruttore 
      stroke(255, 0, 0);       //definizione di una linea di colore giallo
      noFill();
      rect(x,y,100,100);       //disegno di un rettangolo di colore giallo attorno all'elemento del deviatoio, 
                               //questa tecnica serve ad evideziare quando il mouse è sopra l'area attiva
    }
    else  
    {
      noStroke();              //nessuna linea
      noFill();                //nessun riempimento
      rect(x,y,100,100);
    }

    //cambio dello stato del pulsante se tasto mouse premuto
    if ((overRect(x,y,100,100)) && mousePressed)  //se contemporaneamente il mouse è sopra l'area del pulsante ed il tasto sinistro è premuto
    {                                             //viene cambiato il valore di button in 0 se era 1, oppure in 1 se precedentemente era 0
      delay(200);                                 //questo ciclo di ritardo funziona da debounce del tasto del mouse
      if (butt == 0){ butt = 1;} 
      else{           butt = 0;}
      myPort.write('2');
      delay(250);       
      myPort.write('0');
    } 
  }
  //  
  //METODO display() -------------------------------------------------------------------------------------------
  //  
  // funzione overRect, vengono passati i parametri di posizione X e Y, e di larghezza W e 
  // altezza H del pulsante  
  boolean overRect(int x, int y, int w, int h)   
  {
    if (mouseX >= x && mouseX <= x+w &&  mouseY >= y && mouseY <= y+h) {
      return true;
    } 
    else {
      return false;
    }
  }
}




