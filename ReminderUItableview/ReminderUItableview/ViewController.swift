import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var eventTitle: UITextField!
    @IBOutlet weak var eventTime: UITextField!
    
    @IBOutlet weak var eventImage: UIImageView!
    
    var item = [Event]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func choosImage(_ sender: Any) {
        let vc = UIImagePickerController()
        vc.sourceType = .photoLibrary
        vc.delegate = self
        vc.allowsEditing = true
        present(vc, animated: true)
    }
    
    @IBAction func onAddEvent(_ sender: Any) {

        let newEvent = Event(Title: eventTitle.text ?? "", Time: eventTime.text ?? "", imageEvent: eventImage.image)
        item.append(newEvent)
        print (item.count)
    
    }
}

extension ViewController:UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let image = info[UIImagePickerController.InfoKey(rawValue: "UIImagePickerControllerEditedImage")] as? UIImage {
            self.eventImage.image = image
        }
        
        picker.dismiss(animated: true, completion: nil)
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}
