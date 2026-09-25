import SwiftUI

struct ProjectStorage{
    
    private(set) var projectDatabase: [Project]
    
    mutating func addProject(project: Project){
        projectDatabase.append(project)
    }
    
    mutating func editProject(project: Project){
        // TODO edit project
    }
    
    mutating func removeProject(project: Project){
        projectDatabase.removeAll(where: {$0.id == project.id})
    }
    
    mutating func deleteAllProjects(){
        projectDatabase.removeAll()
    }
    
    
    
}
