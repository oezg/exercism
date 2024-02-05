module LogLevels

let message(logLine: string): string =
    logLine.Split(':').[1].Trim()

let logLevel(logLine: string): string = 
    logLine[
        logLine.IndexOf('[') + 1..logLine.IndexOf(']') - 1
    ].ToLower()

let reformat(logLine: string): string = 
    sprintf "%s (%s)" (message logLine) (logLevel logLine)
