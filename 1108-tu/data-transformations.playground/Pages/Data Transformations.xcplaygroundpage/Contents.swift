//: [Previous](@previous)
/*:
 `map`, `filter` and `reduce` are the most important building blocks in functional programming. In essence, all of them are abstractions over common operations on collections (e.g. arrays):
 
 1. `map` will take each element of a collection and _transform_ it to something else
 2. `filter` will _remove_ certain elements from an array that don't adhere to a given condition
 3. `reduce` _combines_ all the elements of an array and outputs a single value
 
 On this playground page, we will implement our own versions of these functions.
 
 ### Challenges
 
 Write the following functions:
 
 1. `func mapIntsToInts(array: [Int], transform: (Int) -> Int) -> [Int]` that applies the `transform` closure on each element in the input `array`
 2. `func mapIntsToStrings(array: [Int], transform: (Int) -> String) -> [String]` that applies the `transform` closure on each element in the input `array`
 3. `func filterInts(array: [Int], isIncluded: (Int) -> Bool) -> [Int]` that only keeps those elements from the input `array` for which `isIncluded` is `true`
 4. `func filterStrings(array: [String], isIncluded: (String) -> Bool) -> [String]` that only keeps those elements from the input `array` for which `isIncluded` is `true`
 5. `func reduceIntsToInt(array: [Int], initial: Int, combine: (Int, Int) -> Int) -> Int` that reduces all the elements in the input `array` to one single output element of type `Int` by applying the `combine` function to each intermediate result and the current value in the input `array`
 6. `func reduceStringsToStrings(array: [String], initial: String, combine: (String, String) -> String) -> String` that reduces all the elements in the input `array` to one single output element of type `String` by applying the `combine` function to each intermediate result and the current value in the input `array`
 7. `func map<T, U>(array: [T], transform: (T) -> U) -> [U]` that applies the `transform` closure on each element in the input `array`
 8. `func filter<T>(array: [T], isIncluded: (T) -> Bool) -> [T]` that only keeps those elements from the input `array` for which `isIncluded` is `true`
 9. `func reduce<T, U>(array: [T], initial: U, combine: (U, T) -> U) -> U`
 10. recursive versions of `map`, `filter` and `reduce` 😏
 */
func mapIntsToInts(array: [Int], transform: (Int) -> Int) -> [Int] {
  var mappedArray: [Int] = []
  for value in array {
    mappedArray += [transform(value)]
  }
  return mappedArray
}

func mapIntsToStrings(array: [Int], transform: (Int) -> String) -> [String] {
  var mappedArray: [String] = []
  for value in array {
    mappedArray += [transform(value)]
  }
  return mappedArray
}

func filterInts(array: [Int], isIncluded: (Int) -> Bool) -> [Int] {
  var filteredArray: [Int] = []
  for value in array {
    if isIncluded(value) {
      filteredArray += [value]
    }
  }
  return filteredArray
}

func filterStrings(array: [String], isIncluded: (String) -> Bool) -> [String] {
  var filteredArray: [String] = []
  for value in array {
    if isIncluded(value) {
      filteredArray += [value]
    }
  }
  return filteredArray
}

func reduceIntsToInt(array: [Int], initial: Int, combine: (Int, Int) -> Int) -> Int {
  var reducedValue: Int = initial
  for value in array {
    reducedValue = combine(reducedValue, value)
  }
  return reducedValue
}

func reduceStringsToStrings(array: [String], initial: String, combine: (String, String) -> String) -> String {
  var reducedValue: String = initial
  for value in array {
    reducedValue = combine(reducedValue, value)
  }
  return reducedValue
}

func map<T, U>(array: [T], transform: (T) -> U) -> [U] {
  var mappedArray: [U] = []
  for value in array {
    mappedArray += [transform(value)]
  }
  return mappedArray
}

func filter<T>(array: [T], isIncluded: (T) -> Bool) -> [T] {
  var filteredArray: [T] = []
  for value in array {
    if isIncluded(value) {
      filteredArray += [value]
    }
  }
  return filteredArray
}

func reduce<T, U>(array: [T], initial: U, combine: (U, T) -> U) -> U {
  var reducedValue: U = initial
  for value in array {
    reducedValue = combine(reducedValue, value)
  }
  return reducedValue
}

//Recursive######################################
func mapRec<T, U>(array: [T], result: [U] = [], transform: (T) -> U) -> [U] {
  if array.count != result.count {
    var result = result
    result += [transform(array[result.count])]
    return mapRec(array: array, result: result, transform: transform)
  } else {
    return result
  }
}

mapRec(array: [1, 2, 3, 5, 6], transform: { val in
  return val * 2
})

func reduceRec<T, U>(array: [T], result: U, combine: (T, U) -> U) -> U {
  if array.count > 0 {
    var result = result
    var array = array
    result = combine(array.last!, result)
    array.popLast()
    return reduceRec(array: array, result: result, combine: combine)
  } else {
    return result
  }
}

reduceRec(array: [1,2,3,4], result: 0, combine: {el, res in
  return el + res
})