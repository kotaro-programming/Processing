class Mover{
  PVector loc;
  PVector vel;
  PVector acc;
  float mass;
  float G =1;
  Mover(float m,float x,float y){
    loc = new PVector(x,y);
    vel = new PVector(0,0);
    acc = new PVector(0,0);
    mass = m;
  }
   PVector attract(Force f){
    PVector force = PVector.sub(loc,f.loc);
    float d = force.mag();
    d = constrain(d,5,10);
    float s = G * ((mass * f.mass) / ((d * d)));
   // force.mult(-1);
    force.normalize();
    force.mult(s);
  return force;
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
