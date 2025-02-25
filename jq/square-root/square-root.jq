def nextimate: (.estimate + .radicand / .estimate) / 2;

def tolerable: nextimate - .estimate | abs < 0.5;

.estimate = 1 | until(tolerable; .estimate = nextimate) | nextimate | round