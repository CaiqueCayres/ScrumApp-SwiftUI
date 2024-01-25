//
//  DailyScrum.swift
//  ScrumApp
//
//  Created by Caique on 24/01/24.
//

import Foundation

struct DailyScrum: Identifiable {
    
    let id: UUID
    var theme: Theme
    var title: String
    var attendees: [Attendee]
    var lengthInMinutes: Int
    
    var history: [History] = []
    
    var lengthInMinutesAsDouble: Double {
        get {
            Double(lengthInMinutes)
        }
        set {
            lengthInMinutes = Int(newValue)
        }
    }
    
    init(id: UUID = UUID(),
         title: String,
         attendees: [Attendee],
         lengthInMinutes: Int,
         theme: Theme) {
        
        self.id = id
        self.title = title
        self.attendees = attendees
        self.lengthInMinutes = lengthInMinutes
        self.theme = theme
    }
}

extension DailyScrum {
    
    struct Attendee: Identifiable {
        
        let id: UUID
        var name: String
        
        init(id: UUID = UUID(), name: String) {
            self.id = id
            self.name = name
        }
    }
    
    
    static var emptyScrum: DailyScrum {
        DailyScrum(title: "", attendees: [], lengthInMinutes: 5, theme: .sky)
    }
}

extension DailyScrum {
    
    static let sampleData: [DailyScrum] =
    [
        DailyScrum(title: "Design",
                   attendees: [.init(name:"Cathy"),
                               .init(name:"Daisy"),
                               .init(name:"Simon"),
                               .init(name:"Jonathan")],
                   lengthInMinutes: 10,
                   theme: .yellow),
        
        DailyScrum(title: "App Dev",
                   attendees: [.init(name:"Katie"),
                               .init(name:"Gray"),
                               .init(name:"Euna"),
                               .init(name:"Luis"),
                               .init(name:"Darla")],
                   lengthInMinutes: 5,
                   theme: .orange),
        DailyScrum(title: "Web Dev",
                   
                   attendees: [.init(name:"Chella"),
                               .init(name:"Chris"),
                               .init(name:"Christina"),
                               .init(name:"Eden"),
                               .init(name:"Karla"),
                               .init(name:"Lindsey"),
                               .init(name:"Aga"),
                               .init(name:"Chad"),
                               .init(name:"Jenn"),
                               .init(name:"Sarah")],
                   lengthInMinutes: 5,
                   theme: .poppy)
    ]
}
