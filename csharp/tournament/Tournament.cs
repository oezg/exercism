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
                result.Evaluate();
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

    public static List<Team> SortTeams()
    {
        var teams = new List<Team>(Teams.Values);
        teams.Sort((a, b) =>
        {
            if (a.Points == b.Points)
            {
                return a.Name.CompareTo(b.Name);
            }
            return b.Points.CompareTo(a.Points);
        });
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

    public struct Result
    {
        public string Home;
        public string Away;
        public string Outcome;
        
        public Result(string[] values) 
        { 
            Home = values[0];
            Away = values[1];
            Outcome = values[2];
        }

        public void Evaluate()
        {
            if (!Teams.ContainsKey(Home))
            {
                Teams.Add(Home, new Team(Home));
            }
            if (!Teams.ContainsKey(Away))
            {
                Teams.Add(Away, new Team(Away));
            }
            Team team;
            switch (Outcome)
            {
                case "win":
                    Teams[Home].Wins++;
                    Teams[Away].Losses++;
                    break;
                case "draw":
                    Teams[Home].Draws++;
                    Teams[Away].Draws++;
                    break;
                case "loss":
                    Teams[Home].Losses++;
                    Teams[Away].Wins++;
                    break;
                default: 
                    throw new Exception();
            }
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
            return other.Points - Points;
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
