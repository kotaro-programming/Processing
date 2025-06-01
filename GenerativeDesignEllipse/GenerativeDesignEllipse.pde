

Agent[] agents = new Agent[20000];
int agentsCount = 15000;
float noiseScale = 50;
float nosieStrength = 10;
float noiseZRange = 0.4;
float overlayAlpha = 5;
float agentsAlpha = 200;
float strokeWidth = 0.3;
int drawMode = 1;


boolean showGUI = false;


float xoff = random(10000);
float yoff = random(10000);
void setup(){
  size(800,800);
  //fullScreen(2);
  background(255);
  smooth();
  
  for(int i = 0;i < agents.length;i++){
    agents[i] = new Agent();
  }
    
   
}

void draw(){
  fill(255, overlayAlpha);
  noStroke();
  rect(0,0,width,height);
 
  
  float c1 = map(noise(xoff),0,1,100,255);
  float c2 = map(noise(yoff),0,1,0,255);
  
  float r = random(1);
  
  if(r < 1){
    drawMode = 1;
  }else{
    drawMode = 2;
  }
  
  if (drawMode == 1) {
    for(int i=0; i<agentsCount-8000; i++){
        noStroke();
        fill(0,c1,255,agentsAlpha);
        agents[i].update1();
    }
    for(int j = 4001;j < agentsCount-4000;j++){
        noStroke();
        fill(c1,0,c2,agentsAlpha);
        agents[j].update1();
    }
    for(int l = 8001;l < agentsCount;l++){
        noStroke();
        fill(c1,c2,0,agentsAlpha);
        agents[l].update1();
    }
   
  } 
  
  else {
   for(int i=0; i<agentsCount-8000; i++){
        noStroke();
        fill(0,c1,c2,agentsAlpha);
        agents[i].update2();
    }
    for(int j = 4001;j < agentsCount-4000;j++){
        noStroke();
        fill(c1,0,c2,agentsAlpha);
        agents[j].update2();
    }
    for(int l = 8001;l < agentsCount;l++){
        noStroke();
        fill(c1,c2,0,agentsAlpha);
        agents[l].update2();
    }
  }
  
  xoff += 0.001;
  yoff += 0.001;

  
}
