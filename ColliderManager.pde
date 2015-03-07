
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
  
  void detectCollisions() {
    for (int i = 0; i < item.size(); i++) {
      ArrayList<Collider> collisionList = new ArrayList<Collider>();
      for(int j = 0; j < item.size(); j++) {
        if(item.get(i).didCollide(item.get(j))) {
          collisionList.add(item.get(j));
        }
      }
      item.get(i).collisionList = collisionList;
    }
  }
}
