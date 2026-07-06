namespace Directive8020Trainer;

public class EightyTwentyTrainer
{
    private readonly List<string> _scenarios = new()
    {
        "You have 10 tasks to complete. Which 2 will give you 80% of the results?",
        "Your team has 5 projects. Which 1 should you prioritize for maximum impact?",
        "You have 20 customers. Which 4 are responsible for 80% of your revenue?",
        "Your codebase has 50 bugs. Which 10 should you fix first?"
    };

    public void Run()
    {
        var random = new Random();
        var scenario = _scenarios[random.Next(_scenarios.Count)];

        Console.WriteLine(scenario);
        Console.WriteLine("Press any key when you've identified the vital few...");
        Console.ReadKey();

        Console.WriteLine("\nRemember: Focus on the 20% that creates 80% of the value!");
    }
}