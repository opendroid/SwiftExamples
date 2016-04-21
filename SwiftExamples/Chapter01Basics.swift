//
//  Chapter01Basics.swift
//  SwiftExamples
//
//  Created by Ajay Thakur on 4/20/16.
//  Copyright © 2016 Ajay Thakur. All rights reserved.
//

import Foundation

class Chapter01Basics {
    //---------------------------------------
    // Example 1: Constants and Variables
    //---------------------------------------
    func example1Variables() {
        let str = "Hello, Ajay"  // let means constant
        let lowercaseStr = str.lowercaseString
        
        print(lowercaseStr)
        
        //---------------------------------------
        // Example 1: Constants and Variables
        //---------------------------------------
        // let defines constanst
        let implicitIntegerConstant = 42
        let implicitDoubleConstant = 42.0
        let explicitDoubleConstant:Double = 42
        let explicitFloatConstant:Float = 4
        
        // var defines variables.
        var anIntVar = implicitIntegerConstant
        anIntVar += 10
        
        // Type conversion is explicit, not implicit
        let sumDouble = explicitDoubleConstant + Double(explicitFloatConstant) + Double(implicitIntegerConstant) + Double(implicitDoubleConstant)
        
        // Use \() to include values of variables in strings
        print("\(explicitDoubleConstant) + \(explicitFloatConstant) + \(implicitIntegerConstant) = \(sumDouble) ")
        
        // Arrays and dictionary examples
        var colorNamesArray = ["Violet","Indigo","Blue","Green","Yellow","Orange","Red" ]
        var colorFreqDictionary = [colorNamesArray[0]: "670–750 THz", // Violet	~ 440–400 nm, ~ 670–750 THz
            colorNamesArray[1]: "660–640 THz", // Indigo: ~440-460 nm,
            colorNamesArray[2]: "610–640 THz", // Blue: ~ 490–460 nm, ~610–670 THz
            colorNamesArray[3]: "670–750 THz", // Green: ~ 560–520 nm, ~ 540–580 THz
            colorNamesArray[4]: "510–540 THz", // Yellow: ~ 590–560 nm, ~ 510–540 THz
            colorNamesArray[5]: "480–510 THz", // Orange: ~ 635–590 nm, ~ 480–510 THz
            colorNamesArray[6]: "430–480 THz"] // Red: ~ 700–635 nm, ~ 430–480 THz
        
        // control flow: for loop
        for color in colorNamesArray {
            print("Color: \(color) Frequency: \(colorFreqDictionary[color]) ")
        }
        
        // be done with array an dictionary
        colorNamesArray = []
        colorFreqDictionary = [:]
        
        // Optionals - either contains a value or contains nil
        var optionalName: String? = "Barack Obama" // var
        optionalName = nil
        var greeting = "Hello!"
        if let name = optionalName {
            greeting = "Hello, \(name)"
        } else {
            greeting = "Hello no-name"
        }
        print("\(greeting)")
    }
    
    //---------------------------------------
    // Example 2: Control-flow
    //---------------------------------------
    func example2ControlFlow() {
        // Complex data types
        let interestingNumbers = [
            "Prime" : [2, 3, 5, 7, 11, 13, 17, 19, 23],
            "Fibinacci" : [1, 1, 2, 3, 5, 8, 13, 21, 34],
            "Square" : [1, 4, 9, 16, 25, 36, 49, 64, 81]
        ]
        
        var whatKind: String? // Can contain nil
        var largestNumber:Int = -12345
        
        for (kind, numbers) in interestingNumbers {
            for n in numbers {
                if largestNumber < n {
                    largestNumber = n
                    whatKind = kind
                }
            }
        }
        if whatKind != nil {
            print ("Largest number is \(largestNumber) in \(whatKind) series")
        } else {
            print ("Largest number is \(largestNumber) in unknown series")
        }
        
        // While loop
        var aNumber = 2
        while aNumber < 1000 {
            aNumber *= 2
        }
        print("Number after  the loop is: \(aNumber)")
        
        // do.. while loop
        var aNumber2 = 2000
        repeat {
            aNumber2 *= 3
        } while aNumber2 < 1000
        print("Number after  the repeat..while loop is: \(aNumber2)")
        
        // Switch work on variety of data types
        let vegetables = "Red Pepper"
        let vegComment:String
        switch vegetables {
        case "celery":
            vegComment = "Add raisins and cook on logs"
        case "cucumber", "watercress":
            vegComment = "That is good for sandwich"
        case let x where x.hasSuffix("pepper"):
            vegComment = "Is it spicy \(x)?"
        default:
            vegComment = "Everything tastes good in soup"
        }
        print("The veg comments is: \(vegComment)")
        
        let day:Int = Int(rand());
        var dayname:String
        switch day {
        case 1...5: // Range
            dayname = "Weekday"
        case 6...7: // Range
            dayname = "Weekend"
        case let unknown where unknown < 30:
            dayname = "May be a month day"
        default:
            dayname = "Unknown"
        }
        print("Day: \(dayname)");
        // [.. omits upper value of the loop]for loop
        // ... includes range
        for i in -2...2 {
            print("Item: \(i)")
        }
        
    }
    
