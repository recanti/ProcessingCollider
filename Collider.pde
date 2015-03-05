// Processing Colider
class Collider {
  
  // position fields
  float radius;
  PVector position; // from the center of the circle
  
  // appearance fields
  color fillColor = color(0,0,0,0);
  color strokeColorPlain = color(25, 25, 25, 50);
  color strokeColorHit = color(25, 0, 0, 50);
  int strokeWidth = 2;
  PShape colliderVisual;
  
  //----------------------------------------------
  //Method:  Collider() Constructor
  //Purpose:  create a circle Collider with a specified radius and position
  //----------------------------------------------
  Collider(float rad, PVector pos) {
    radius = rad;
    position = pos;
    
    colliderVisual = createShape(ELLIPSE, 0, 0, radius * 2, radius * 2);
    colliderVisual.setFill(fillColor);
    colliderVisual.setStroke(strokeColor);
    colliderVisual.setStrokeWeight(strokeWidth);
  }
  
  //----------------------------------------------
  //Method:  didCollide()
  //Purpose:  check to see if a collider has collided with another collider
  //----------------------------------------------
  boolean didCollide(Collider c) {
    float radSum = radius + c.radius;
    float distance = sqrt(pow(position.x - c.position.x, 2) + pow(position.y - c.position.y, 2));
    if (radSum > distance) {
      return true;
    }
    return false;
  }
  
  //----------------------------------------------
  //Method:  display()
  //Purpose:  display the circle collider
  //----------------------------------------------
  void display() {
    pushMatrix();
      translate(position.x - radius, position.y - radius);
      shape(colliderVisual);
    popMatrix();
  }
  
}
