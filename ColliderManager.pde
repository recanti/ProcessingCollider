
class ColliderManager {
  
  // fields
  ArrayList<Collider> item;
  
  //----------------------------------------------
  //Method:  ColliderManager() Constructor
  //Purpose:  create an object that keeps track of multiple colliders
  //----------------------------------------------
  ColliderManager () {
    item = new ArrayList<Collider>();
  }
  
  //----------------------------------------------
  //Method:  Collider createCollider()
  //Purpose:  creates a new Collider and adds it to "item."
  //          The Collider is then returned
  //Parameters:
  //          radius (float): the radius of the collider
  //----------------------------------------------
  Collider createCollider(float radius) {
    Collider c = new Collider(radius, new PVector(0, 0));
    item.add(c);
    return c;
  }
}