    //---------------------------------------
    // Example 3: Functions
    //---------------------------------------
    func example3Functions() {
        func greeting(name: String, day: String) -> String {
            return "Hello \(name), today is \(day)."
        }
        
        func getStudents() -> (Double, Double, Double) {
            return (1.2, 1.3, 1.60)
        }
        print("Hello \(greeting("Aiden",day:"Tuesday"))")
        print ("Gas prices: \(getStudents())")
        
        // functions can take multiple argumnets that are collected in an array
        func addThese(numbers:Int...) -> Int {
            var sum:Int = 0
            for n in numbers {
                sum += n
            }
            return sum
        }
        print ("Sum is: \(addThese(1,2,3,4,5,6,7,8,9))")
        
        // Function can be nested with scope
        func whatIsPiBy2() -> Double {
            var pi:Double = 3.14159235
            func divideByTwo() {
                pi /= 2.0 // 'pi' scope is outside
            }
            return pi;
        }
        print("Pi/2 = \(whatIsPiBy2())")
        
        // Function can return another function as value (i.e. first class type)
        func squareCalculator() -> (Int -> Int) {
            func doubleThis(n: Int) -> Int {
                return n * n
            }
            return doubleThis
        }
        var doubleCalculator = squareCalculator()
        print("What is double of 99 is: \(doubleCalculator(99))")
        
        // Functions can take another function as one of its arguments
        func hasAnyMatches(list:[Int], conditionFunc: Int -> Bool) -> Bool {
            for item in list {
                if (conditionFunc(item)) {
                    return true
                }
            }
            return false
        }
        
        func lessThan10(number: Int) -> Bool { // Func passed as an argument
            if number < 10 {
                return true
            }
            return false
        }
        let arrayOfInts = [1,2,10,30,17]
        let match = hasAnyMatches(arrayOfInts, conditionFunc:lessThan10)
        print("Is there a match: \(match)")
    }
    
    //---------------------------------------
    // Example 4: Closures
    //---------------------------------------
    func example4Closures() {
        // Closures: 'in' separates arguments and return type
        let arrayOfInts = [1,2,10,30,17]
        let map = arrayOfInts.map({
            (number: Int) -> Int in
            let threeTimes = 3 * number
            return threeTimes
        })
        
        print("Map closures: \(map)");
        // As a variable:
        // var closureName: (ParameterTypes) -> (ReturnType)
        //
        // As an optional variable:
        // var closureName: ((ParameterTypes) -> (ReturnType))?
        //
        // As a type alias:
        //typealias ClosureType = (ParameterTypes) -> (ReturnType)
        //
        //As a constant:
        //let closureName: ClosureType = { ... }
        //
        //As an argument to a function call:
        //func({(ParameterTypes) -> (ReturnType) in statements})
        //
        //As a function parameter:
        //array.sort({ (item1: Int, item2: Int) -> Bool in return item1 < item2 })
        //
        //As a function parameter with implied types:
        //array.sort({ (item1, item2) -> Bool in return item1 < item2 })
        //
        //As a function parameter with implied return type:
        //array.sort({ (item1, item2) in return item1 < item2 })
        //
        //As the last function parameter:
        //array.sort { (item1, item2) in return item1 < item2 }
        //
        //As the last parameter, using shorthand argument names:
        //array.sort { return $0 < $1 }
        //
        //As the last parameter, with an implied return value:
        //array.sort { $0 < $1 }
        //
        //As the last parameter, as a reference to an existing function:arameter with
        //  explicit capture semantics:
        //array.sort({ [unowned self] (item1: Int, item2: Int) -> Bool in return item1 < item2 })
        //
        //
        // As a function parameter with explicit capture semantics and inferred parameters / return type:
        // array.sort({ [unowned self] in return item1 < item2 })
    }
    
