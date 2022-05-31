float x;
float y;
float xtwo;
float ytwo;

float travel;
float toggle;


int score = 0;

PShape enemy;
PFont f; 

int savedTime;
int totalTime = 5000;




void setup() {
  //size(640, 480);
  size(640, 480);
  noStroke();
  background(0, 0, 0);
  f = createFont("Arial",16,true);
  
  
  //variables
  x = width/2;
  y = height/2;
  xtwo = int(random(50, 590));
  ytwo = int(random(50, 430));
  
  travel = 1;
  toggle = 0;
  savedTime = millis();
  
  
}

void draw() {
  background(0,0,0);
  
  //time variables
  int passedTime = millis() - savedTime;
  int time = passedTime / 1000;
  
  //Borders
  fill(100, 100, 100);
  // Border bottem
  rect(0, 450, 640, 30);
  //Border Top
  rect(0, 0, 680, 30);
  //Border Left
  rect(0, 0, 30,480);
  //Border Right
  rect(610, 0, 30, 480);
  
  
  //enemy
  fill(200, 0, 255);  
  enemy = createShape(ELLIPSE,xtwo,ytwo,25,25);
  shape(enemy);
  
  //Player
  fill(255,255,255);
  ellipse(x, y, 25,25);
  
  //Scoring display
  textFont(f,16);  
  text("Score: ",300,25); 
  text(score,360,25); 
    
  
  
  
  //gameover and final score
  if (time == 60) {
    textFont(f,100);  
    fill(255,0,0);
    text("GAME OVER \n", 15, 250);
    textFont(f,40);  
    text("Your score = ", 190, 300);
    text(score, 425, 300);
    stop();
  }
  else {
    //timer displaying
    text("Time Left: ", 180, 25);
    text((60 - time), 260, 25);
  }
   
}


void keyPressed() {
  if ((keyPressed == true) && (key == CODED)) {
    if (keyCode == UP){
      //Top Border
     if ((y == 43) || (y<=43)) {
        
      } 
     else {
       y = y - travel;
     }
    } 
    
    else if (keyCode == DOWN) {
      // Bottem Border
      if ((y == 437)  || (y >= 437)) {
      }
      
      else {
        y = y + travel;
      }
    } 
    
    else if (keyCode == LEFT){
      
      if ((x == 43)  || (x <= 43)) {
      }
      
      else {
        x = x - travel;
      }
      
    } 
    
    else if (keyCode == RIGHT) {
      if ((x == 597)  || (x >= 597)) {
      }
      
      else {
        x = x + travel;
      }
      
      
      
    }
   
        
   //Speed changes
     else if (keyCode == SHIFT) {
        if (toggle == 0) {
         travel = 3;
         toggle = toggle + 1;
        }
        else if (toggle == 1) {
          travel = 1;
          toggle = toggle - 1;
        }
        
      }
    
    
  } 
 if ((xtwo == x) && (ytwo == y)) {
   //new food position
  xtwo = int(random(50, 590));
  ytwo = int(random(50, 430));
  
   //scoring and displaying  
   score = score + 1;
 }
 else {
   
 }   
}
