// Example 06B: アナログ入力の値に応じてLEDの明るさを変える

const int LED = 9;   // LEDが接続されているピン
int val = 0;  // 入力ピンの状態がこの変数(val)に記憶される

void setup() {
  pinMode(LED, OUTPUT);   // ArudionにLEDが出力であると伝える
}

void loop() {
  val = analogRead(0);  // 入力を読み取りvalに格納

  analogWrite(LED, val/4);
  delay(10);
}
