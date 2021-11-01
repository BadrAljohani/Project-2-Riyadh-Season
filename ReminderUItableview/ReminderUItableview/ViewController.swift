import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var eventTitle: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func onAddEvent(_ sender: Any) {
        
        if let titleInfo = eventTitle.text {
            UserDefaults.standard.set(titleInfo, forKey: "title")
        }
    }
    
    
}


