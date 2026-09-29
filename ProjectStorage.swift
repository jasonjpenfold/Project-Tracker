import SwiftUI

struct ProjectStorage: Codable{
    
    private(set) var projectDatabase: [Project] = []
    
    mutating func addProject(project: Project){
        projectDatabase.append(project)
    }
    
    mutating func editProject(project: Project){
        // TODO edit project
    }
    
    mutating func deleteProject(at offSets: IndexSet){
        projectDatabase.remove(atOffsets: offSets)
    }
    
    mutating func removeProject(project: Project){
        projectDatabase.removeAll(where: {$0.id == project.id})
    }
    
    mutating func deleteAllProjects(){
        projectDatabase.removeAll()
    }
    
    mutating func moveProject(from indexSet: IndexSet, to destination: Int){
        projectDatabase.move(fromOffsets: indexSet, toOffset: destination)
    }
    
    mutating func loadData(){
        do{
            self.projectDatabase = try JsonService.loadJson(filename: "projects.json", fileType: projectDatabase)
        }catch{
            print("Error loading json")
            self.projectDatabase = [Project(id: UUID(), name: "Project Tracker", language: .swift, description: "List of projects", status: .inProgress, dateStarted: .now, lastWorkedOn: .now, notes: "Tracking lists of projects, which language is used and status", favourite: true)]
        }
    }
    func saveData(){
        do{
            try JsonService.saveJson(filename:"projects.json",data:projectDatabase)
        }catch{
            print("Error saving json data")
        }
    }
    
    
    
}
