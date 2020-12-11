//
//  Utils.swift
//  
//
//  Created by Emsley, Rachel (Associate Software Developer) on 11/12/2020.
//

import Foundation

public class Utils {
    func turnToArray (_ data: inout String) -> [String] {
    data.components(separatedBy: "\n").map {String($0)}
    }

    func splitArray(_ data: [String]) -> [[String]] {
    var newArray = [[String]] ()
    for item in data {
        let new = item.components(separatedBy: ": ")
        newArray.append(new)
    }
    return newArray
    }
}
