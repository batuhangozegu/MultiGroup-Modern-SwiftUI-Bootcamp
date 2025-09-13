import Foundation

struct EventSection: Identifiable {
    let type: EventType
    let items: [Event]
    var id: EventType { type }
}

final class EventViewModel: ObservableObject {
    @Published var events: [Event] = [
        Event(title: "Swift Dersi", date: Date(), type: .Toplantı, hasReminder: true),
        Event(title: "Yaz Tatili", date: Date().addingTimeInterval(86400 * 30), type: .Tatil, hasReminder: false),
        Event(title: "Fitness", date: Date().addingTimeInterval(86400 * 2), type: .Spor, hasReminder: true),
        Event(title: "Kuzenin Düğünü", date: Date().addingTimeInterval(86400 * 15), type: .Diger, hasReminder: true),
        Event(title: "Arkadaşın Doğum Günü", date: Date().addingTimeInterval(86400 * 7), type: .DogumGunu, hasReminder: false)
    ]


    var grouped: [EventSection] {
        let dict = Dictionary(grouping: events, by: { $0.type })
        return EventType.allCases.compactMap { t in
            guard let arr = dict[t], !arr.isEmpty else { return nil }
            return EventSection(type: t, items: arr.sorted { $0.date < $1.date })
        }
    }


    @Published var title: String = ""
    @Published var selectedDate: Date = Date()
    @Published var selectedType: EventType = .Toplantı
    @Published var hasReminder: Bool = false


    func addEvent() {
        let newEvent = Event(title: title,
                             date: selectedDate,
                             type: selectedType,
                             hasReminder: hasReminder)
        events.insert(newEvent, at: 0)
        clearForm()
    }

    func deleteEvent(byIds ids: [UUID]) {
        events.removeAll { ids.contains($0.id) }
    }

    func toggleReminder(for item: Event) {
        if let index = events.firstIndex(of: item) {
            events[index].hasReminder.toggle()
        }
    }

    func clearForm() {
        title = ""
        selectedDate = Date()
        selectedType = .Toplantı
        hasReminder = false
    }
}
