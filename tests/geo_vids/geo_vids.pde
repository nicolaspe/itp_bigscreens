// random middle wave

import com.hamoid.*;
VideoExport videoExport;
int frame_rate = 60;
float duration = frame_rate*2*PI +1;
//float duration = frame_rate*5;

void setup(){
  size(10240, 922);
  ellipseMode(CENTER);
  
  frameRate(frame_rate);
  
  // video recording
  videoExport = new VideoExport(this);
  videoExport.startMovie();
}

void draw(){
  background(255);
  wave_fast();
  
  videoExport.saveFrame();
  if(frameCount >= duration){
    videoExport.endMovie();
    exit();
  }
}


void circle_dots_sine(){
  float min_dim = min(width, height);
  strokeWeight(2);
  stroke(0);
  fill(0);
  float radius = min_dim/3;
  pushMatrix();
  translate(width/2, height/2);
  rotate(frameCount/80.);
  for(int i=0; i<12; i++){
    float angle = i*PI*2/12;
    float pos_x = radius*cos(angle) *sin(frameCount/80.);
    float pos_y = radius*sin(angle) *cos(frameCount/80.);
    ellipse(pos_x, pos_y, min_dim/40, min_dim/40);
  }
  popMatrix();
}

void circle_dots_gen(){
  float min_dim = min(width, height);
  strokeWeight(2);
  stroke(0);
  fill(0);
  float radius = min_dim/3;
  pushMatrix();
  translate(width/2, height/2);
  rotate(frameCount/80.);
  for(int i=0; i<12; i++){
    float fram = min(frameCount, duration);
    float angle = map(fram, 0., duration, 0., 2.*PI*i/12);
    float pos_x = radius*cos(angle);
    float pos_y = radius*sin(angle);
    ellipse(pos_x, pos_y, min_dim/40, min_dim/40);
  }
  popMatrix();
}

void wave_fast(){
  float min_dim = min(width, height);
  strokeWeight(min_dim/10);
  stroke(0);
  noFill();
  float radius = min_dim*1.5;
  for(int i=-80; i<80; i++){
    float pos_x = -(i*width/40 +frameCount*2);
    arc(pos_x, height/2, radius, radius, HALF_PI, 3*HALF_PI);
  }
}

void wave_slow(){
  float min_dim = min(width, height);
  strokeWeight(min_dim/10);
  stroke(0);
  noFill();
  float radius = min_dim*1.5;
  for(int i=-10; i<10; i++){
    float pos_x = -(i*width/5 +frameCount);
    arc(pos_x, height/2, radius, radius, HALF_PI, 3*HALF_PI);
  }
}

void circ_wave(){
  float min_dim = min(width, height);
  strokeWeight(min_dim/10*2);
  stroke(0);
  noFill();
  float radius = min_dim;
  for(int i=-40; i<40; i++){
    float pos_x = i*width/20 +frameCount*10;
    ellipse(pos_x, height/2, radius, radius);
  }
}

void random_midwave(){
  float min_dim = min(width, height);
  strokeWeight(min_dim/5);
  stroke(0);
  float radius = randomGaussian()*min_dim/8 +min_dim/2;
  ellipse(0*width/6, height/2, radius, radius);
  radius = randomGaussian()*min_dim/8 +min_dim/2;
  ellipse(1*width/6, height/2, radius, radius);
  radius = randomGaussian()*min_dim/8 +min_dim/2;
  ellipse(2*width/6, height/2, radius, radius);
  radius = randomGaussian()*min_dim/8 +min_dim/2;
  ellipse(3*width/6, height/2, radius, radius);
  radius = randomGaussian()*min_dim/8 +min_dim/2;
  ellipse(4*width/6, height/2, radius, radius);
  radius = randomGaussian()*min_dim/8 +min_dim/2;
  ellipse(5*width/6, height/2, radius, radius);
  radius = randomGaussian()*min_dim/8 +min_dim/2;
  ellipse(6*width/6, height/2, radius, radius);
}