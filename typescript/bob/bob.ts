export function hey(message: string): BobsResponse {
  message = message.trimEnd();
  const isShout = !/[a-z]/.test(message) && /[A-Z]/.test(message);
  const isQuestion = message.endsWith("?");
  const isSilence = message.length === 0;
  if (isQuestion && isShout)
    return BobsResponse.toShoutingQuestions;
  if (isQuestion)
    return BobsResponse.toQuestions;
  if (isShout)
    return BobsResponse.toShout;
  if (isSilence)
    return BobsResponse.toSilence;
  return BobsResponse.toAnythingElse;
}

enum BobsResponse {
  toSilence = "Fine. Be that way!",
  toShout = "Whoa, chill out!",
  toAnythingElse = "Whatever.",
  toQuestions = "Sure.",
  toShoutingQuestions = "Calm down, I know what I'm doing!",
}