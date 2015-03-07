ColliderManager cm;
ArrayList<Collider> colliderList;
Collider mouseCollider;
int numColliders = 40;

float dimX = 500;
float dimY = 500;

void setup() {
  size(500, 500, P2D);
  cm = new ColliderManager();
  colliderList = new ArrayList<Collider>();
  mouseCollider = cm.createCollider(50);
  for(int i = 0; i < numColliders; i++) {
    colliderList.add(cm.createCollider(50));
  }
}

void draw() {
  background(255, 255, 255);
  cm.detectCollisions();
  mouseCollider.updatePosition(mouseX, mouseY);
  for(int i = 0; i < numColliders; i++) {
    colliderList.get(i).display();
  }
  mouseCollider.display();
}

void keyPressed() {
  if (keyCode == 'R') {
    for(int i = 0; i < numColliders; i++) {
      colliderList.get(i).position.x = random(0, dimX);
      colliderList.get(i).position.y = random(0, dimY);
    }
  }
}

