import SwiftUI

struct ProjectStorage: Codable{
    
    private(set) var projectDatabase: [Project] = []
    
    mutating func addProject(project: Project){
        projectDatabase.append(project)
    }
    
    mutating func editProject(project: Project)->Bool{
        
        if let projectIndex = getIndexFromIdHelper(project: project){
            projectDatabase[projectIndex] = project
            return true
        }
        return false
    }
    
    mutating func deleteProjectsWithId(of ids: Set<UUID>){
        for id in ids {
            removeProject(projectID: id)
        }
    }
    
    mutating func removeProject(projectID: UUID){
        projectDatabase.removeAll(where: {$0.id == projectID})
    }
    
    
    
    mutating func moveProject(from indexSet: IndexSet, to destination: Int){
        projectDatabase.move(fromOffsets: indexSet, toOffset: destination)
    }
 

     
    
    mutating func loadData()->Bool{
        do{
            self.projectDatabase = try JsonService.loadJson(filename: "projects.json")
            return true
        }catch{
            print("Error loading json")
            
            self.projectDatabase = [Project(id: UUID(), name: "Project Tracker", language: .swift, description: "List of projects", status: .inProgress, dateStarted: .now, lastWorkedOn: .now, notes: "Tracking lists of projects, which language is used and status", favourite: true)]
            return false
        }
    }
    func saveData()->Bool{
        do{
            try JsonService.saveJson(filename:"projects.json",data:projectDatabase)
            return true
        }catch{
            print("Error saving json data")
            return false
        }
    }
    
    func getIndexFromIdHelper(project: Project)->Int?{
        return projectDatabase.firstIndex(where:{ $0.id == project.id})
    }
    
    
}
