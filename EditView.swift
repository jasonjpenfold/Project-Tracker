import SwiftUI

struct EditView: View{
    @State var editProject: Project
    var body: some View{
        Form{
            
            TextField("New Project Title:", text: $editProject.name)
                .font(.title3.monospaced())
                .bold()
                .textFieldStyle(.roundedBorder)
            
            
            
            Picker("Language", selection: $editProject.language){
                ForEach(Language.allCases){languageType in 
                    Text(languageType.description)
                }
            }
            TextField("Description of project", text: $editProject.description)
            
            Picker("Status", selection: $editProject.status){
                ForEach(Status.allCases){
                    state in 
                    Text(state.description)
                }
            }
            DatePicker("Date started", selection: $editProject.dateStarted)
            DatePicker("Date last worked on", selection: $editProject.lastWorkedOn)
            
            TextField("Notes", text: $editProject.notes)
            Toggle("Favourite", isOn: $editProject.favourite)
          
        }
        
    }
}
