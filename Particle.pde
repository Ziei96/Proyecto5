class Particle {
  
  Body body;
  float w;
  float h;
  
  Particle(float x, float y){
    w = 10;
    h = 10;
    makeBody(new Vec2(x,y),w,h);
  }
  
  void killBody(){
    box2d.destroyBody(body);
  }
  
  boolean done(){
    Vec2 pos = box2d.getBodyPixelCoord(body);
    if (pos.y > height){
      killBody();
      return true;
    }
    return false;
  }
  
  
  void display(){
  Vec2 pos = box2d.getBodyPixelCoord(body);
  
  pushMatrix();
  translate(pos.x,pos.y);
  fill(#99B210,200);
  noStroke();
  ellipse(0,0,w,h);
  popMatrix();
  
  }
  
  void makeBody(Vec2 center, float w_, float h_){
    
    PolygonShape sd = new PolygonShape();
    float box2dW = box2d.scalarPixelsToWorld(w_/2);
    float box2dH = box2d.scalarPixelsToWorld(h_/2);
    sd.setAsBox(box2dW, box2dH);

    FixtureDef fd = new FixtureDef();
    fd.shape = sd;
    fd.density = 10;
    fd.friction = 30;
    fd.restitution = 0.5;

    BodyDef bd = new BodyDef();
    bd.type = BodyType.DYNAMIC;
    bd.position.set(box2d.coordPixelsToWorld(center));

    body = box2d.createBody(bd);
    body.createFixture(fd);
  }
}