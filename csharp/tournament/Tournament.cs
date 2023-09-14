using System;
using System.Collections.Generic;
using System.IO;

public static class Tournament
{
    // Teams dictionary is the container for the teams in the tournament
    // ToDo: Reduce the redundant saving of team name as dictionary key and instance field
    public static Dictionary<string, Team> Teams { get; set; }

    public static void Tally(Stream inStream, Stream outStream)
    {
        Teams = new Dictionary<string, Team>();

        using var streamReader = new StreamReader(inStream);
        
        string line;
        while ((line = streamReader.ReadLine()) != null)
        {
            var result = new Result(line.Split(';'));
            Teams.Evaluate(result);
        }
        
        var sortedTeams = new List<Team>(Teams.Values);
        sortedTeams.Sort();

        using var streamWriter = new StreamWriter(outStream);
        
        streamWriter.Write(GetHeaders());
        foreach (var team in sortedTeams)
        {
            streamWriter.WriteUnixLine(team.ToString());
        }
    }

    // WriteUnixLine extends StreamWriter to write a new line without \r
    public static void WriteUnixLine(this StreamWriter streamWriter, string s)
        => streamWriter.Write("\n" + s);
    

    // Evaluate extension method updates Teams dict according to the result
    public static void Evaluate(this Dictionary<string, Team> dict, Result result)
    {
        dict.TryAdd(result.Home, new Team(result.Home));
        dict.TryAdd(result.Away, new Team(result.Away));
        switch (result.Outcome)
        {
            case Outcome.Win:
                dict[result.Home].Wins++;
                dict[result.Away].Losses++;
                break;
            case Outcome.Draw:
                dict[result.Home].Draws++;
                dict[result.Away].Draws++;
                break;
            case Outcome.Loss:
                dict[result.Home].Losses++;
                dict[result.Away].Wins++;
                break;
            default:
                throw new Exception();
        }
    }

    public static string GetHeaders() 
        => FormatLine(new string[] { "Team", "MP", "W", "D", "L", "P" });

    public static string FormatLine(string[] args)
        => $"{args[0],-30} | {args[1],2} | {args[2],2} | {args[3],2} | {args[4],2} | {args[5],2}";

    public enum Outcome
    {
        Loss,
        Draw,
        Win,
    }

    public struct Result
    {
        public string Home;
        public string Away;
        public Outcome Outcome;
        
        public Result(string[] values) 
        { 
            Home = values[0];
            Away = values[1];
            Outcome = values[2] switch {
               "win" => Outcome.Win,
               "draw" => Outcome.Draw,
               "loss" => Outcome.Loss,
               _ => throw new NotImplementedException("Unknown outcome")
            };
        }
    }

    public class Team : IComparable<Team>
    {
        public string Name;

        public Team(string name) => Name = name;

        public int Points => Wins * 3 + Draws;
        public int MatchesPlayed => Wins + Losses + Draws;
        public int Wins;
        public int Losses;
        public int Draws;

        public int CompareTo(Team other) 
            => Points == other.Points ? Name.CompareTo(other.Name) : other.Points.CompareTo(Points);

        public override string ToString() 
            => FormatLine(new string[]
            {
                Name,
                MatchesPlayed.ToString(),
                Wins.ToString(),
                Draws.ToString(),
                Losses.ToString(),
                Points.ToString()
            });
    }
}
