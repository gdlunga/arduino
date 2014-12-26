
//definizione degli OGGETTI
switch_left_up    sw1; //definizione degli oggetti della classe switch_left_up
switch_right_up   sw2;
straight_signal   str1;
straight_simple   str2;
straight_simple   str3;
straight_simple   str4;
//-----------------------------------------------

//dichiarazione VARIABILI
PImage griglia; //definizoione della variabile griglia di tipo PImage
int i=0; //definizione della variabile i che servirà come contatore
//----------------------------------------------

void setup(){
  background(200); //colore di sfondo
  size(600,600); //dimensione dell'area di disegno
  
  int track_1 = 200;
  
  sw1   = new switch_left_up(100,200,"Deviatoio 1"); //istanza dell'oggetto sw1 e sua costruzione
  
  str1  = new straight_signal(sw1.right(),  track_1, sw1);
  str2  = new straight_simple(sw1.left(),   track_1,"");
  str3  = new straight_simple(str1.right(), track_1, "");
  sw2   = new switch_right_up(str3.right(), track_1, "");
  str4  = new straight_simple(sw2.right(),  track_1, "");
  
  griglia = loadImage("griglia_600_600.png"); //si carica l'immagine di una griglia per facilitare il posizionamento degli elementi dell'interfaccia

}


void draw(){
  
  image(griglia,0,0); //rappresentazione dell'immagina griglia
  
  sw1.display(); //rappresentazione di sw1
  str1.display();
  str2.display();
  str3.display();
  sw2.display();
  str4.display();
  //funzionamento dell'interfaccia

  if(sw1.straight()){
    
    
  }

  //se il bt1 "Start" è attivo
  //l'indicatore crescerà fino a raggiungere il valore impostato dalla manopola knb1 "Level"
  //se riduciamo il valore della manopola, il valore rappresentato dall'indicatore si ridurrà
 /*
  if(bt1.active()){ //se il l'interruttore bt1 "Start" è in posizione attiva
  
    println(knb1.position()); //sul terminale viene rappresentato il valore trasmesso dalla posizione della manopola knb1
    
      if(i<knb1.position()){ //se la posizione della manopola è superiore alla posizione dell'indicatore 
            i +=1;     //incremento la variabile i
            ind1.update(i); // aggiorno la posizione dell'indicatore ad i
        }
       if(i>knb1.position()){ //se la posizione della manopola è inferiore a quella dell'indicatore
            i -=1; //decremento i
            ind1.update(i); //aggiorno la posizione dell'indicatore ad i
        } 
        
       if(i>900){ //se la variabile i oltrepassa 900 
          ld3.update(true); //aggiorno lo stato del led3 "Alarm" ad acceso
        }else{
          ld3.update(false); //altrimenti lo stato di led3 è spento
        }
        
    }

    
 if(bt2.active()){ //se l'interruttore bt2 è acceso 
   ld1.update(true); //aggiorno lo stato di ld1 a "true", accendo il led
 }
 else{
   ld1.update(false); //altrimenti lo stato del led è spento
 }
 
 
 if(bt3.active()){ //se l'interruttore bt3 è acceso 
   ld2.update(true); //aggiorno lo stato di ld2 a "true", accendo il led
 }
 else{
   ld2.update(false); //altrimenti lo stato del led è spento
 }
 */

}


