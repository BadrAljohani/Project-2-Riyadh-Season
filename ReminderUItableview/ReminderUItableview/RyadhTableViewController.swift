import UIKit

class Event {
    
    var Title : String = ""
    var Time: String = ""
    var imageEvent: UIImage?
    
    init(Title: String, Time: String, imageEvent: UIImage? = nil) {
        self.Title = Title
        self.Time = Time
        self.imageEvent = imageEvent
    }
}

class RyadhTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, AddNewDelegate {
    
    func addNew(event: Event) {
        item.append(event)
        tableView.reloadData()
    }
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var textTime: UITextField!
    var curIndex = 0
                            // MARK: - Event array
    var item:[Event] = [
        Event (Title: "Zombie motel Compan Field", Time: "oct - Apri 23 - 1", imageEvent: UIImage(named: "Event1")),
        
        Event (Title: "Rage cage",  Time: "1oct - Apri 23 - 1", imageEvent: UIImage(named: "Event2")),
        
        Event (Title: "Shooting",  Time: "oct - Apri 23 - 1", imageEvent: UIImage(named: "Event3")),
        
    ]
                            // MARK: - Update
    @IBAction func onUpdateTime(_ sender: Any) {
        if let time = textTime.text {
            item[curIndex].Time = time
            tableView.reloadData()
        }
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        tableView.reloadData()
        print (item.count)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 220
        
        tableView.register(UINib(nibName: "BannerCell", bundle: nil), forCellReuseIdentifier: "RiyadhBanner")
        tableView.register(UINib(nibName: "EventCell", bundle: nil), forCellReuseIdentifier: "RiyadhEvent")
        
    }
    
                        // MARK: - Table view data source
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0 {
            return 1
        } else {
            return item.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "RiyadhBanner", for: indexPath) as! BannerCell
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "RiyadhEvent", for: indexPath) as! EventCell
            cell.Title.text = item[indexPath.row].Title
            cell.Time.text = item[indexPath.row].Time
            cell.imageEvent.image = (item[indexPath.row].imageEvent)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete {
            item.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        curIndex = indexPath.row
        textTime.text = item[indexPath.row].Time
        
    }
}
