class Force{
  PVector loc;
  float mass;
  PVector vel;
  PVector acc;
  float G;
  float c;
  float c1;
  Force(float m,float x,float y){
    loc = new PVector(x,y);
    vel = new PVector(0,0);
    acc = new PVector(0,0);
    mass = m;
    G = 1;
    c = 0.1;
    c1 = 0.01;
  }
  PVector attract(Mover m){
    PVector force = PVector.sub(loc,m.loc);
    float d = force.mag();
    d = constrain(d,5,10);
    float s = G * ((mass * m.mass) / ((d * d)));
   // force.mult(-1);
    force.normalize();
    force.mult(s);
  return force;
  }
  PVector Liquid(Mover m){
    PVector forceL = m.vel.get();
    float v = m.vel.mag();
    float v2 = c * v * v;
    forceL.mult(-1);
    forceL.normalize();
    forceL.mult(v2);
    return forceL;
}
  PVector Friction(Mover m){
    PVector forceF = m.vel.get();
    forceF.mult(-1);
    forceF.normalize();
    forceF.mult(c1);
    return forceF;
  }
   void applyForce(PVector force){
     PVector f = PVector.div(force,mass);
  acc.add(f);
   }
     void update(){
    vel.add(acc);
    loc.add(vel);
    acc.mult(0);
  }
  void display(){
   // noStroke();
   // fill(0,10);
    ellipse(loc.x,loc.y,mass*10,mass*10);
  }
   void check(){
    if(loc.x > width){
      loc.x = width;
      vel.x *= -0.1;
    }
    else if(loc.x < 0){
      loc.x = 0;
      vel.x *= -0.1;
    }
    if(loc.y > height){
      loc.y = height;
      vel.y *= -0.1;
    }
    else if(loc.y < 0){
      loc.y = 0;
      vel.y *= -0.1;
    }
  }
}












    
