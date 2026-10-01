import SwiftUI

struct JsonService{
    enum JsonServiceError: Error{
        case noFileError
    }
    static func loadJson<T: Decodable>(filename: String)throws->T{
        let fileManager = FileManager.default
        let fileURL = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first!.appendingPathComponent(filename)
        if !fileManager.fileExists(atPath: fileURL.path()){
            throw JsonServiceError.noFileError
        }
        
        let data = try Data(contentsOf: fileURL)
        let decodedData: T = try JSONDecoder().decode(T.self, from: data)
        
        return decodedData
         
    }
    
    static func saveJson<T: Encodable>(filename: String, data: T)throws{
        let encodedData = try JSONEncoder().encode(data)
        
        try encodedData.write(to: FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!.appendingPathComponent(filename))
    }
}
