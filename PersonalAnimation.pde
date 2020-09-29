//Katelynn Bai
//September 27, 2020
//Personal Animation Project

//NOTE: THE WORDS BAR AND LANE ARE USED INTERCHANGEABLY 

import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

//INTEGERS AND IMPORTS==========================================
import java.util.Random;
Random rand = new Random(); //create variable of type random

float note1x, note1y, note1w, note1h, line1; //note in the first lane

float note2x, note2y, note2w, note2h, line2; //first note in the second lane
float note2bx, note2by, note2bw, note2bh, line2b; //second note in the second lane
float green2x, green2y, green2w, green2h, greenln2; //first green note in the second lane
float green2bx, green2by, green2bw, green2bh, greenln2b; //first green note in the second lane

float note3x, note3y, note3w, note3h, line3; //first note in the third lane
float note3bx, note3by, note3bw, note3bh, line3b; //second note in the third lane

float note4x, note4y, note4w, note4h, line4; //note in the fourth lane

float note5x, note5y, note5w, note5h, line5; //first note in the fifth lane
float note5bx, note5by, note5bw, note5bh, line5b; //second note in the fifth lane

float note6x, note6y, note6w, note6h, line6; //first note in the sixth lane
float note6bx, note6by, note6bw, note6bh, line6b; //second note in the sixth lane
float green6x, green6y, green6w, green6h, greenln6; //first green note in the sixth lane
float green6bx, green6by, green6bw, green6bh, greenln6b; //second green note in the sixth lane

float doublelinex1, doublelinex2, doubleliney; //line connect the double-notes

/*int likex, likey; 
 int animesenx, animeseny; 
 int animehqx, animehqy;
 int animebandx, animebandy;
 int pokemonx, pokemony;*/

float laner, laneg, laneb, lanea; //these are the order of the colors to make the shadow in the lanes (r, g, b, a) respecively

Random speakercolorr = new Random(); //variable for the speaker's r value
Random speakercolorg = new Random(); //variable for the speaker's g value
Random speakercolorb = new Random(); //variable for the speaker's b value

int speakerr, speakerg, speakerb; //base color of speakers

int counter; //framecounter but for audience 

int framecounter; //counts the amount of frames


Minim minim;
AudioPlayer BandoriTap; //tap sound effect
AudioPlayer YuraYura; //song
AudioPlayer GreenNote; //NOT USED: sound effect for held notes

//SETUP======================================================
void setup() {
  size(800, 600);
  framecounter = 0;

  note1x = 320; //x position of note1
  note1y = 0; //y position of note 1
  note1w = 22.2858; //width of note 1
  note1h = 17.1429; //height of note 1
  line1 = 0; //the line going through note 1

  note2x = 346.66;
  note2y = 0;
  note2w = 22.2858;
  note2h = 17.1429;
  line2 = 0;

  note2bx = 346.66;
  note2by = 0;
  note2bw = 22.2858;
  note2bh = 17.1429;
  line2b = 0;

  green2x = 346.66; 
  green2y = 0;
  green2w = 22.2858;
  green2h = 17.1429;
  greenln2 = 0;

  green2bx = 346.66; 
  green2by = 0;
  green2bw = 22.2858;
  green2bh = 17.1429;
  greenln2b = 0;


  note3x = 373.32;
  note3y = 0;
  note3w = 22.2858;
  note3h = 17.1429;
  line3 = 0;

  note3bx = 373.32;
  note3by = 0;
  note3bw = 22.2858;
  note3bh = 17.1429;
  line3b = 0;

  note4x = 399.98;
  note4y = 0;
  note4w = 22.2858;
  note4h = 17.1429;
  line4 = 0;

  note5x = 426.64;
  note5y = 0;
  note5w = 22.2858;
  note5h = 17.1429;
  line5 = 0;

  note5bx = 426.64;
  note5by = 0;
  note5bw = 22.2858;
  note5bh = 17.1429;
  line5b = 0;


  note6x = 453.3;
  note6y = 0;
  note6w = 22.2858;
  note6h = 17.1429;
  line6 = 0;

  note6bx = 453.3;
  note6by = 0;
  note6bw = 22.2858;
  note6bh = 17.1429;
  line6b = 0;

  green6x = 453.3; 
  green6y = 0;
  green6w = 22.2858;
  green6h = 17.1429;
  greenln6 = 0;

  green6bx = 453.3;
  green6by = 0;
  green6bw = 22.2858;
  green6bh = 17.1429;
  greenln6b = 0;


  doublelinex1 = 346.68; //x1 for line connecting double notes
  doublelinex2 = 453.32; //x2 for line connecting double notes 
  doubleliney = -2.5; //the y position for the line connecting double notes


  laner = 63;
  laneg = 64;
  laneb = 67;
  lanea = 140;

  speakerr = 82;
  speakerg = 193; 
  speakerb = 232;


  minim = new Minim(this);
  BandoriTap = minim.loadFile("BandoriTap.mp3"); //FROM THE VIDEO GAME BANG DREAM

  YuraYura = minim.loadFile("YuraYura.mp3"); //THIS IS THE SONG YURA YURA RING DONG DANCE FROM THE VIDEO GAME BANG DREAM

  GreenNote = minim.loadFile("GreenNote.mp3"); //FROM THE VIDEO GAME BANG DREAM
}
//END SETUP==========================================================




