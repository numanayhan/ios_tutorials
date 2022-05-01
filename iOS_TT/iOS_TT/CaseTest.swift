//
//  CaseTest.swift
//  iOS_TT
//
//  Created by Numan Ayhan on 14.10.2021.
//

import UIKit

class CaseTest: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
 
        
        let stdout = ProcessInfo.processInfo.environment["OUTPUT_PATH"]!
        FileManager.default.createFile(atPath: stdout, contents: nil, attributes: nil)
        let fileHandle = FileHandle(forWritingAtPath: stdout)!

        guard let s = readLine() else { fatalError("Bad input") }

        let result = getMin(s: s)

        fileHandle.write(String(result).data(using: .utf8)!)
        fileHandle.write("\n".data(using: .utf8)!)
        func getMin(s: String) -> Int {
            // Write your code here
           return String()
        }
    }
    

}
