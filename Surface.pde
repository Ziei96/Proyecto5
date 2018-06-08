
class Surface {
 
ArrayList<Vec2> surface; 
ArrayList<Vec2> surface2; 

  Surface() {
    
     surface = new ArrayList<Vec2>();
    
        surface.add(new Vec2(width/2,130));
        surface.add(new Vec2(380,250));
        surface.add(new Vec2(520,250));
        surface.add(new Vec2(width/2,130));
        
        surface.add(new Vec2(380,250));
        surface.add(new Vec2(310,370));
        surface.add(new Vec2(width/2,370));
        surface.add(new Vec2(380,250));
        
        surface.add(new Vec2(520,250));
        surface.add(new Vec2(width/2,370));
        surface.add(new Vec2(590,370));
        surface.add(new Vec2(520,250));
        
        surface.add(new Vec2(600,200));
        surface.add(new Vec2(800,200));
        surface.add(new Vec2(830,50));
        surface.add(new Vec2(740,140));
        surface.add(new Vec2(700,50));
        surface.add(new Vec2(660,140));
        surface.add(new Vec2(570,50));
        surface.add(new Vec2(600,200));
        
        surface.add(new Vec2(700,350));
        surface.add(new Vec2(850,450));
        surface.add(new Vec2(700,550));
        surface.add(new Vec2(550,450));
        surface.add(new Vec2(700,350));
        
        surface.add(new Vec2(180,500));
        surface.add(new Vec2(180,250));
        surface.add(new Vec2(140,50));
        surface.add(new Vec2(100,250));
        surface.add(new Vec2(100,500));
        surface.add(new Vec2(180,500));
        
    ChainShape chain = new ChainShape();

    Vec2[] vertices = new Vec2[surface.size()];
    for (int i = 0; i < vertices.length; i++) {
      vertices[i] = box2d.coordPixelsToWorld(surface.get(i));
      
    }
    
    chain.createChain(vertices,vertices.length);
 
    BodyDef bd = new BodyDef();
    Body body = box2d.world.createBody(bd);
    body.createFixture(chain,1);
  }
}