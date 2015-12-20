// Example 07: アナログ入力ピン0の値をコンピュータへ送る

const int SENSOR = 0;
int val = 0;

void setup() {
  Serial.begin(9600); //毎秒9600bitで送信
}

void loop() {
  val = analogRead(0);  // 入力を読み取りvalに格納

  Serial.println(val);
  delay(100);
}
