// Exanple 05: ボタンを押すとLEDが点灯し、
// ボタンから指を離した後も点いたままにする
// バウンシングを解消する簡単な方法を取り入れる
// ボタンを押したままにすると明るさが変化する

const int LED = 9;
const int BUTTON = 7;

int val = 0;
int old_val = 0;  // valの前の値を保存しておく変数
int state = 0;    // LEDの状態（0ならオフ、1ならオン）

int brightness = 128;
unsigned long startTime = 0;

void setup() {
  pinMode(LED, OUTPUT);   // ArudionにLEDが出力であると伝える
  pinMode(BUTTON, INPUT); // BUTTONは入力に設定
}

void loop() {
  val = digitalRead(BUTTON);  // 入力を読み取りvalに格納

  // 変化があるかどうかチェック
  if ((val == HIGH) && (old_val == LOW)) {
    state = 1 - state;
    startTime = millis();
    delay(10);
  }
  // ボタンが押し続けられているかチェック
  if ((val == HIGH) && (old_val == HIGH)) {
    // 500ms以上押されているか？
    if (state == 1 && (millis() - startTime) > 500) {
      brightness++;
      delay(10);
      if (brightness > 255) {
        brightness = 0;
      }
    }
  }
  old_val = val;
  if (state == 1) {
    analogWrite(LED, brightness);
  } else {
    analogWrite(LED, 0);
  }
}
