//
//  createCSV.swift
//  csvTest
//
//  Created by Kim Yewon on 2023/12/05.
//

import Foundation

struct MyStruct {
    var field1: String
    var field2: String
}

func createCSV(dataArray: [MyStruct]) {
    let fileManager = FileManager.default

    // Set the folder name and CSV file name
    let folderName = "CSVFiles"
    let csvFileName = "myCSVFile.csv"

    // Get the Downloads directory
    if let downloadsUrl = try? fileManager.url(for: .downloadsDirectory, in: .userDomainMask, appropriateFor: nil, create: true) {
        let directoryUrl = downloadsUrl.appendingPathComponent(folderName)

        // Create the folder if it doesn't exist
        do {
            try fileManager.createDirectory(at: directoryUrl, withIntermediateDirectories: true, attributes: nil)
        } catch let error as NSError {
            print("Error creating folder: \(error)")
            return
        }

        // Create a URL for the CSV file
        let fileUrl = directoryUrl.appendingPathComponent(csvFileName)

        // Create a CSV string from the struct array
        var csvString = "Field1,Field2\n"

        for data in dataArray {
            let line = "\(data.field1),\(data.field2)\n"
            csvString.append(line)
        }

        // Convert the CSV string to data
        if let fileData = csvString.data(using: .utf8) {
            // Write data to the CSV file
            do {
                try fileData.write(to: fileUrl)
                print("CSV file created at: \(fileUrl.path)")
            } catch let error as NSError {
                print("Error writing CSV file: \(error)")
            }
        } else {
            print("Error converting CSV string to data")
        }
    } else {
        print("Error getting Downloads directory")
    }
}

// Example usage
let dataArray = [
    MyStruct(field1: "Value1A", field2: "Value1B"),
    MyStruct(field1: "Value2A", field2: "Value2B"),
]
