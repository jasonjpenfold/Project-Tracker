import SwiftUI

struct JsonService{
    static func loadJson<T: Decodable>(filename: String, fileType: T )throws->T{
        let fileManager = FileManager.default
        let fileURL = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first!.appendingPathComponent(filename)
        
        let data = try Data(contentsOf: fileURL)
        let decodedData: T = try JSONDecoder().decode(fileType.self as! T.Type, from: data)
        
        return decodedData
         
    }
    
    static func saveJson<T: Encodable>(filename: String, data: T)throws{
        let encodedData = try JSONEncoder().encode(data)
        
        try encodedData.write(to: FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!.appendingPathComponent(filename))
    }
}
/*

    
    static func saveJson(data: [Book])throws{
        let jsonEncoder = JSONEncoder()
        let encodedData = try jsonEncoder.encode(data)
        try encodedData.write(to: documentURL)
    }
    
    static func loadJson()throws->[Book]{
        let data = try Data(contentsOf: documentURL)
        let jsonDecoder = JSONDecoder()
        let decodedData = try jsonDecoder.decode([Book].self, from: data)
        return decodedData
    }
    
}
*/
