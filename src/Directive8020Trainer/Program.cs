using Spectre.Console;

namespace Directive8020Trainer;

public static class Program
{
    public static void Main()
    {
        AnsiConsole.Write(new FigletText("Directive 80/20").Color(Color.Red));
        AnsiConsole.MarkupLine("[bold]Interactive 80/20 Principle Trainer[/]");
        AnsiConsole.WriteLine();

        var trainer = new EightyTwentyTrainer();
        trainer.Run();
    }
}