    //---------------------------------------
    // Example 5: Class
    //---------------------------------------
    func example5Classes() {
        class Shape { // Base Class
            var edges:Int = 0
            var name:String
            
            init(name:String, sides:Int) {
                self.name = name
                self.edges = sides
            }
            
            func simpleDescription() -> String {
                return "Shape: \(self.name) Edges:\(self.edges)"
            }
        }
        
        class Square:Shape { // Square derived from Shape
            var length:Double
            var perimeter:Double
            
            init(length:Double) {
                self.length = length
                self.perimeter = 4.0 * length
                super.init(name: "Square", sides: 4)
            }
            
            func area() -> Double {
                return self.length * self.length
            }
            
            
            override func simpleDescription() -> String {
                return "\(super.simpleDescription()) Length:\(self.length)  Area:\(self.area()) Perimeter:\(self.perimeter)"
            }
        }
        
        let aSquare = Square(length: 5.2)
        aSquare.length = 6.0
        print("\(aSquare.simpleDescription())")
        
        class EquilateralTriangle:Shape { // EquilateralTriangle derived from Shape
            var length:Double = 0.0
            
            init(length:Double) {
                self.length = length
                super.init(name: "Equilateral Triangle", sides: 3)
            }
            
            var perimeter: Double {
                get {
                    return 3.0 * self.length
                }
                set {
                    self.length = newValue / 3.0
                }
            }
            
            func area() -> Double {
                return self.length * self.length * 0.43301270189222
            }
            
            override func simpleDescription() -> String {
                return "\(super.simpleDescription()) Length:\(self.length)  Area:\(self.area()) Perimeter:\(self.perimeter)"
            }
        }
        
        let eTriangle = EquilateralTriangle(length: 3.0)
        print("\(eTriangle.simpleDescription())")
        eTriangle.perimeter = 20
        print("\(eTriangle.simpleDescription())")
        
        class TriangleAndSquare { // Contains instances of triangle and square
            var name:String
            var triangle: EquilateralTriangle {
                willSet {
                    self.square.length = newValue.length
                    print("willSet: square length \(self.square.length)")
                }
            }
            
            var square: Square {
                willSet {
                    self.triangle.length = newValue.length
                    print("willSet: triangle length \(self.triangle.length)")
                }
            }
            
            init(length:Double, name:String) {
                self.name = name
                self.triangle = EquilateralTriangle(length:length);
                self.square = Square(length:length)
            }
            
            func simpleDescription() -> String {
                return "Name: \(self.name)  \(triangle.simpleDescription()) \(square.simpleDescription())"
            }
        }
        
        let aTriangleAndSquare = TriangleAndSquare(length:4.0, name: "TriSq")
        print("TriSq before: \(aTriangleAndSquare.simpleDescription())")
        aTriangleAndSquare.square = Square(length:5.0)
        print("TriSq After: \(aTriangleAndSquare.simpleDescription())")
    }
    
    //---------------------------------------
    // Example 6: Patterns
    //---------------------------------------
    func example06Patterns() {

        // 1. pattern → wildcard-pattern­type-annotation­_opt­
        for _ in -2...2 {
            // Do something five times.
            
        }
        
        // 2. pattern → identifier-pattern­type-annotation_­opt­
        for case let j in -10...10 where j%5==0 {
            print("identifier-pattern: Loop j=\(j)")
        }
        
        // 3. pattern → value-binding-pattern­
        let point = (3, 2)
        switch point {
        case let (x, y): // Bind x and y to the elements of point.
            print("value-binding-pattern­: The point is at (\(x), \(y)).")
        }
        
        // 4. pattern → tuple-pattern­type-annotation­opt­
        // 5. pattern → enum-case-pattern­
        // 6. pattern → optional-pattern­
        // 7. pattern → type-casting-pattern­
        // 8. pattern → expression-pattern­

    }
    
    //---------------------------------------
    // Example 7: Strings
    //---------------------------------------
    func example07Strings() {
        
        // 1: Iterate each character
        let textStr = "Hello this is a 😀 ❤️ with emojis"
        var length:Int = 0;
        for _:Character in textStr.characters {
            length+=1 // Note ++ is depricated
        }
        print("String length = \(length), strig length=\(textStr.characters.count)")
        
        // Substrings
        let range = textStr.startIndex.advancedBy(10)...textStr.startIndex.advancedBy(30)
        let textSubstr = textStr.substringWithRange(range)
        print("Substring:\(textSubstr)")
    }
    
    //---------------------------------------
    // Example 8: Collections
    //---------------------------------------
    func example08Collections() {
        // Arrays
        print("Arrays:")
        var classList = ["Zero", "One", "Two", "Three"] // define an array init with 3 strings
        print("\tInitial array: \(classList)")
        classList[1...3] = ["One 1", "Two 2", "Three 3"] // Over-ride at idx 0,1
        classList += ["Four", "Five"] // Append two more
        classList.append("Six 6")
        print("\tReplaced and appended to array: \(classList)")
        classList.removeAtIndex(3)
        print("\tRemoved item at index 3: \(classList)")
        
        // Sets
        print("Sets:")
        var genere:Set<String> = ["Rock", "Classical", "Hip hop"] // Declare a set and init
        print("\tInitial set:\(genere.sort())")
        genere.insert("Country"); genere.insert("Blues"); genere.insert("Rock")
        genere.insert("Grunge"); genere.insert("Punk"); genere.insert("High Classical")
        print("\tAdded:\(genere.sort())")
        print("\tCount:\(genere.count), underestimated count:\(genere.underestimateCount())")
        // Set2
        let myGeneres:Set<String> = ["Rock", "Pop", "Techno"]
        print("\tMy likes: \(myGeneres.sort())")
        // Operations: union, intersect, subtract, exclusiveOr
        print("\tunion:\(myGeneres.union(genere))")
        print("\tintersect:\(myGeneres.intersect(genere))")
        print("\tsubtract:\(myGeneres.subtract(genere))")
        print("\texclusiveOr:\(myGeneres.exclusiveOr(genere))")
        
        // Dictionary
        print("Dictionary:")
        
    }
    
}
