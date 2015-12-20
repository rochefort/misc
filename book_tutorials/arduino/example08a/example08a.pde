// Example 08A: Arduinoネットワークランプ

//import processing.serial.*;
//println(Serial.list());

import processing.serial.*;
import java.net.URL;
import java.net.URLConnection;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.util.StringTokenizer;

//String feed = "http://makezine.com/feed/";
//String feed = "http://blog.makezine.com/index.xml";
String feed = "http://rss.slashdot.org/Slashdot/slashdot";

int interval = 10;
int lastTime;

int love = 0;
int peace = 0;
int arduino = 0;

int light = 0;

Serial port;
color c;
String cs;

String buffer = "";

PFont font;

void setup() {
  size(640, 480);
  frameRate(10);

  font = loadFont("HelveticaNeue-Bold-32.vlw");
  fill(255);
  textFont(font, 32);

//  String arduinoPort = Serial.list()[0];
  String arduinoPort = Serial.list()[1];
println(arduinoPort);
  port = new Serial(this, arduinoPort, 9600);
  lastTime = 0;
  fetchData();
}

void draw() {
  background(c);
  int n = (interval - ((millis() - lastTime) / 1000));

  // 3つの値をベースに色を組み立てる  
  c = color(peace, love, arduino);
  cs = "#" + hex(c, 6);

  text("Arduino Networked Lamp", 10, 40);
  text("Reading feed:", 10, 100);
  text(feed, 10, 140);

  text("Next update in " + n + " seconds", 10, 450);
  text("peace", 10, 200);
  text(" " + peace, 130, 200);
  rect(200, 172, peace, 28);

  text("love", 10, 240);
  text(" " + love, 130, 240);
  rect(200, 212, love, 28);

  text("arduino", 10, 280);
  text(" " + arduino, 130, 280);
  rect(200, 252, arduino, 28);

  // 画面に色情報を表示
  text("sending", 10, 340);
  text(cs, 200, 340);
  text("light level", 10, 380);
  rect(200, 352, light / 10.23, 28); // 最大1023から最大100に

  if (n <= 0) {
    fetchData();
    lastTime = millis();
  }
  port.write(cs); // Arduinoへデータを送る

//println(port.available());

  if (port.available() > 0) {
    int inByte = port.read(); // 1バイト読み込む
    if (inByte != 10) { // newline(LF)でない
      buffer = buffer + char(inByte);
    }
    else {
      if (buffer.length() > 1) {
        buffer = buffer.substring(0, buffer.length() - 1);
        light = int(buffer);
        buffer = "";

        // 最新おデータを得るために溜まってしまったものは削除
        port.clear();
      }
    }
  }
}

void fetchData() {
  String data;
  String chunk;

  love = 20;
  peace = 30;
  arduino = 40;

  try {
    URL url = new URL(feed);
    URLConnection conn = url.openConnection();
    conn.connect();

    BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream()));

    while ((data = in.readLine()) != null) {
      StringTokenizer st = new StringTokenizer(data, "\"<>,.()[] ");
      while (st.hasMoreTokens()) {
        chunk = st.nextToken().toLowerCase();
        if (chunk.indexOf("love") >= 0)
          love++;
        if (chunk.indexOf("peace") >= 0)
          peace++;
        if (chunk.indexOf("arduino") >= 0)
          arduino++;
      }
    }

    // 各語を参照した回数は64を上限にしておく
    if (love > 64) love = 64;
    if (peace > 64) peace = 64;
    if (arduino > 64) arduino = 64;

    love = love * 4;
    peace = peace * 4;
    arduino = arduino * 4;
  }
  catch (Exception ex) {
    ex.printStackTrace();
    System.out.println("ERROR: " + ex.getMessage());
  }
}

