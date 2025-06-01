class Agent {
  PVector loc;
  PVector vel;
  PVector acc;
  float noiseZ, noiseZVelocity = 0.01;

  float stepSize, angle;

  float radius = 300; // 球面の半径

  float strokeWidth = 3;
  
  float theta = 0.0;

  Agent(float nsc, float nst) {
    loc = randomPointOnSphere(radius);
    vel = new PVector(0, 0, 0);
    acc = new PVector(0, 0, 0);

    noiseScale = nsc;
    noiseStrength = nst;

    stepSize = random(3.5);

    setNoiseZRange(0.4);
  }

  void run(){
    update1();
    update2();
    display();
  }

  void update2(){
    PVector noiseloc = new PVector(0, 0, 0);

    angle = noise(loc.x/noiseScale, loc.y/noiseScale, loc.z/noiseScale) * noiseStrength;

    PVector axis = loc.cross(new PVector(0, 0, 0)).normalize(); // 任意の軸を生成
    PVector direction = PVector.fromAngle(angle).normalize(); // 動く方向を設定

    PVector move = axis.cross(loc).normalize().mult(stepSize);
    loc.add(move);
    loc.normalize().mult(radius); // 球面に制限

    noiseZ += noiseZVelocity;
  }

  void applyForce(PVector force) {
    acc.add(force);
  }

  void update1() {
    vel.add(acc);
    vel.limit(5);
    loc.add(vel);
    loc.normalize().mult(radius); // 球面に制限
    vel.mult(0);
    acc.mult(0);
  }

  void display(){
    pushMatrix();
    translate(loc.x, loc.y, loc.z);
    noFill();
   // stroke(255,200);
   noStroke();
    fill(255, 200);
    sphereDetail(20);
    sphere(strokeWidth * stepSize); // エージェントを球として描画
    popMatrix();
    
    theta += 0.01;
  }

  PVector randomPointOnSphere(float r) {
    float theta = random(TWO_PI);
    float phi = random(PI);
    float x = r * sin(phi) * cos(theta);
    float y = r * sin(phi) * sin(theta);
    float z = r * cos(phi);
    return new PVector(x, y, z);
  }

  void setNoiseZRange(float theNoiseZRange){
    noiseZ = random(theNoiseZRange);
  }
}
