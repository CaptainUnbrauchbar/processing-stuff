import java.util.Random;
import java.util.Arrays;

int n = 11;
int[] nums = new int[n];
int[] shuffled = new int[n];
int count = 0;
int fr = 60;
int x = fr;

void setup() {
    count = 0;
    
    size(600, 600);
    for (int i = 0; i < nums.length; i++) {
        nums[i] = i+1;
        shuffled[i] = i+1;
    }
    shuffleArray(shuffled);
}

void draw() {
    frameRate(fr);
    background(255);
    fill(200);
    stroke(100);
    strokeWeight(1);
    if(!Arrays.equals(nums, shuffled)){
        shuffleArray(shuffled);
        count++;
    }
    for (int i = 0; i < nums.length; i++) {
        pushMatrix();
        translate(i*width/n, height);
        rect(0, 0, width/n, -shuffled[i] * height/n);
        popMatrix();
    }
    fill(1);
    textAlign(CENTER);
    text("Framerate", 300, 20);
    text("Erwartet", 560, 20);
    text("Versuche", 40, 20);
    text(count, 40, 40);
    text((int) factorial(n), 560, 40);
    text(fr, 300, 40);
    delay(0);
}

int factorial(int f) {
    return ((f == 0) ? 1 : f * factorial(f - 1)); 
}

void shuffleArray(int[] toSort) {
    for (int i = 0; i < toSort.length*1; ++i) {
        Random r = new Random();
        int a = r.nextInt(toSort.length);
        int b = r.nextInt(toSort.length);
        int temp = toSort[a];
        toSort[a] = toSort[b];
        toSort[b] = temp;
    } 
}

void keyPressed() {
  if (key == ENTER) { setup(); }
  if (key == 's') { noLoop(); } 
  if (key == 'g') { loop(); }
  if (key == '+') {x += log((float)fr+1)*7;}
  if (key == '-') {x -= log((float)fr+1)*7;}
  if (x <= 0) {x = 1;}
  fr = x;
}
