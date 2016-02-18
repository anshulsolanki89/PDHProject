//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

var dict = [ "name" : "Anshul", "age": "21"]

dict["age"]

let anshul = "this is \n my name"
print("anshul\r")
extension String {
    init(htmlEncodedString: String) {
        let encodedData = htmlEncodedString.dataUsingEncoding(NSUTF8StringEncoding)!
        let attributedOptions : [String: AnyObject] = [
            NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType,
            NSCharacterEncodingDocumentAttribute: NSUTF8StringEncoding
        ]
        let attributedString = try! NSAttributedString(data: encodedData, options: attributedOptions, documentAttributes: nil)
        self.init(attributedString.string)
    }
}

let stra = String(htmlEncodedString: "meals \r")
let straaa = stra
