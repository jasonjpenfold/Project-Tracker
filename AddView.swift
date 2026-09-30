import SwiftUI

struct AddView: View{
    @Environment(ProjectTrackerViewModel.self) private var model
    @Environment(\.dismiss) private var dismiss
    @State var newProject: Project
    var body: some View{
        Form{
        
            TextField("New Project Title:", text: $newProject.name)
                .font(.title3.monospaced())
                .bold()
                .textFieldStyle(.roundedBorder)
            
            
            
            Picker("Language", selection: $newProject.language){
                ForEach(Language.allCases){languageType in 
                    Text(languageType.description)
                }
            }
            TextField("Description of project", text: $newProject.description)
            
            Picker("Status", selection: $newProject.status){
                ForEach(Status.allCases){
                    state in 
                    Text(state.description)
                }
            }
            DatePicker("Date started", selection: $newProject.dateStarted)
            DatePicker("Date last worked on", selection: $newProject.lastWorkedOn)
            
            TextField("Notes", text: $newProject.notes)
            Toggle("Favourite", isOn: $newProject.favourite)
            
            HStack{
                Button("Cancel",role: .cancel){
                    dismiss()
                }
                .buttonStyle(.glass)
                Button("Submit"){
                    model.addProject(project: newProject)
                    dismiss()
                }
                .buttonStyle(.glassProminent)
                Spacer()
                Text("\(newProject.favourite ? "❤️" : " ")")
            }
                        
        }
        
            
    }
}
