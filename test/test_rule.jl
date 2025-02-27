@testset "Rule Tests" begin
    transactions = CSV.read("test_data/wiki.csv", DataFrame)
    antecedent = Attribute[CategoricalAttribute("Feat1", "A")]
    consequent = Attribute[NumericalAttribute("Feat2", 0, 0)]
    rule = Rule(antecedent, consequent, transactions)

    @test rule == Rule(rule, transactions)
    @test rule == Rule(antecedent, consequent, -Inf, ContingencyTable(3, 1, 1, 2))
    @test rule.fitness == -Inf
    @test countall(rule) == 3
    @test countlhs(rule) == 1
    @test countrhs(rule) == 1
    @test countnull(rule) == 2
end
