import Foundation

struct  Stack {
   fileprivate  var array: [Character] = []
    public var count: Int { 
        return array.count
     } 
   mutating func push(_ element: Character) {
        array.append(element)
    }
    mutating func pop() -> Character? {
        return array.popLast()
    }
}

class Editor {

    func checkBrackets(phrase: String)-> Int {
        var open_to_close: [Character:Character] = ["{": "}", "[": "]", "(": ")"]
        var close_to_open: [Character:Character] = ["}": "{", "]": "[", ")": "("]
        //стек для хранения открытых скобочек
        var stack =  Stack()
        //массив для хранения индексов открытых скобочек
        var brackets_index: [Int] = []
        var index : Int = 1
		var result: Int = -1

        // перебор символов в полученной строке
        for character in phrase {
            // если символ есть в словаре открывающихся скобок
            if let val = open_to_close[character]{
                stack.push(character)
                brackets_index.append(index)
            }
            //иначе если символ есть в словаре закрывающихся скобок
            else if let val = close_to_open[character]{
                // если в стеке есть хотя бы 1 элемент
                if stack.count != 0{
                    //забираем последний элемент из стека
                    var open_bracket = stack.pop()!
                    var bracket_index = brackets_index.removeLast()
                    if open_bracket != close_to_open[character]{
                       result = index
                        break
                     }
                }
                else {
                    result = index
                    break
                }
            }
            if index == phrase.count{
                if stack.count != 0{
                    result = brackets_index.removeFirst()
                }
            }
            index += 1
        }
		 return result 
    }
}

