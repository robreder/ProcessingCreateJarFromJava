import processing.core.PApplet;

public class MainClass extends PApplet {

    final int MAX_TICKS = 120;
    int ticks = 0;

    public static void main(String[] args) {
        PApplet.main("MainClass", args);
    }

    public void settings() {

    }

    public void setup() {
        frameRate(2);
        System.out.println("Start");
    }

    public void draw() {
        if (ticks < MAX_TICKS) {
            if (ticks % 2 == 0) {
                System.out.print("Tick.");
            } else {
                System.out.print("Tack.");
            }

            ticks++;
        }
    }
}
