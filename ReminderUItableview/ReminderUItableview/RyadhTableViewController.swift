import UIKit

struct Event {
    
    var Title : String = ""
    var Time: String = ""
    var imageEvent: UIImage?
}



class RyadhTableViewController: UITableViewController {

//    func addNewEvent(title: String) {
//        let eventNew = Event(Title: title, Time: "5:00", imageEvent: nil)
//        item.append(eventNew)
//        tableView.reloadData()
//    }
//

    override func viewDidAppear(_ animated: Bool) {
//        let   timeFromDefaults = UserDefaults.standard.String(forKey: "time")
        if let titleFromDefaults = UserDefaults.standard.string(forKey: "title"){
            let eventNew = Event(Title: titleFromDefaults, Time: titleFromDefaults , imageEvent: nil)
            item.append(eventNew)
            tableView.reloadData()
        
        }

    }
    
    var item:[Event] = [
                        Event (Title: "Zombie motel Compan Field", Time: "2 oct - Apri 14", imageEvent: UIImage(named: "Event1")),
                          
                        Event (Title: "Rage cage",  Time: "1oct - Apri 23", imageEvent: UIImage(named: "Event2")),
                          
                          Event (Title: "Shooting",  Time: "3oct - Apri 20", imageEvent: UIImage(named: "Event3")),

    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(UINib(nibName: "BannerCell", bundle: nil), forCellReuseIdentifier: "RiyadhBanner")
        
        tableView.register(UINib(nibName: "EventCell", bundle: nil), forCellReuseIdentifier: "RiyadhEvent")
        
        tableView.rowHeight = 220
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }
    

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if section == 0 {
            return 1
            
        }else{
            return item.count
        }
    }
    
//    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//        if editingStyle == UITableViewCell.EditingStyle.delete {
//               item.remove(at: indexPath.row)
//               tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
//           }
//    }
    
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        

        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "RiyadhBanner", for: indexPath)
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "RiyadhEvent", for: indexPath) as! EventCell
          
    

            cell.Title.text = item[indexPath.row].Title
            cell.Time.text = item[indexPath.row].Time
            cell.imageEvent.image = (item[indexPath.row].imageEvent)
    
            
            return cell
        }
    }
}

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
