extension StringProtocol {
    subscript(offset: Int) -> Character {
        self[index(startIndex, offsetBy: offset)]
    }
}

import Foundation

public class Password {
    
    func checkPasswordByValueCount(policy: String, password:String) -> Bool {
        let policyComponents = policy.components(separatedBy: " ")
        let instances = password.components(separatedBy: policyComponents[1])
        let instanceCount = instances.count - 1
        let range = policyComponents[0].components(separatedBy: "-")
        
        let first:Int? = Int(range[0])
        let second:Int? = Int(range[1])

        if first!...second! ~= instanceCount {
            return true
        }
        return false
    }
    
    func countMatchingPasswords(passwordList: [[String]]) -> (Int, Int) {
        var valueCount:Int = 0
        var positionCount:Int = 0
        for password in passwordList {
            let valueMatches = checkPasswordByValueCount(policy: password[0], password: password[1])
            if valueMatches == true {
                valueCount += 1
            }
            let positionMatches = checkPasswordByPosition(policy: password[0], password: password[1])
            if positionMatches == true {
                positionCount += 1
            }
        }
        return (valueCount, positionCount)
    }
    
    func checkPasswordByPosition(policy: String, password:String) -> Bool {
        let policyComponents = policy.components(separatedBy: " ")
        let index = policyComponents[0].components(separatedBy: "-")
        var firstIndex:Int? = Int(index[0])
        var secondIndex:Int? = Int(index[1])
        
        // handle non zero index
        firstIndex! -= 1
        secondIndex! -= 1

        // if both or neither are correct, failure, otherwise one is true
        let letterToCheck = policyComponents[1]
        if letterToCheck == String(password[firstIndex!]) && letterToCheck == String(password[secondIndex!]){
            return false
        } else if letterToCheck != String(password[firstIndex!]) && letterToCheck != String(password[secondIndex!]) {
            return false
        } else {
            return true
        }
    }
}
