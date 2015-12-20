// Example 06A: アナログ入力の値に応じてLEDの点滅レートが変化

const int LED = 13;   // LEDが接続されているピン

int val = 0;  // 入力ピンの状態がこの変数(val)に記憶される

void setup() {
  pinMode(LED, OUTPUT);   // ArudionにLEDが出力であると伝える
}

void loop() {
  val = analogRead(0);  // 入力を読み取りvalに格納

  digitalWrite(LED, HIGH);
  delay(val);
  digitalWrite(LED, LOW);
  delay(val);
}
