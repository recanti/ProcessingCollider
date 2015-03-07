
// Processing Colider
class Collider {
  
  // position fields
  float radius;
  PVector position; // from the center of the circle
  
  // appearance fields
  color fillColor = color(0,0,0,0);
  color strokeColorPlain = color(25, 25, 25, 50);
  color strokeColorHit = color(125, 0, 0, 50);
  int strokeWidth = 2;
  PShape colliderVisual;
  
  ArrayList<Collider> collisionList;
  
  //----------------------------------------------
  //Method:  Collider() Constructor
  //Purpose:  create a circle Collider with a specified radius and position
  //----------------------------------------------
  Collider(float rad, PVector pos) {
    radius = rad;
    position = pos;
    
    colliderVisual = createShape(ELLIPSE, 0, 0, radius * 2, radius * 2);
    colliderVisual.setFill(fillColor);
    colliderVisual.setStroke(strokeColorPlain);
    colliderVisual.setStrokeWeight(strokeWidth);
    
    collisionList = new ArrayList<Collider>();
  }
  
  //----------------------------------------------
  //Method:  didCollide()
  //Purpose:  check to see if a collider has collided with another collider
  //----------------------------------------------
  boolean didCollide(Collider c) {
    float radSum = radius + c.radius;
    PVector distanceVector = PVector.sub(position, c.position);
    float distance = distanceVector.mag();
    //float distance = sqrt(pow(position.x - c.position.x, 2) + pow(position.y - c.position.y, 2));
    if (radSum >= distance) {
      return true;
    }
    return false;
  }
  
  //----------------------------------------------
  //Method:  display()
  //Purpose:  display the circle collider
  //----------------------------------------------
  void display() {
    if(collisionList.size() > 0) {
      color collideColor = color(255, 0, 0, collisionList.size() * 5);
      colliderVisual.setStroke(collideColor);
    } else {
      colliderVisual.setStroke(strokeColorPlain);
    }
    pushMatrix();
      translate(position.x - radius, position.y - radius);
      shape(colliderVisual);
    popMatrix();
  }
  
  void updatePosition(float x, float y) {
    position.x = x;
    position.y = y;
  }
  
}
