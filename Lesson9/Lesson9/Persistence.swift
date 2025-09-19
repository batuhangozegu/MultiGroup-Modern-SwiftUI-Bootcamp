import CoreData

struct PersistenceController {
    static let shared = PersistenceController()

    @MainActor
    static let preview: PersistenceController = {
        let result = PersistenceController(inMemory: true)
        let viewContext = result.container.viewContext
        
        let sampleNote1 = Note(context: viewContext)
        sampleNote1.id = UUID()
        sampleNote1.title = "Alışveriş Listesi"
        sampleNote1.content = "Ekmek, Süt, Yumurta, Domates, Peynir"
        sampleNote1.date = Date().addingTimeInterval(-86400)
        
        let sampleNote2 = Note(context: viewContext)
        sampleNote2.id = UUID()
        sampleNote2.title = "Toplantı Notları"
        sampleNote2.content = "Proje deadline'ı: 30 Eylül\nEkip toplantısı: Pazartesi 14:00\nSunum hazırlanacak"
        sampleNote2.date = Date().addingTimeInterval(-3600)
        
        let sampleNote3 = Note(context: viewContext)
        sampleNote3.id = UUID()
        sampleNote3.title = "Kitap Önerileri"
        sampleNote3.content = """
        📚 Okunacak Kitaplar:
        - Clean Code - Robert Martin
        - iOS Development with Swift
        - Design Patterns
        - SwiftUI Cookbook
        """
        sampleNote3.date = Date() // Şimdi
        
        let sampleNote4 = Note(context: viewContext)
        sampleNote4.id = UUID()
        sampleNote4.title = "Tatil Planları"
        sampleNote4.content = "Ekim ayında Kapadokya gezisi\nOtel rezervasyonu yapılacak\nBalonla tur planlanacak"
        sampleNote4.date = Date().addingTimeInterval(-7200) 
        
        let sampleNote5 = Note(context: viewContext)
        sampleNote5.id = UUID()
        sampleNote5.title = "Swift Öğrenme Planı"
        sampleNote5.content = """
        1. Temel syntax öğrenme ✅
        2. SwiftUI ile uygulama geliştirme 🔄
        3. Core Data öğrenme 🔄
        4. Network işlemleri
        5. App Store'a uygulama yükleme
        """
        sampleNote5.date = Date().addingTimeInterval(-1800) // 30 dakika önce
        
        do {
            try viewContext.save()
        } catch {
            // Replace this implementation with code to handle the error appropriately.
            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
        return result
    }()

    let container: NSPersistentContainer

    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "Lesson9")
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.

                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        container.viewContext.automaticallyMergesChangesFromParent = true
    }
}
