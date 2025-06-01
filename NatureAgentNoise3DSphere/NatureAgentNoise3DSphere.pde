ArrayList<Agent> agent;

float overlayAlpha = 5;
float agentAlpha = 200;
float drawMode = 1;

float noiseScale;
float noiseStrength;

float theta = 0.0;

void setup(){
  size(800,800,P3D);
  //fullScreen(P3D); // 3D描画モードに変更
  background(0);

  agent = new ArrayList<Agent>();
  for(int i = 0; i < 800; i++){
    agent.add(new Agent(50, 10));
  }
}

void draw(){
  background(0);
  //fill(0, overlayAlpha);
 // noStroke();
 // rect(0, 0, width, height);

  lights(); // 光源を追加
  translate(width / 2, height / 2, 0); // 画面の中心に移動
  rotateX(theta);
  rotateY(theta);
  sphereDetail(5);
  noFill();
  stroke(255.100);
  sphere(100);
  
  for(Agent a: agent){
    a.run();
  }
  
  theta += 0.01;
}
