//
//  Extensions.swift
//  CanYouRead
//
//  Created by Nurlan on 25/11/2016.
//  Copyright © 2016 Nurlan. All rights reserved.
//

import Foundation

extension String {

    func removeCharsFromEnd(count_:Int) -> String {
        let stringLength = self.characters.count

        let substringIndex = (stringLength < count_) ? 0 : stringLength - count_

        return self.substring(to: self.index(self.startIndex, offsetBy: substringIndex))
    }
}
