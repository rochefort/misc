// Exanple 04: LECのフェードインとフェードアウト
// スリープ状態のMacのように

const int LED = 9;
int i = 0;

void setup() {
  pinMode(LED, OUTPUT); // LEDのピンの出力に設定
}

void loop() {
  for (i = 0; i < 255; i++) {
    analogWrite(LED, i);
    delay(10);  // 10ミリ秒停止 analogWrite()は一瞬なので必要
  }
  for (i = 255; i > 0; i--) {
    analogWrite(LED, i);
    delay(10);
  }
}
