import Foundation

public struct BrailleCode {
    let character: String
    let value: String
    var num_position: Int
}

//    var page_num =  0
var braille_data = [BrailleCode(character: "a", value: "•⁃⁃⁃⁃⁃", num_position: 0), BrailleCode(character: "b", value: "•⁃•⁃⁃⁃", num_position: 0), BrailleCode(character: "c", value: "••⁃⁃⁃⁃", num_position: 0), BrailleCode(character: "d", value: "••⁃•⁃⁃", num_position: 0), BrailleCode(character: "e", value: "•⁃⁃•⁃⁃", num_position: 0), BrailleCode(character: "f", value: "•••⁃⁃⁃", num_position: 0), BrailleCode(character: "g", value: "••••⁃⁃", num_position: 0), BrailleCode(character: "h", value: "•⁃••⁃⁃", num_position: 0), BrailleCode(character: "i", value: "⁃••⁃⁃⁃", num_position: 0), BrailleCode(character: "j", value: "⁃•••⁃⁃", num_position: 0), BrailleCode(character: "k", value: "•⁃⁃⁃•⁃", num_position: 0), BrailleCode(character: "l", value: "•⁃•⁃•⁃", num_position: 0), BrailleCode(character: "m", value: "••⁃⁃•⁃", num_position: 0), BrailleCode(character: "n", value: "••⁃••⁃", num_position: 0), BrailleCode(character: "o", value: "•⁃⁃••⁃", num_position: 0), BrailleCode(character: "p", value: "•••⁃•⁃", num_position: 0), BrailleCode(character: "q", value: "•••••⁃", num_position: 0), BrailleCode(character: "r", value: "•⁃•••⁃", num_position: 0), BrailleCode(character: "s", value: "⁃••⁃•⁃", num_position: 0), BrailleCode(character: "t", value: "⁃••••⁃", num_position: 0), BrailleCode(character: "u", value: "•⁃⁃⁃••", num_position: 0), BrailleCode(character: "v", value: "•⁃•⁃••", num_position: 0), BrailleCode(character: "w", value: "⁃•••⁃•", num_position: 0), BrailleCode(character: "x", value: "••⁃⁃••", num_position: 0), BrailleCode(character: "y", value: "••⁃•••", num_position: 0), BrailleCode(character: "z", value: "•⁃⁃•••", num_position: 0), BrailleCode(character: "space", value: "⁃⁃⁃⁃⁃⁃", num_position: 0), BrailleCode(character: "1", value: "•⁃⁃⁃⁃⁃", num_position: 0), BrailleCode(character: "2", value: "•⁃•⁃⁃⁃", num_position: 0), BrailleCode(character: "3", value: "••⁃⁃⁃⁃", num_position: 0), BrailleCode(character: "4", value: "••⁃•⁃⁃", num_position: 0), BrailleCode(character: "5", value: "•⁃⁃•⁃⁃", num_position: 0), BrailleCode(character: "6", value: "•••⁃⁃⁃", num_position: 0), BrailleCode(character: "7", value: "••••⁃⁃", num_position: 0), BrailleCode(character: "8", value: "•⁃••⁃⁃", num_position: 0), BrailleCode(character: "9", value: "⁃••⁃⁃⁃", num_position: 0), BrailleCode(character: "0", value: "⁃•••⁃⁃", num_position: 0)]

var character_braille_data = [BrailleCode(character: "a", value: "•⁃⁃⁃⁃⁃", num_position: 0), BrailleCode(character: "b", value: "•⁃•⁃⁃⁃", num_position: 0), BrailleCode(character: "c", value: "••⁃⁃⁃⁃", num_position: 0), BrailleCode(character: "d", value: "••⁃•⁃⁃", num_position: 0), BrailleCode(character: "e", value: "•⁃⁃•⁃⁃", num_position: 0), BrailleCode(character: "f", value: "•••⁃⁃⁃", num_position: 0), BrailleCode(character: "g", value: "••••⁃⁃", num_position: 0), BrailleCode(character: "h", value: "•⁃••⁃⁃", num_position: 0), BrailleCode(character: "i", value: "⁃••⁃⁃⁃", num_position: 0), BrailleCode(character: "j", value: "⁃•••⁃⁃", num_position: 0), BrailleCode(character: "k", value: "•⁃⁃⁃•⁃", num_position: 0), BrailleCode(character: "l", value: "•⁃•⁃•⁃", num_position: 0), BrailleCode(character: "m", value: "••⁃⁃•⁃", num_position: 0), BrailleCode(character: "n", value: "••⁃••⁃", num_position: 0), BrailleCode(character: "o", value: "•⁃⁃••⁃", num_position: 0), BrailleCode(character: "p", value: "•••⁃•⁃", num_position: 0), BrailleCode(character: "q", value: "•••••⁃", num_position: 0), BrailleCode(character: "r", value: "•⁃•••⁃", num_position: 0), BrailleCode(character: "s", value: "⁃••⁃•⁃", num_position: 0), BrailleCode(character: "t", value: "⁃••••⁃", num_position: 0), BrailleCode(character: "u", value: "•⁃⁃⁃••", num_position: 0), BrailleCode(character: "v", value: "•⁃•⁃••", num_position: 0), BrailleCode(character: "w", value: "⁃•••⁃•", num_position: 0), BrailleCode(character: "x", value: "••⁃⁃••", num_position: 0), BrailleCode(character: "y", value: "••⁃•••", num_position: 0), BrailleCode(character: "z", value: "•⁃⁃•••", num_position: 0), BrailleCode(character: "space", value: "⁃⁃⁃⁃⁃⁃", num_position: 0)]

var choosenBrailleValue = BrailleCode(character: "", value: "", num_position: 0)
var randomBrailleCharacter = BrailleCode(character: "", value: "", num_position: 0)

var randomised_Braille_Data: [BrailleCode] = []
extension Array {
    func shuffle_Braille() -> [BrailleCode]{
        var repetition_list = character_braille_data
        for _ in 0 ..< repetition_list.count {
            let card = repetition_list.remove(at: Int.random(in: 0..<repetition_list.count))
            repetition_list.insert(card, at: Int.random(in: 0..<repetition_list.count))
        }
        return repetition_list
    }
}

var number_braille_data = [BrailleCode(character: "1", value: "•⁃⁃⁃⁃⁃", num_position: 0), BrailleCode(character: "2", value: "•⁃•⁃⁃⁃", num_position: 0), BrailleCode(character: "3", value: "••⁃⁃⁃⁃", num_position: 0), BrailleCode(character: "4", value: "••⁃•⁃⁃", num_position: 0), BrailleCode(character: "5", value: "•⁃⁃•⁃⁃", num_position: 0), BrailleCode(character: "6", value: "•••⁃⁃⁃", num_position: 0), BrailleCode(character: "7", value: "••••⁃⁃", num_position: 0), BrailleCode(character: "8", value: "•⁃••⁃⁃", num_position: 0), BrailleCode(character: "9", value: "⁃••⁃⁃⁃", num_position: 0), BrailleCode(character: "0", value: "⁃•••⁃⁃", num_position: 0)]
var verified_equation_symbols = ["+", "-", "x"]
