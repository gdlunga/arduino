
class straight_simple{
  
  //dichiarazioni delle variabili funzionali all'esecuzione della classe
  
  PImage straight_simple_img;  //definizione dell'immagine del pulsante on, nel programma sarà richiamata imgBt1On
  int x;
  int y;
  int i;
  int butt = 0;
  String ButtonLable;
  
  //costruttore 
  straight_simple(int tempX, int tempY, String lable){ //la Classe Button necessita di tre campi che devono essere definiti quando si istanzia un nuovo oggetto
                                              //la posizione X, Y ed una stringa che definisce l'etichetta 
    x = tempX; //il campo tempX viene passato alla variabile globale della Classe X
    y = tempY; //il campo tempY viene passato alla variabile globale della Classe Y

    ButtonLable = lable;  //il campo lable viene passato alla variabile globale della Classe LedLable
    
    straight_simple_img = loadImage("straight_simple.png");  //caricamento dell'immagine del pulsante on
     
    textSize(20); //viene definita la dimensione del carattere
    textAlign(LEFT);//viene definito l'allineamento del testo, a sinistra
                     //questi parametri servono per la rappresentazione dell'etichetta
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
    fill(0);
    image(straight_simple_img, x,y);
  }
}




