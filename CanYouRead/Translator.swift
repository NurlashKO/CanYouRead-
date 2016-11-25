//
//  Translator.swift
//  CanYouRead
//
//  Created by Nurlan on 25/11/2016.
//  Copyright © 2016 Nurlan. All rights reserved.
//

import Foundation
import UIKit

class Translator {

    let dictionary: Dictionary<String, String>

    init(newDictionary: Dictionary<String, String>) {
        dictionary = newDictionary
    }

    func translate(text: String, difficultyLevel: DifficultyLevel) -> String {
        var result = "", cur = ""

        if difficultyLevel == .original {
            return text
        }
        for ch in text.characters {
            cur.append(ch)
            if (arc4random_uniform(UInt32(difficultyLevel.rawValue)) == 0) {
                for (key, value) in dictionary {
                    if (cur.hasSuffix(key)) {
                        result.append(cur.removeCharsFromEnd(count_: key.characters.count))
                        result.append(value)
                        cur = ""
                        break
                    }
                }
            }
        }
        return result + cur
    }
}

enum DifficultyLevel: Int {
    case original = 0
    case simple = 20
    case readable = 10
    case guesses = 5
    case full = 1
}
