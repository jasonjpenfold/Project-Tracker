import SwiftUI

struct ProjectStorage{
    
    var projectDatabase: [Project]
    
    mutating func addProject(project: Project){
        projectDatabase.append(project)
    }
    
    mutating func removeProject(indexSet: IndexSet){
        projectDatabase.remove(atOffsets: indexSet)
    }
    
    mutating func deleteAllProjects(){
        projectDatabase.removeAll()
    }
    
}
