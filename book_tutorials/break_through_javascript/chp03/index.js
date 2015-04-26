window.requestAnimationFrame =
  window.requestAnimationFrame ||
  window.mozRequestAnimationFrame ||
  window.webkitRequestAnimationFrame ||
  window.msRequestAnimationFrame ||
  function(cb) { setTimeout(cb, 17); };

var canvas = document.getElementById('canvas'),
  ctx = canvas.getContext('2d'),
  NUM = 100,
  LIFEMAX = 100,
  particles = [],
  W = 500,
  H = 500;

canvas.width = W;
canvas.height = H;

function Particle(ctx, x, y) {
  this.ctx = ctx;
  this.initialize(x, y);
}

Particle.prototype.initialize = function(x, y) {
  this.x = x || 0;
  this.y = y || 0;
  // this.radius = Math.random()*20;
  this.radius = 150;
  // 速度用のオブジェクトV
  this.v = {
    x: Math.random()*10-5,
    y: Math.random()*10-5
  };
  this.color = {
    r: Math.floor(Math.random()*255),
    g: Math.floor(Math.random()*255),
    b: Math.floor(Math.random()*255),
    a: 1
  };
  this.startLife = Math.ceil(LIFEMAX*Math.random());
  this.life = this.startLife;
};

Particle.prototype.render = function() {
  this.updateParams();
  this.wrapPosition();
  this.updatePosition();
  this.draw();
};

Particle.prototype.draw = function() {
  // 4. サイド図形を描画する
  ctx.beginPath();
  // ctx.fillStyle = "#99ff66";
  // ctx.rect(this.x, this.y, 4, 4);
  ctx.fillStyle = this.gradient();
  ctx.arc(this.x, this.y, this.radius, Math.PI*2, false);
  ctx.fill();
  ctx.closePath();
};

Particle.prototype.gradient = function() {
  // var col = "0, 0, 0";
  var col = this.color.r + ", " + this.color.g + ", " + this.color.b;
  var g = this.ctx.createRadialGradient(this.x, this.y, 0, this.x, this.y, this.radius);
  g.addColorStop(0,   "rgba(" + col + "," + (this.color.a * 1)   + ")");
  g.addColorStop(0.5, "rgba(" + col + "," + (this.color.a * 0.2) + ")");
  g.addColorStop(1,   "rgba(" + col + "," + (this.color.a * 0)   + ")");
  return g;
};

Particle.prototype.updatePosition = function() {
  // 3. 位置をずらす
  this.x += this.v.x;
  this.y += this.v.y;
};

Particle.prototype.wrapPosition = function() {
  if (this.x < 0) this.x = W;
  if (this.x > W) this.x = 0;
  if (this.y < 0) this.y = H;
  if (this.y > H) this.y = 0;
};

Particle.prototype.updateParams = function() {
  var ratio = this.life / this.startLife;
  this.color.a = 1 - ratio;
  this.radius = 30 / ratio;
  if (this.radius > 300) this.radius = 300;
  this.life -= 1;
  if (this.life === 0) this.initialize();
};

for (var i = 0; i < NUM; i++) {
  positionX = Math.random()*W;
  positionY = Math.random()*H;
  particle = new Particle(ctx, positionX, positionY);
  particles.push(particle);
}

// 1. 図形を描画する
render();

function render() {
  // 2. 一度図形を消去する
  ctx.clearRect(0, 0, W, H);

  ctx.globalCompositeOperation = "lighter";

  particles.forEach(function(e) { e.render(); });

  // 5. 一定時間を置く
  requestAnimationFrame(render);
}
