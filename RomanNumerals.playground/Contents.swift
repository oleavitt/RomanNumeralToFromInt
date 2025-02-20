import UIKit

// Convert a Roman numeral string to its corresponding integer value

func romanToInt(_ roman: String) -> Int {
    let value: [Character: Int] = [
        "I": 1, "V": 5, "X": 10, "L": 50,
        "C": 100, "D": 500, "M": 1000
    ]
    var sum = 0
    var prevValue = 0
    
    for char in roman {
        let currentValue = value[char] ?? 0
        sum += (currentValue > prevValue) ? (currentValue - 2 * prevValue) : currentValue
        prevValue = currentValue
    }
    return sum
}

romanToInt("")
romanToInt("I")
romanToInt("XXVII")
romanToInt("MCMLXIV")
romanToInt("MCMXLIV")
romanToInt("MM")
romanToInt("MDCCCXCII")
romanToInt("MMMCCCXXXIII")
romanToInt("MMMCMXCIX")

// Convert an integer to a Roman numeral string

func intToRoman(_ value: Int) -> String {
    var roman = ""
    
    let thousands = value / 1000
    if thousands > 3 {
        return "" // The maximum value for the standard Roman Numeral system is 3999
    }
    
    roman += String(repeating: "M", count: thousands)
    
    var remainingValue = value - thousands * 1000
    let hundreds = remainingValue / 100
    switch hundreds {
    case 9:
        roman += "CM"
    case 5...8:
        roman += "D" + String(repeating: "C", count: hundreds - 5)
    case 4:
        roman += "CD"
    default: // 0...3
        roman += String(repeating: "C", count: hundreds)
    }
    
    remainingValue -= hundreds * 100
    let tens = remainingValue / 10
    switch tens {
    case 9:
        roman += "XC"
    case 5...8:
        roman += "L" + String(repeating: "X", count: tens - 5)
    case 4:
        roman += "XL"
    default: // 0...3
        roman += String(repeating: "X", count: tens)
    }
    
    remainingValue -= tens * 10
    switch remainingValue {
    case 9:
        roman += "IX"
    case 5...8:
        roman += "V" + String(repeating: "I", count: remainingValue - 5)
    case 4:
        roman += "IV"
    default: // 0...3
        roman += String(repeating: "I", count: remainingValue)
    }
    
    return roman
}

intToRoman(0)
intToRoman(1)
intToRoman(27)
intToRoman(1964)
intToRoman(1944)
intToRoman(1500)
intToRoman(1607)
intToRoman(2000)
intToRoman(1892)
intToRoman(3333)
intToRoman(3999)
intToRoman(4000)
