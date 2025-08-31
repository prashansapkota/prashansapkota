String[][] strs = new String[5][2];
PFont font;

void setup() {
  size(1920, 1080);
  // Use a generated VLW font (see steps below) OR switch to a system font.
  // If you generate: Tools → Create Font… → pick Helvetica Neue 48 → OK
  // Then use the generated name here, e.g. "HelveticaNeue-48.vlw"
  font = loadFont("HelveticaNeue-48.vlw"); // or: createFont("SansSerif", 48, true);
  textFont(font);
  frameRate(30);
  textAlign(CENTER);
  textSize(40);
  background(255);
  fill(0);

  strs[0][0] = "Hey there!";
  strs[0][1] = "I'm Prashan Sapkota.";

  strs[1][0] = "Software Engineer & Machine Learning Enthusiast";
  strs[1][1] = "I blend modern web with practical AI.";

  strs[2][0] = "Currently learning:";
  strs[2][1] = "DSA • PyTorch ";

  strs[3][0] = "I've built apps, sites, and ML demos";
  strs[3][1] = "Focused on real UX with real models.";

  strs[4][0] = "Let's connect";
  strs[4][1] = "LinkedIn: /in/prashansapkota  |  IG: @prashansapkota";
}

int i = 0;
boolean deleting = false;
int s = 0;                 // slide index
int offset = 50;
int mainFontSize = 60;
int secondaryFontSize = 40;

void draw() {
  background(255);

  if (s < strs.length) {
    // TYPE FORWARD
    if ((strs[s][0].length() >= i || strs[s][1].length() >= i) && !deleting) {
      if (strs[s][0].length() >= i) {
        textSize(mainFontSize);
        text(strs[s][0].substring(0, i), width/2, height/2 - offset);
      } else {
        textSize(mainFontSize);
        text(strs[s][0], width/2, height/2 - offset);
      }
      if (strs[s][1].length() >= i) {
        textSize(secondaryFontSize);
        text(strs[s][1].substring(0, i), width/2, height/2 + offset);
      } else {
        textSize(secondaryFontSize);
        text(strs[s][1], width/2, height/2 + offset);
      }
      i++;
    } else {
      // HOLD FULL TEXT BRIEFLY, THEN DELETE
      if (!deleting) {
        delay(1500);  // matches the simple blocking pause style
      }
      deleting = true;
    }

    // DELETE BACKWARD
    if (deleting) {
      if (i > 0) {
        if (i < strs[s][0].length()) {
          textSize(mainFontSize);
          text(strs[s][0].substring(0, i - 1), width/2, height/2 - offset);
        } else {
          textSize(mainFontSize);
          text(strs[s][0], width/2, height/2 - offset);
        }
        if (i < strs[s][1].length()) {
          textSize(secondaryFontSize);
          text(strs[s][1].substring(0, i - 1), width/2, height/2 + offset);
        } else {
          textSize(secondaryFontSize);
          text(strs[s][1], width/2, height/2 + offset);
        }
        i--;
      } else {
        deleting = false;
        s++;
        if (s >= strs.length) {
          // loop like the reference (optional)
          s = 0;
        }
      }
    }
  }
}