//ANIMATION======================================================
void draw() { 
  background(#1F2850);

  //stage 
  stroke(211, 176, 98);
  strokeWeight(1);
  fill(211, 176, 98);
  quad(150, 150, 650, 150, 750, 300, 50, 300);

  audience(); //draws audience 

  speaker(); //draws the speaker and its changing lights 




  stroke(#B9FFFB);
  strokeWeight(5);
  line(0, 500, 800, 500); //bottom line

  line(108.335, 500, 306.67, 0); //left border
  line(691.665, 500, 493.33, 0); //right border
  strokeWeight(1);
  line(191.665, 500, 333.33, 0); //lane 1 line
  line(274.995, 500, 359.99, 0); //lane 2 line
  line(358.325, 500, 386.65, 0); //lane 3 line
  line(441.655, 500, 413.31, 0); //lane 4 line
  line(524.985, 500, 439.97, 0); //lane 5 line
  line(608.315, 500, 466.63, 0); //lane 6 line
  line(691.645, 500, 493.29, 0); //lane 7 line
  //83.33 in between
  //26.66 in between
  //41.665
  //13.33


  //SHADOW ON LANES
  fill(laner, laneg, laneb, lanea);
  quad(306.67, 0, 493.33, 0, 691.665, 500, 108.335, 500);


  //bar1(); //UNUSED IN THIS SONG

  if ((framecounter<250) || (510<framecounter && framecounter<760) || (820<framecounter && framecounter<1070)) { //1, 9, 13     (THIS NOTE IS PLAYED A TOTAL OF 3 TIMES)
    bar2a();  //makes the first note of the second lane move
  }

  if ((175<framecounter && framecounter<425)) { //3, 9
    bar2b(); //makes the second note of the second lane move
  }

  if ((330<framecounter && framecounter<580)) { //5
    bar3a(); //makes the first note of the third lane move
  }

  if ((360<framecounter && framecounter<610)) { //6
    bar3b(); //makes the second note of the third lane move
  }

  //bar4(); UNUSED IN THIS SONG

  if ((400<framecounter && framecounter<650) || (720<framecounter && framecounter<970) ) { //7, 12
    bar5a(); //makes the first note of the fifth lane move
  }

  if ((430<framecounter && framecounter<680)) { //8
    bar5b(); //makes the second note of the fifth lane move
  }

  if ((100<framecounter && framecounter<350) || (510<framecounter && framecounter<760) ) { //2, 9, 
    bar6a(); //makes the first note of the sixth lane move
  }

  if ((275<framecounter && framecounter<525) || (660<framecounter && framecounter<910)) { //4, 11
    bar6b(); //makes the second note of the sixth lane move
  }

  if ((510<framecounter && framecounter<760)) { //9
    doubleline(); //makes the line connecting the double notes move
  }

  if ((540<framecounter && framecounter<890)) { //10
    green6a(); //makes the first green note of the sixth lane move
  }


  if ((640<framecounter && framecounter<890)) { //10
    green6b(); //makes the second green note of the sixth lane move
  }


  if ((600<framecounter && framecounter<890)) { //10
    green2a(); //makes the first green note of the second lane move
  }

  if ((640<framecounter && framecounter<890)) { //10
    green2b(); //makes the second green note of the second lane move
  }






  framecounter=framecounter+1;
  System.out.println(framecounter);
}
//END ANIMATION==================================================================
//FUNCTIONS==============================================================

//BANDORI FUNCTIONS AKA SPAGHETTI CODE
void bar1a() { //note on bar 1
  strokeWeight(5);
  stroke(118, 192, 186);
  fill(127, 57, 113);
  ellipse(note1x, note1y, note1w, note1h);//outer note
  strokeWeight(2);
  fill(255);
  ellipse(note1x, note1y, note1w/1.5, note1h/1.5); //inner note
  strokeWeight(3+line1);
  line(note1x+note1w/2+8, note1y, note1x-note1w/2-8, note1y);
  if (note1y<500) {
    note1x = note1x-0.68; 
    note1y = note1y+2;
    note1w = note1w+0.2145; 
    note1h = note1h+0.1628;
    line1 = line1+0.016;
  }

  if (note1y==480) {
    BandoriTap.play(1);
  }

  if (note1y>=500) {
    note1x = 320;
    note1y = 0;
    note1w = 22.2858;
    note1h = 17.1429;
    line1 = 0;
  }
}




void bar2a() { //first note on bar 2
  strokeWeight(5);
  stroke(118, 192, 186);
  fill(127, 57, 113);
  ellipse(note2x, note2y, note2w, note2h);//outer note
  strokeWeight(2);
  fill(255);
  ellipse(note2x, note2y, note2w/1.5, note2h/1.5); //inner note
  strokeWeight(3+line2);
  line(note2x+note2w/2+8, note2y, note2x-note2w/2-8, note2y);
  if (note2y<500) {
    note2x = note2x-0.4533; //(191.665+41.665-346.66)250            (i put the formula here because i kept on forgetting it)
    note2y = note2y+2;
    note2w = note2w+0.2145; 
    note2h = note2h+0.1628;
    line2 = line2+0.016;
  }

  if (note2y==450) {
    YuraYura.play(); //starts the song
  }

  if (note2y==480) {
    BandoriTap.play(1);
  }

  if (note2y>=500) {
    note2x = 346.66;
    note2y = 0;
    note2w = 22.2858;
    note2h = 17.1429;
    line2 = 0;
  }
}


void bar2b () { //second note on bar 2
  strokeWeight(5);
  stroke(118, 192, 186);
  fill(127, 57, 113);
  ellipse(note2bx, note2by, note2bw, note2bh);//outer note
  strokeWeight(2);
  fill(255);
  ellipse(note2bx, note2by, note2bw/1.5, note2bh/1.5); //inner note
  strokeWeight(3+line2b);
  line(note2bx+note2bw/2+8, note2by, note2bx-note2bw/2-8, note2by);
  if (note2by<500) {
    note2bx = note2bx-0.4533; 
    note2by = note2by+2;
    note2bw = note2bw+0.2145; 
    note2bh = note2bh+0.1628;
    line2b = line2b+0.016;
  }

  if (note2by==480) {
    BandoriTap.play(1);
  }

  if (note2by>=500) {
    note2bx = 346.66;
    note2by = 0;
    note2bw = 22.2858;
    note2bh = 17.1429;
    line2b = 0;
  }
}





void green2a () { //first green note on bar 2
  strokeWeight(5);
  stroke(#52F050);
  fill(#B7F077);
  ellipse(green2x, green2y, green2w, green2h);//outer note
  strokeWeight(2);
  fill(255);
  ellipse(green2x, green2y, green2w/1.5, green2h/1.5); //inner note
  strokeWeight(3+greenln2);
  line(green2x+green2w/2+8, green2y, green2x-green2w/2-8, green2y);
  if (green2y<500) {
    green2x = green2x-0.4533; 
    green2y = green2y+2;
    green2w = green2w+0.2145; 
    green2h = green2h+0.1628;
    greenln2 = greenln2+0.016;
  }

  if (green2y==480) {
    BandoriTap.play(1);
  }

  if (green2y>=890) {
    green2x = 346.66;
    green2y = 0;
    green2w = 22.2858;
    green2h = 17.1429;
    greenln2 = 0;
  }
}



void green2b () { //second green note on bar 2
  strokeWeight(5);
  stroke(#52F050);
  fill(#B7F077);
  ellipse(green2bx, green2by, green2bw, green2bh);//outer note
  strokeWeight(2);
  fill(255);
  ellipse(green2bx, green2by, green2bw/1.5, green2bh/1.5); //inner note
  strokeWeight(3+greenln2b);
  line(green2bx+green2bw/2+8, green2by, green2bx-green2bw/2-8, green2by);
  if (green2by<890) {
    green2bx = green2bx-0.4533; 
    green2by = green2by+2;
    green2bw = green2bw+0.2145; 
    green2bh = green2bh+0.1628;
    greenln2b = greenln2b+0.016;
  }

  if (green2by==480) {
    BandoriTap.play(1);
  }

  if (framecounter>890) {
    green2bx = 346.66;
    green2by = 0;
    green2bw = 22.2858;
    green2bh = 17.1429;
    greenln2b = 0;
  }
}




void bar3a () { //first note on bar 3
  strokeWeight(5);
  stroke(118, 192, 186);
  fill(127, 57, 113);
  ellipse(note3x, note3y, note3w, note3h);//outer note
  strokeWeight(2);
  fill(255);
  ellipse(note3x, note3y, note3w/1.5, note3h/1.5); //inner note
  strokeWeight(3+line3);
  line(note3x+note3w/2+8, note3y, note3x-note3w/2-8, note3y);
  if (note3y<500) {
    note3x = note3x-0.2266; //(274.995+41.665-373.32)/250
    note3y = note3y+2;
    note3w = note3w+0.2145; 
    note3h = note3h+0.1628;
    line3 = line3+0.016;
  }

  if (note3y==480) {
    BandoriTap.play(1);
  }

  if (note3y>=500) {
    note3x = 373.32;
    note3y = 0;
    note3w = 22.2858;
    note3h = 17.1429;
    line3 = 0;
  }
}





void bar3b () { //second note on bar 3
  strokeWeight(5);
  stroke(118, 192, 186);
  fill(127, 57, 113);
  ellipse(note3bx, note3by, note3bw, note3bh);//outer note
  strokeWeight(2);
  fill(255);
  ellipse(note3bx, note3by, note3bw/1.5, note3bh/1.5); //inner note
  strokeWeight(3+line3b);
  line(note3bx+note3bw/2+8, note3by, note3bx-note3bw/2-8, note3by);
  if (note3by<500) {
    note3bx = note3bx-0.2266; //(274.995+41.665-373.32)/250
    note3by = note3by+2;
    note3bw = note3bw+0.2145; 
    note3bh = note3bh+0.1628;
    line3b = line3b+0.016;
  }

  if (note3by==480) {
    BandoriTap.play(1);
  }

  if (note3by>=500) {
    note3bx = 373.32;
    note3by = 0;
    note3bw = 22.2858;
    note3bh = 17.1429;
    line3b = 0;
  }
}






void bar4() { //note on bar 4
  strokeWeight(5);
  stroke(118, 192, 186);
  fill(127, 57, 113);
  ellipse(note4x, note4y, note4w, note4h);//outer note
  strokeWeight(2);
  fill(255);
  ellipse(note4x, note4y, note4w/1.5, note4h/1.5); //inner note
  strokeWeight(3+line4);
  line(note4x+note4w/2+8, note4y, note4x-note4w/2-8, note4y);
  if (note4y<500) {
    note4x = note4x-0.00004; //(358.325+41.665-399.98)/250
    note4y = note4y+2;
    note4w = note4w+0.2145; 
    note4h = note4h+0.1628;
    line4 = line4+0.016;
  }

  if (note4y==480) {
    BandoriTap.play(1);
  }

  if (note4y>=500) {
    note4x =  399.98;
    note4y = 0;
    note4w = 22.2858;
    note4h = 17.1429;
    line4 = 0;
  }
}





void bar5a() { //first note on bar 5
  strokeWeight(5);
  stroke(118, 192, 186);
  fill(127, 57, 113);
  ellipse(note5x, note5y, note5w, note5h);//outer note
  strokeWeight(2);
  fill(255);
  ellipse(note5x, note5y, note5w/1.5, note5h/1.5); //inner note
  strokeWeight(3+line5);
  line(note5x+note5w/2+8, note5y, note5x-note5w/2-8, note5y);
  if (note5y<500) {
    note5x = note5x+0.2266; //(441.655+41.665-426.64)/250
    note5y = note5y+2;
    note5w = note5w+0.2145; 
    note5h = note5h+0.1628;
    line5 = line5+0.016;
  }

  if (note5y==480) {
    BandoriTap.play(1);
  }

  if (note5y>=500) {
    note5x =  426.64;
    note5y = 0;
    note5w = 22.2858;
    note5h = 17.1429;
    line5 = 0;
  }
}




void bar5b() { //second note on bar 5
  strokeWeight(5);
  stroke(118, 192, 186);
  fill(127, 57, 113);
  ellipse(note5bx, note5by, note5bw, note5bh);//outer note
  strokeWeight(2);
  fill(255);
  ellipse(note5bx, note5by, note5bw/1.5, note5bh/1.5); //inner note
  strokeWeight(3+line5b);
  line(note5bx+note5bw/2+8, note5by, note5bx-note5bw/2-8, note5by);
  if (note5by<500) {
    note5bx = note5bx+0.2266; //(441.655+41.665-426.64)/250
    note5by = note5by+2;
    note5bw = note5bw+0.2145; 
    note5bh = note5bh+0.1628;
    line5b = line5b+0.016;
  }

  if (note5by==480) {
    BandoriTap.play(1);
  }

  if (note5by>=500) {
    note5bx =  426.64;
    note5by = 0;
    note5bw = 22.2858;
    note5bh = 17.1429;
    line5b = 0;
  }
}



void bar6a() { //first note on bar 6
  strokeWeight(5);
  stroke(118, 192, 186);
  fill(127, 57, 113);
  ellipse(note6x, note6y, note6w, note6h);//outer note
  strokeWeight(2);
  fill(255);
  ellipse(note6x, note6y, note6w/1.5, note6h/1.5); //inner note
  strokeWeight(3+line6);
  line(note6x+note6w/2+8, note6y, note6x-note6w/2-8, note6y);
  if (note6y<500) {
    note6x = note6x+0.4534; //(524.985+41.665-453.3)/250
    note6y = note6y+2;
    note6w = note6w+0.2145; 
    note6h = note6h+0.1628;
    line6 = line6+0.016;
  }

  if (note6y==480) {
    BandoriTap.play(1);
  }

  if (note6y>=500) {
    note6x = 453.3;
    note6y = 0;
    note6w = 22.2858;
    note6h = 17.1429;
    line6 = 0;
  }
}



void bar6b() { //second note on bar 6
  strokeWeight(5);
  stroke(118, 192, 186);
  fill(127, 57, 113);
  ellipse(note6bx, note6by, note6bw, note6bh);//outer note
  strokeWeight(2);
  fill(255);
  ellipse(note6bx, note6by, note6bw/1.5, note6bh/1.5); //inner note
  strokeWeight(3+line6b);
  line(note6bx+note6bw/2+8, note6by, note6bx-note6bw/2-8, note6by);
  if (note6by<500) {
    note6bx = note6bx+0.4534; //(524.985+41.665-453.3)/250
    note6by = note6by+2;
    note6bw = note6bw+0.2145; 
    note6bh = note6bh+0.1628;
    line6b = line6b+0.016;
  }

  if (note6by>=480) {
    BandoriTap.play(1);
  }

  if (note6by>=500) {
    note6bx = 453.3;
    note6by = 0;
    note6bw = 22.2858;
    note6bh = 17.1429;
    line6b = 0;
  }
}


void green6a() { //first green note on bar 6
  strokeWeight(5);
  stroke(#52F050);
  fill(#B7F077);
  ellipse(green6x, green6y, green6w, green6h);//outer note
  strokeWeight(2);
  fill(255);
  ellipse(green6x, green6y, green6w/1.5, green6h/1.5); //inner note
  strokeWeight(3+greenln6);
  line(green6x+green6w/2+8, green6y, green6x-green6w/2-8, green6y);
  if (green6y<500) {
    green6x = green6x+0.4534; //(524.985+41.665-453.3)/250
    green6y = green6y+2;
    green6w = green6w+0.2145; 
    green6h = green6h+0.1628;
    greenln6 = greenln6+0.016;
  }

  if (green6y==480) {
    BandoriTap.play(1);
  }

  if (framecounter>890) {
    green6x = 453.3;
    green6y = 0;
    green6w = 22.2858;
    green6h = 17.1429;
    greenln6 = 0;
  }
}





void green6b() { //second green note on bar 6
  strokeWeight(5);
  stroke(#52F050);
  fill(#B7F077);
  ellipse(green6bx, green6by, green6bw, green6bh);//outer note
  strokeWeight(2);
  fill(255);
  ellipse(green6bx, green6by, green6bw/1.5, green6bh/1.5); //inner note
  strokeWeight(3+greenln6b);
  line(green6bx+green6bw/2+8, green6by, green6bx-green6bw/2-8, green6by);
  if (green6by<500) {
    green6bx = green6bx+0.4534; //(524.985+41.665-453.3)/250
    green6by = green6by+2;
    green6bw = green6bw+0.2145; 
    green6bh = green6bh+0.1628;
    greenln6b = greenln6b+0.016;
  }

  if (green6by==480) {
    BandoriTap.play(1);
  }

  if (framecounter>890) {
    green6bx = 453.3;
    green6by = 0;
    green6bw = 22.2858;
    green6bh = 17.1429;
    greenln6b = 0;
  }
}




void doubleline() { //line connecting double notes
  // 499.98
  //453.3-346.66
  strokeWeight(5);
  stroke(255);
  line(doublelinex1, doubleliney+3, doublelinex2, doubleliney);

  if (doubleliney<500) {
    doublelinex1 = doublelinex1 - 0.4533;
    doublelinex2 = doublelinex2 + 0.4534;
    doubleliney = doubleliney + 2;
  }


  if (doubleliney>=500) {
    doublelinex1 = 346.68;
    doublelinex2 = 453.32;
    doubleliney = -2.5;
  }
}



void speaker() {  
  //body
  stroke(0);
  strokeWeight(1);
  fill(57);
  quad(35, 140, 110, 115, 133, 285, 55, 315);
  fill(10);
  quad(2, 118, 35, 140, 56, 314, 20, 283);
  fill(36);
  quad(2, 118, 70, 95, 110, 115, 35, 140);
  line(45, 229, 121, 200);
  line(11, 200, 45, 229);
  //color changing circles
  if (speakerr<255) {
    speakerr=speakerr + speakercolorr.nextInt(6);
  } else {
    speakerr=0;
  }

  if (speakerg<255) {
    speakerg=speakerg + speakercolorg.nextInt(6);
    ;
  } else {
    speakerg=0;
  }

  if (speakerb<255) {
    speakerb=speakerb + speakercolorb.nextInt(6);
  } else {
    speakerb=0;
  }

  fill(speakerr, speakerg, speakerb);
  ellipse(80, 174, 50, 50);
  fill(speakerb, speakerr, speakerg);
  ellipse(90, 260, 50, 50);
  fill(57);
  ellipse(80, 174, 25, 25);
  ellipse(90, 260, 25, 25);
}

void audience() {
  strokeWeight(10);

  counter = counter + 1;

  if (counter<30) {
    stroke(#1F2850);
    fill(#1F2850);
  }
  if (counter>30) {
    stroke(255, 255, 255, 150);
    fill(255);

    //the audience in no particular order
    ellipse(20, 400, 20, 40);
    ellipse(120, 560, 20, 40);
    ellipse(220, 490, 20, 40);
    ellipse(320, 420, 20, 40);
    ellipse(420, 390, 20, 40);
    ellipse(520, 460, 20, 40);
    ellipse(620, 400, 20, 40);
    ellipse(720, 480, 20, 40);
    ellipse(10, 500, 20, 40);
    ellipse(70, 520, 20, 40);
    ellipse(170, 470, 20, 40);
    ellipse(270, 490, 20, 40);
    ellipse(370, 570, 20, 40);
    ellipse(470, 560, 20, 40);
    ellipse(570, 500, 20, 40);
    ellipse(670, 520, 20, 40);
    ellipse(770, 500, 20, 40);
  }
  
  if (counter == 100) {
    counter = 0;
  }
}



//END FUNCTIONS===============================================================
