import Testing
@testable import LotteryNumbersCore

struct LotteryNumbersTests {
    
    @Test func testDrawEuromillonesDefault() {
        let result = Lottery.drawEuromillones(perColumn: false)
        #expect(result.numbers.count == 5)
        #expect(result.stars.count == 2)
        
        #expect(result.numbers.allSatisfy { (1...50).contains($0) })
        #expect(result.stars.allSatisfy { (1...12).contains($0) })
        
        #expect(Set(result.numbers).count == 5)
        #expect(Set(result.stars).count == 2)
    }
    
    @Test func testDrawEuromillonesPerColumnNumbers() {
        let result = Lottery.drawEuromillones(perColumn: true)
        #expect(result.numbers.count == 5)
        #expect(result.stars.count == 2)
        
        let numberColumns: [ClosedRange<Int>] = [
            1...10, 11...20, 21...30, 31...40, 41...50
        ]
        for (index, number) in result.numbers.enumerated() {
            #expect(numberColumns[index].contains(number), "Number \(number) is not in column \(index + 1) range \(numberColumns[index])")
        }
        
        #expect(Set(result.numbers).count == 5)
        
        #expect(result.stars.allSatisfy { (1...12).contains($0) })
        #expect(Set(result.stars).count == 2)
        
        #expect(result.numbers.allSatisfy { (1...50).contains($0) })
        #expect(result.stars.allSatisfy { (1...12).contains($0) })
        
        #expect(Set(result.numbers).count == 5)
        #expect(Set(result.stars).count == 2)
    }
    
    @Test func testDrawPrimitivaDefault() {
        let result = Lottery.drawPrimitiva(perColumn: false)
        
        #expect(result.numbers.count == 6)
        #expect(result.numbers.allSatisfy { (1...49).contains($0) })
        #expect(Set(result.numbers).count == 6)
        
        #expect((0...9).contains(result.reintegro))
    }
    
    @Test func testDrawPrimitivaPerColumn() {
        let result = Lottery.drawPrimitiva(perColumn: true)
        
        #expect(result.numbers.count == 6)
        #expect((0...9).contains(result.reintegro))
        
        let columns: [ClosedRange<Int>] = [
            1...13,
            14...26,
            27...39,
            40...49
        ]
        
        for column in columns {
            let containsNumberInColumn = result.numbers.contains(where: { column.contains($0) })
            #expect(containsNumberInColumn, "Result numbers does not contain any number from column range \(column)")
        }
        
        #expect(Set(result.numbers).count == 6)
        
        #expect(result.numbers.allSatisfy { (1...49).contains($0) })
    }
}
