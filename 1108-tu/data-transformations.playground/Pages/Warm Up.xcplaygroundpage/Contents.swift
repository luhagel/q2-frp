//: [Next](@next)
/*:
 
 ### Challenges
 
 Write the following functions: 
 
 1. `makeAllUppercase` that takes an array of `String`s and returns an array of `String`s; all the strings in the returned array should only contain uppercase characters
 2. `convertAllToString` that takes an array of `Int`s and returns an array of `String`s where every `Int` was transformed to a `String`
 3. `keepOnlyOdds` that takes an array of `Int`s and returns an array of `Int`s that only has odd numbers
 4. `startingWithA` that takes an array of `String`s and returns an array of `String`s that only contains `String`s that start with the (uppercase) letter `A`
 5. `computeProduct` that takes an array of `Int`s and returns a single `Int` that is the product of all the elements in the array
 6. `concatenateAll` that takes an array of `String`s and returns a `String` that is concatenates all the elements in the array
 
 */
func makeAllUppercase(strings: [String]) -> [String] {
  var uppercaseStrings: [String] = []
  for string in strings {
    uppercaseStrings += [string.uppercased()]
  }
  return uppercaseStrings
}

func convertAllToString(ints: [Int]) -> [String] {
  var strings: [String] = []
  for int in ints {
    strings += [String(int)]
  }
  return strings
}

func keepOnlyOdd(ints: [Int]) -> [Int] {
  var odds: [Int] = []
  
  for int in ints {
    if int%2 == 0 {
      odds += [int]
    }
  }
  return odds
}

func startingWithA(strings: [String]) -> [String] {
  var startsWithA: [String] = []
  
  for string in strings {
    if string.hasPrefix("A") {
      startsWithA += [string]
    }
  }
  
  return startsWithA
}

func computeProduct(array: [Int]) -> Int {
  return array.reduce(0,+)
}

func concatAll(strings: [String]) -> String {
  return strings.reduce("", {$0 + $1})
}

