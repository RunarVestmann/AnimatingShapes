/*
This example uses the "superformula" to 
both draw and animate shapes.
https://en.wikipedia.org/wiki/Superformula
*/

void setup(){
 size(500,500); 
 noFill();
 stroke(200,0,0);
 strokeWeight(1);
}

final float scale = 200f;
final float thetaDelta = 0.001f;
float t = 0f;
float tDelta = 0.01f; 

void draw(){
  background(0);
  translate(width / 2, height / 2);
  fill(200,0,0);
  beginShape();
  
  for(float theta = 0.0f; theta < 2.0f*PI; theta+=thetaDelta){
    float radius = r(
    theta,
    1, //a
    1, //b
    16, //m1
    16, //m2
    1, //n1
    sin(t) - .4f, //n2
    cos(t) //n3
    );
    //Changing the polar coordinates to cartesian coordinates 
    float x = radius * cos(theta) * scale;
    float y = radius * sin(theta) * scale;
    vertex(x,y);
  }
  endShape();
  t+= tDelta;
}

//The superformula
float r(float theta, float a, float b, float m1, 
        float m2, float n1, float n2, float n3)
{
  return pow(pow(abs(cos(m1 * theta / 4.0f) / a),n2) 
       + pow(abs(sin(m2 * theta / 4.0f) / b),n3),-1.0f / n1); 
}
