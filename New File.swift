import SwiftUI

struct LanguagesFilterView: View{
    @Environment(ProjectTrackerViewModel.self) private var model
    
    var body: some View{
        List{
            ForEach(Language.allCases){
                language in 
                HStack{
                    Button("\(language.description)"){
                        model.toggleLanguageFilter(language: language)
                    }
                    Spacer()
                    Image(systemName: model.selectedFilters.contains(where:{ $0 == .language(languageType: language)}) ? "checkmark.circle" : "circle")
                }
                            }
            
        }
    }
}
