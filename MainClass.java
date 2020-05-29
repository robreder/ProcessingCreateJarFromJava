import processing.core.PApplet;

public class MainClass extends PApplet {

    final int MAX_TIME = 60;
    double ticks = 0;

    public static void main(String[] args) {
        PApplet.main("MainClass", args);
    }

    public void settings() {
        size(600,400);
    }

    public void setup() {
        //frameRate(50);
        System.out.println("Start - App will run for about 1 Minute.");
    }

    public void draw() {
        // sets the background of the window to red
        background(color(255,0,0));
        // sets the fill color to yellow
        fill(color(255,255,0));
        // draws a ball to the window (position changes about every second)
        ellipse((int)ticks,(int)ticks,20,20);
        if (ticks >= MAX_TIME) {
            System.out.println("Window cloaed after one Minute!");
            exit();
        }
        ticks += 1/frameRate;
        // draws a blue semi-transparent ball to the window following the mouse
        fill(color(0,0,255,125));
        ellipse(mouseX, mouseY, 30,30);
    }
}
