import Foundation

public struct EuroMillones {
    public let numbers: [Int]
    public let stars: [Int]
}

public struct Primitiva {
    public let numbers: [Int]
    public let reintegro: Int
    
    public init(numbers: [Int], reintegro: Int) {
        self.numbers = numbers
        self.reintegro = reintegro
    }
}

public struct Lottery {
    public static func draw(count: Int, in range: ClosedRange<Int>) -> [Int] {
        var numbers = Set<Int>()
        while numbers.count < count {
            numbers.insert(Int.random(in: range))
        }
        return numbers.sorted()
    }
    
    public static func drawEuromillones(perColumn: Bool = false) -> EuroMillones {
        let numberRanges: [ClosedRange<Int>] = [
            1...10, 11...20, 21...30, 31...40, 41...50
        ]
        let starRanges: [ClosedRange<Int>] = [
            1...3, 4...6, 7...9, 10...12
        ]
        
        let numbers: [Int]
        if perColumn {
            numbers = numberRanges.map { range in
                Int.random(in: range)
            }.sorted()
        } else {
            numbers = draw(count: 5, in: 1...50)
        }
        
        let stars: [Int]
        if perColumn {
            let shuffledColumns = starRanges.shuffled()
            let chosenColumns = Array(shuffledColumns.prefix(2))
            stars = chosenColumns.map { range in
                Int.random(in: range)
            }.sorted()
        } else {
            stars = draw(count: 2, in: 1...12)
        }
        
        return EuroMillones(numbers: numbers, stars: stars)
    }
    
    
    public static func drawPrimitiva(perColumn: Bool = false) -> Primitiva {
        let numbers: [Int]
        
        if perColumn {
            let columns: [ClosedRange<Int>] = [
                1...13,
                14...26,
                27...39,
                40...49
            ]
            
            var selected = Set<Int>()
            
            for range in columns {
                let num = Int.random(in: range)
                selected.insert(num)
            }
            
            while selected.count < 6 {
                let num = Int.random(in: 1...49)
                selected.insert(num)
            }
            
            numbers = selected.sorted()
        } else {
            numbers = draw(count: 6, in: 1...49)
        }
        
        let reintegro = Int.random(in: 0...9)
        return Primitiva(numbers: numbers, reintegro: reintegro)
    }
}
