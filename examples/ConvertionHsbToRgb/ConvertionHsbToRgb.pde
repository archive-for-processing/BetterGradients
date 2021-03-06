import luis.ferreira.libraries.color.*;


int detail = 16;
int precision = 4;

float dtf = detail;
float radius;
float y0;
float y1;

String format =
  "0x%s\tH %+." + precision +
  "f\tS %+." + precision +
  "f\tV %+." + precision +
  "f\tA %+." + precision + "f";

int[] clrsa = new int[detail];
int[] clrsb = new int[detail];

void setup() {
  size(512, 128);
  noStroke();
  ellipseMode(RADIUS);
  colorMode(HSB, 1, 1, 1, 1);

  y0 = height * 0.25f;
  y1 = height * 0.75f;
  radius = width / dtf;

  float x, y, z, w;
  float[] rgbas = new float[4];
  for (int i = 0; i < detail; ++i) {

    // Select random values between 0 and 1.
    x = random(0, 1);
    y = random(0, 1);
    z = random(0, 1);
    w = random(0, 1);

    // Compose colors.
    clrsa[i] = color(x, y, z, w);
    clrsb[i] = BetterGradients.composeclr(BetterGradients.hsbToRgb(x, y, z, w, rgbas));
  }
}

void draw() {
  background(0xffffff);
  float x;
  for (int i = 0; i < detail; ++i) {
    x = width * (i + 0.5f) / dtf;
    fill(clrsa[i]);
    ellipse(x, y0, radius, radius);
    fill(clrsb[i]);
    ellipse(x, y1, radius, radius);
  }
}
