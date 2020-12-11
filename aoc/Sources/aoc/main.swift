
var utils = Utils()
var passwordChecker = Password()

// day 2
var formattedData = utils.splitArray(utils.turnToArray(&data))
var matchingPasswords = passwordChecker.countMatchingPasswords(passwordList: formattedData)
print(matchingPasswords)

