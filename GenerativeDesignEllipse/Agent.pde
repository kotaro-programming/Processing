class Agent{
  
  PVector p;
  
  float noiseZ,noiseZVelocity = 0.01;
  
  float stepSize,angle;
  
  float centerX = width/2;
  float centerY = height/2;
  float radius = 300;
  
  
  
  Agent(){
    
    p = new PVector(centerX+random(-radius,radius),
                 centerY+random(-radius,radius));
    
   
    stepSize = random(1,5);
    setNoiseZRange(0.4);
  }
  
  void update1(){
    
    angle = noise(p.x/noiseScale,p.y/noiseScale,
                  noiseZ)*nosieStrength;
                  
    p.x += cos(angle)*stepSize;
    p.y += sin(angle)*stepSize;
    
   if(PVector.dist(p,new PVector(centerX,centerY))
       > radius){
     PVector direction = PVector.sub(p,
     new PVector(centerX,centerY)).normalize();
     
     p.x = centerX - direction.x * radius;
     p.y = centerY - direction.y * radius;
       }
    
   
    ellipse(p.x,p.y,strokeWidth*stepSize*2,
            strokeWidth*stepSize*2);
    
   
    noiseZ += noiseZVelocity;
    
   
  }
  
  void update2(){
    angle = noise(p.x/noiseScale,p.y/noiseScale,
                  noiseZ) * 24;
    angle = (angle - int(angle)) * nosieStrength;
    
    p.x += cos(angle) * stepSize;
    p.y += sin(angle) * stepSize;
    
if (PVector.dist(p, new PVector(centerX, centerY))
    > radius) {
      // 境界を超えた場合、反対側に移動
      PVector direction = PVector.sub(p, 
      new PVector(centerX, centerY)).normalize();
      p.x = centerX - direction.x * radius;
      p.y = centerY - direction.y * radius;
    }
    
    ellipse(p.x,p.y,strokeWidth*stepSize*2,
            strokeWidth*stepSize*2);
    
    
    noiseZ += noiseZVelocity;
  }
  
  void setNoiseZRange(float theNoiseZRange){
    noiseZ = random(theNoiseZRange);
  }
}
