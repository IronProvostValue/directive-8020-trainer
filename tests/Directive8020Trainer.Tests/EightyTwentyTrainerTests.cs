using Xunit;

namespace Directive8020Trainer.Tests;

public class EightyTwentyTrainerTests
{
    [Fact]
    public void Run_ShouldNotThrowException()
    {
        var trainer = new EightyTwentyTrainer();
        var exception = Record.Exception(() => trainer.Run());
        Assert.Null(exception);
    }

    [Fact]
    public void Scenarios_ShouldNotBeEmpty()
    {
        var trainer = new EightyTwentyTrainer();
        var field = trainer.GetType().GetField("_scenarios", System.Reflection.BindingFlags.NonPublic | System.Reflection.BindingFlags.Instance);
        var scenarios = field?.GetValue(trainer) as List<string>;
        Assert.NotEmpty(scenarios!);
    }
}