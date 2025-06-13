import Foundation
import ArgumentParser
import LotteryNumbersCore

struct LotteryNumbersCLI: ParsableCommand {
    @Argument(help: "Choose lottery draw: primitiva, euromillones, all")
    var drawType: String
    
    @Option(name: .shortAndLong, help: "Use perColumn mode (true/false)")
    var perColumn: Bool = false
    
    func run() throws {
        switch drawType.lowercased() {
        case "primitiva":
            let result = Lottery.drawPrimitiva(perColumn: perColumn)
            print("Primitiva numbers: \(result.numbers.map(String.init).joined(separator: ", "))")
            print("Reintegro: \(result.reintegro)")
            
        case "euromillones":
            let result = Lottery.drawEuromillones(perColumn: perColumn)
            print("Euromillones numbers: \(result.numbers.map(String.init).joined(separator: ", "))")
            print("Stars: \(result.stars.map(String.init).joined(separator: ", "))")
            
        case "all":
            let primitiva = Lottery.drawPrimitiva(perColumn: perColumn)
            let euromillones = Lottery.drawEuromillones(perColumn: perColumn)
            
            print("Primitiva numbers: \(primitiva.numbers.map(String.init).joined(separator: ", "))")
            print("Reintegro: \(primitiva.reintegro)")
            
            print("Euromillones numbers: \(euromillones.numbers.map(String.init).joined(separator: ", "))")
            print("Stars: \(euromillones.stars.map(String.init).joined(separator: ", "))")
            
        default:
            print("Unknown draw type. Please choose primitiva, euromillones or all.")
            Self.exit(withError: ExitCode(1))
        }
    }
}

LotteryNumbersCLI.main()
