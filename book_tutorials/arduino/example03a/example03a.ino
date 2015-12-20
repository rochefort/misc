// Example 03A: ボタンを押すとLEDが点灯し、
// ボタンから指を離した後も点いたままにする

const int LED = 13;   // LEDが接続されているピン
const int BUTTON = 7; // プシュボタンが接続されているピン

int val = 0;    // 入力ピンの状態がこの変数(val)に記憶される
int state = 0;  // LEDの状態（0ならオフ、1ならオン）

void setup() {
  pinMode(LED, OUTPUT);   // ArudionにLEDが出力であると伝える
  pinMode(BUTTON, INPUT); // BUTTONは入力に設定
}

void loop() {
  val = digitalRead(BUTTON);  // 入力を読み取りvalに格納

  // 入力がHIGH（ボタンが押されている）なら状態(state)を変更
  if (val == HIGH) {
    state = 1 -state;
  }

  // 入力はHIGH（ボタンが押されている状態）か？
  if (state == 1) {
    digitalWrite(LED, HIGH);
  } else {
    digitalWrite(LED, LOW);
  }
}
