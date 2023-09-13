using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;

public static class Tournament
{
    public static Dictionary<string, Team> Teams { get; set; }

    public static void Tally(Stream inStream, Stream outStream)
    {
        Teams = new Dictionary<string, Team>();

        using (StreamReader streamReader = new StreamReader(inStream))
        {
            string line;
            while ((line = streamReader.ReadLine()) != null)
            {
                var result = new Result(line.Split(';'));
                Teams.Evaluate(result);
            }
        }

        var sortedTeams = SortTeams();

        using (StreamWriter streamWriter = new StreamWriter(outStream))
        {
            string line = GetHeaders().Trim();
            streamWriter.Write(line);
            foreach (var team in sortedTeams)
            {
                streamWriter.Write(team.ToString());
            }
        }
    }

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

    public static IEnumerable<Team> SortTeams()
    {
        var teams = new List<Team>(Teams.Values);
        teams.Sort();
        return teams;
    }

    public static string GetHeaders()
    {
        return FormatLine(new string[] { "Team", "MP", "W", "D", "L", "P" }) ;
    }

    public static string FormatLine(string[] args)
    {
        return $"\n{args[0], -30} | {args[1], 2} | {args[2], 2} | {args[3], 2} | {args[4], 2} | {args[5], 2}";
    }

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
        {
            if (Points == other.Points)
            {
                return Name.CompareTo(other.Name);
            }
            return other.Points.CompareTo(Points);
        }

        public override string ToString()
        {
            return FormatLine(new string[]
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
}
