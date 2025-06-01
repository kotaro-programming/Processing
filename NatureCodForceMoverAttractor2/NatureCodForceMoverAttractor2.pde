Mover[] m = new Mover[30000];
Force[] f = new Force[30000];
float timex = 0.0;
float timey = 1000.0;
float timex2 = 0.0;
float timey2 = 1000.0;
void setup(){
  size(800,800);
  background(255);
  reset();
}

void draw(){
  background(0);
  noFill();
  textSize(62);
 stroke(255,50);

 for(int m = 50;m < 950;m += 50){
 //line(m,50,50+m-50,900);
 }
 for(int d = 55;d < 930;d += 165){
// line(45,d,950,55+d-55);
 }
 ellipse(width/2,height/2,600,600);
 //ellipse(150,137.5,155,155);
 //ellipse(800,797.5,155,155);

 noStroke();
  fill(0,map(noise(timex),0,1,0,255),map(noise(timey),0,1,0,255),100);
  for(int i = 0;i < m.length;i++){
    PVector force1 = f[i].attract(m[i]);
     m[i].applyForce(force1);
     m[i].update();
     m[i].display();
     m[i].check();
  }
  for(int j = 0;j < f.length;j++){ 
  PVector force2 = m[j].attract(f[j]);
  f[j].applyForce(force2);
  f[j].update();
  f[j].display();
  f[j].check();
}
  println(frameCount);
 // if(frameCount > 1800){
//    noLoop();
//  }

//saveFrame("output/frame-######.png");
}

void mousePressed(){
  reset();
  timex += 1;
  timey += 1;
}

void reset(){
  noStroke();
  fill(0,map(noise(timex),0,1,0,255),map(noise(timey),0,1,0,255),100);
     for(int i = 0;i < m.length;i++){
  m[i] = new Mover(0.15,map(noise(timey),0,1,0,width),
                                 map(noise(timex),0,1,0,height));
  timex += 0.01;
  timey += 0.01;
  }
  for(int j = 0;j < f.length;j++){
  f[j] = new Force(0.15,map(noise(timey),0,1,0,width),
                                 map(noise(timey),0,1,0,height));
  timex += 0.01;
  timey += 0.01;
  }
  
}
