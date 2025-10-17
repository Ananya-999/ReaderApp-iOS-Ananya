import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "ReaderAppDataModel")
        container.loadPersistentStores { _, error in
            if let error = error { fatalError("Core Data error \(error)") }
        }
        return container
    }()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        let nav = UINavigationController(rootViewController: NewsListViewController())
        window?.rootViewController = nav
        window?.makeKeyAndVisible()
        return true
    }
}
