using System;
using System.Diagnostics;
using System.Linq;

var N = 1000 * 1000;
var timer = new Stopwatch();
timer.Start();
Sieve.Primes(N).ToArray();
timer.Stop();
Console.WriteLine(timer.Elapsed.ToString(@"m\:ss\.fff"));