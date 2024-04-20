export function hey(message: string): bobish {
  message = message.trimEnd();
  const isShout = !/[a-z]/.test(message) && /[A-Z]/.test(message);
  const isQuestion = message.endsWith("?");
  const isSilence = message.length === 0;
  let key;
  if (isQuestion && isShout)
    key = 4;
  else if (isQuestion)
    key = 2;
  else if (isShout)
    key = 3;
  else if (isSilence)
    key = 1;
  else
    key = 0;
  return bobsAnswers[key];
}

type bobish = typeof bobsAnswers[number];

const bobsAnswers = [
  "Whatever.",
  "Fine. Be that way!",
  "Sure.",
  "Whoa, chill out!",
  "Calm down, I know what I'm doing!",
] as const;
