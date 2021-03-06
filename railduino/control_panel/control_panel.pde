import processing.serial.*;

//definizione degli OGGETTI
switch_left_up    sw1; //definizione degli oggetti della classe switch_left_up
switch_right_up   sw2;
straight_signal   str1;
straight_simple   str2;
straight_simple   str3;
straight_simple   str4;

straight_simple   str21;
straight_simple   str22;

//-----------------------------------------------
//dichiarazione VARIABILI
PImage  griglia;  //definizione della variabile griglia di tipo PImage
int     i = 0;    //definizione della variabile i che servira' come contatore
Serial  myPort;  // Create object from Serial class
  
//----------------------------------------------
void setup(){
  background(200); //colore di sfondo
  size(600,600);   //dimensione dell'area di disegno
  
  int track_1 = 200;
  int track_2 = 100;

  String portName = Serial.list()[2]; //change the 0 to a 1 or 2 etc. to match your port
  myPort = new Serial(this, portName, 9600);
  
  sw1   = new switch_left_up (100,          track_1, "1", myPort); 
  str1  = new straight_signal(sw1.right(),  track_1, sw1);
  str2  = new straight_simple(sw1.left(),   track_1, "");
  str3  = new straight_simple(str1.right(), track_1, "");
  sw2   = new switch_right_up(str3.right(), track_1, "2", myPort);
  str4  = new straight_simple(sw2.right(),  track_1, "");
  
  str21 = new straight_simple(200,  track_2, "");
  str22 = new straight_simple(str21.right(),  track_2,"");
  
  
  //si carica l'immagine di una griglia per facilitare il posizionamento degli elementi dell'interfaccia
  griglia = loadImage("griglia_600_600.png"); 

}
//-----------------------------------------------
void draw(){
  
  image(griglia,0,0); //rappresentazione dell'immagina griglia
  
  sw1.display() ; 
  str1.display();
  str2.display();
  str3.display();
  sw2.display() ;
  str4.display();
  
  str21.display();
  str22.display();
}


