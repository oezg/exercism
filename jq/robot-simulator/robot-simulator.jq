include "robot-movement";

reduce ((.instructions // "C") / "")[] as $instruction
(
    .robot;
    {
        C: (.),  # C for Creation
        L: turnleft,
        R: turnright,
        A: advance
    }[$instruction]
)