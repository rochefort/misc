// Example 02: ボタンが押されている間、LEDを点ける

const int LED = 13;   // LEDが接続されているピン
const int BUTTON = 7; // プシュボタンが接続されているピン

int val = 0;  // 入力ピンの状態がこの変数(val)に記憶される

void setup() {
  pinMode(LED, OUTPUT);   // ArudionにLEDが出力であると伝える
  pinMode(BUTTON, INPUT); // BUTTONは入力に設定
}

void loop() {
  val = digitalRead(BUTTON);  // 入力を読み取りvalに格納

  // 入力はHIGH（ボタンが押されている状態）か？
  if (val == HIGH) {
    digitalWrite(LED, HIGH);
  } else {
    digitalWrite(LED, LOW);
  }
}
