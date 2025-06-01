Mover[] m = new Mover[2000];
Force[] f = new Force[2000];
float timex = 0.0;
float timey = 1000.0;
float timex2 = 0.0;
float timey2 = 1000.0;
void setup(){
  size(1000,1000);
  background(255);
  reset();
}

void draw(){
 
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
 

}

void mousePressed(){
  reset();
  timex += 1;
  timey += 1;
}

void reset(){
  background(255);
  noStroke();
  fill(0,map(noise(timex),0,1,0,255),map(noise(timey),0,1,0,255),5);
     for(int i = 0;i < m.length;i++){
  m[i] = new Mover(0.1,map(noise(timex),0,1,0,width),
                                 map(noise(timey),0,1,0,height));
  timex += 0.01;
  timey += 0.01;
  }
  for(int j = 0;j < f.length;j++){
  f[j] = new Force(0.1,map(noise(timey),0,1,0,width),
                                 map(noise(timex),0,1,0,height));
  timex += 0.01;
  timey += 0.01;
  }
  
}
