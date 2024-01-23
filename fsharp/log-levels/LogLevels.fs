module LogLevels

let message (logLine: string): string =
    logLine.Split(':').[1].Trim()

let logLevel(logLine: string): string = 
    let start = logLine.IndexOf('[') + 1
    let ende = logLine.IndexOf(']') - 1
    let mitte = logLine[start..ende]
    mitte.ToLower()

let reformat(logLine: string): string = 
    sprintf "%s (%s)" (message logLine) (logLevel logLine)
