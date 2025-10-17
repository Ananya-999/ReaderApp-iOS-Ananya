import CoreData
import UIKit

class CoreDataStack {
    static let shared = CoreDataStack()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    func save() {
        if context.hasChanges { try? context.save() }
    }
}
