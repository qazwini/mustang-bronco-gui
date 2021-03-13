// mb.swift

import Foundation

func mustangBronco(_ input: String) -> String {
    guard let intValue = Int(input) else {
        return "Enter an int"
    }

    let divs3 = intValue % 3 == 0
    let divs5 = intValue % 5 == 0

    if divs3 && divs5 {
        return "MustangBronco"
    } else if divs3 {
        return "Mustang"
    } else if divs5 {
        return "Bronco"
    } else {
        return input
    }
}
