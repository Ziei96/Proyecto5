import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;

Box2DProcessing box2d;

PFont letra;

ArrayList<Particle> particles;
//ArrayList<Vec2> surface;
//ArrayList<Vec2> surface2;

Surface surface;
Surface base;

float [] x=new float[900];
float [] y=new float[600];
float [] dx=new float[900];
float [] dy=new float[600];

float delta;

int pantalla=1;

void setup(){
  size(900,600);
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  box2d.setGravity(0, -.5);
  
  particles = new ArrayList<Particle>();
  //surface = new ArrayList<Vec2>();
  //surface2 = new ArrayList<Vec2>(); 
  
  letra=loadFont("ARCARTER-48.vlw");
  
  
  for(int i=0;i<500;i++){
    x[i]=random(500);
    y[i]=random(500);
    dx[i]=random(-1,1);
    dy[i]=random(-1,1);
  }
}

void draw(){
  
  switch(pantalla){
    case 1:
    
      background(#2D5A4C);
      noStroke();
      for(int i=0;i<500;i++){
        fill(#646161,200);
    
        x[i]+=dx[i];
        y[i]+=dy[i];
    
        ellipse(x[i],y[i],10,10);
    
        if(x[i]>900){
         dx[i]*=-1;
        }
       if(x[i]<0){
         dx[i]*=-1;
       }
       if(y[i]>600){
         dy[i]*=-1;
       }
       if(y[i]<0){
         dy[i]*=-1;
       }
     }
     
     textFont(letra);
     textSize(143);
     fill(#2B3252);
     text("Mol",width/2-100,200);
     
     textFont(letra);
     textSize(20);
     fill(#2B3252);
     text("Presiona ENTER",width/2-100,550);
 
       textFont(letra);
       textSize(30);
       fill(#2B3252);
       text("Todo objeto a pesar de ser unico esta formado por muchos componentes,",100,300);
       text("un ejemplo esta en el agua. Las grandes cosas siempre estaran hechas de objetos mas pequeños.",80,350);

       if(key==ENTER){
         pantalla=2;
       }
     
     
     break;
     
     case 2:
       base=surface;
       Tri();
       
       break;
     
  }
  
  
}

void Tri(){
  
  surface = new Surface();
  
  background(#5F616C);
  box2d.step();
  
  
      particles.add(new Particle(width/2,160));  
      particles.add(new Particle(380,310)); 
      particles.add(new Particle(540,310)); 
      
      particles.add(new Particle(720,160));   
      particles.add(new Particle(680,160));
      
      particles.add(new Particle(700,440));
      particles.add(new Particle(700,500));
      
      particles.add(new Particle(140,100));
      particles.add(new Particle(140,400));
   
   
  
  for (Particle x: particles){
    x.display();
  }
  
  for (int i = particles.size()-1; i>=0; i--){
    Particle b = particles.get(i);
    if (b.done()){
      particles.remove(i);
    }
  } 
}