
class switch_right_up{
  
  //dichiarazioni delle variabili funzionali all'esecuzione della classe
  
  PImage switch_right_up_div;  //definizione dell'immagine del pulsante on, nel programma sarà richiamata imgBt1On
  PImage switch_right_up_str;
  int x;
  int y;
  int i;
  int butt = 0;
  String ButtonLable;
  Serial this_porta;
  //costruttore 
  switch_right_up(int tempX, int tempY, String lable, Serial porta){ //la Classe Button necessita di tre campi che devono essere definiti quando si istanzia un nuovo oggetto
                                              //la posizione X, Y ed una stringa che definisce l'etichetta 
    x = tempX; //il campo tempX viene passato alla variabile globale della Classe X
    y = tempY; //il campo tempY viene passato alla variabile globale della Classe Y

    ButtonLable = lable;  //il campo lable viene passato alla variabile globale della Classe LedLable
    
    switch_right_up_div = loadImage("switch_right_up_div.png");  //caricamento dell'immagine del pulsante on
    switch_right_up_str = loadImage("switch_right_up_str.png");  //caricamento dell'immagine del pulsante off
    
    textSize(20); //viene definita la dimensione del carattere
    textAlign(LEFT);//viene definito l'allineamento del testo, a sinistra
                     //questi parametri servono per la rappresentazione dell'etichetta
  
    this_porta = porta;
  }
  
  int right(){
    return x + 100;
  }
  
  int left(){
    return x - 100;
  }
  
  
//METODO active() ---------------------------
  boolean straight(){  //il metodo è definito come un boolean
    if (butt == 1){  //se la variabile butt = 1 allora il metodo resituisce "true" altrimenti "false"
     return true;
     }
     else{
     return false;
    }
  }
//-------------------------------------------  


//METODO display() ---------------------------
  void display(){
    fill(255,0,0);
    //scrittura dell'etichetta sotto all'interruttore
    text(ButtonLable,x,y); 
    
    if (butt == 0){           //se il valore di button = 0 viene visualizzata l'immagine dell'interruttore off 
      image(switch_right_up_div, x,y);  //visualizzazione del'interruttore off
    }
    else{                       //altrimenti
      image(switch_right_up_str, x,y);   //viene visualizzata, nella stessa posizione, l'immagine dell'interruttore on
    }
//-------------------------------------------  


    //++ gestore button ++++++++++++++++++++++++++++++++++++
    strokeWeight(1);  //spessore del bordo
    if (overRect(x,y,50,60)){  //la funzione overRect restituisce TRUE se il mouse è sopra il rettangolo che rappresenta l'interruttore, altrimenti 
      stroke(241, 250, 18); //definizione di una linea di colore giallo
      noFill();
      rect(x,y,50,60);  //disegno di un rettangolo di colore giallo in corrispondenza dell'interruttore, 
                             //questa tecnica serve ad evideziare quando il mouse è sopra l'area attiva
    }
    else  
    {
      noStroke(); //nessuna linea
      noFill(); //nessun riempimento
      rect(x,y,30,100);
    }

    //cambio dello stato del pulsante se tasto mouse premuto
    if ((overRect(x,y,50,70)) && mousePressed)  //se contemporaneamente il mouse è sopra l'area del pulsante ed il tasto sinistro è premuto
    {                                             //viene cambiato il valore di button in 0 se era 1, oppure in 1 se precedentemente era 0
      delay(250);                                 //questo ciclo di ritardo funziona da debounce del tasto del mouse
      if (butt == 0) //se il valore di button è 0
      {
        butt = 1; //button diventa 1
      } 
      else  //altrimenti, ovvero se button era 1
      {  
        butt = 0; //button viene cambiato in 0
      }
      myPort.write(ButtonLable);
      delay(250);       
      myPort.write('0');
    }  
    //++++++++++++++++++++++++++++++++++++++++++++++++++++++

  }

  boolean overRect(int x, int y, int w, int h)   //funzione overRect, vengono passati i parametri di posizione X e Y, e di larghezza W e altezza H del pulsante
  {
    if (mouseX >= x && mouseX <= x+w &&  mouseY >= y && mouseY <= y+h) {
      return true;
    } 
    else {
      return false;
    }
  }



}




