
import UIKit
import SnapKit
import FirebaseCore
import FirebaseFirestore

class viewDailyExercises: UIViewController {

    //MARK: Variables and Arrays
    
    let exerciseImages : [UIImage] = [
        UIImage(named: "1")!,
        UIImage(named: "2")!,
        UIImage(named: "3")!,
        UIImage(named: "4")!,
        UIImage(named: "5")!,
    ]
    
    let desc : [String] = [
        "Monday",
        "Tuesday",
        "Wednesday",
        "Thursday",
        "Friday",
        "Saturday",
        "Sunday"
    ]
    
    var pathStr:String = ""
    
    let db = Firestore.firestore() // Firebase
    
    var dataArray: [[String: Any]] = []
    var nameDataArray: [String] = []
    var descDataArray: [String] = []
    
    //MARK: Components
    
    let labelTitleOne : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 36, weight: .thin)
        label.text = "Workout Schedule"
        label.textAlignment = .center
        return label
    }()
    
    let tableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.backgroundColor = .systemBackground
        table.allowsSelection = true
        table.register(ScheduleCustomCell.self, forCellReuseIdentifier: ScheduleCustomCell.identifier)
        return table
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: true)
        
        // Clearing the arrays
        dataArray = []
        nameDataArray = []
        descDataArray = []
        
        readDocument(pathStr: pathStr)
        setupUI()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    //MARK: Functions
    
    func setupUI() {
        view.backgroundColor = .white
        view.addSubview(labelTitleOne)
        view.addSubview(tableView)
        
        
        labelTitleOne.snp.makeConstraints { make in
            make.top.equalTo(view.snp.top).offset(70)
            make.centerX.equalTo(view)
        }
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(labelTitleOne.snp.bottom).offset(40)
            make.left.equalTo(view.safeAreaLayoutGuide.snp.left).offset(20)
            make.right.equalTo(view.safeAreaLayoutGuide.snp.right).offset(-20)
            make.centerX.equalTo(view)
            make.size.equalTo(CGSize(width: 340, height: 600))
        }
    }
    
    
    func readDocument(pathStr: String){
        
        db.collection(pathStr).getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    let data = document.data()
                    self.dataArray.append(data)
                }
                
                self.saveNameArray()
                self.saveDescArray()
                
                self.tableView.reloadData()
            }
        }
    }
    
    func saveNameArray() {
        for data in dataArray {
            self.nameDataArray.append(data["name"] as! String)
        }
    }
    
    func saveDescArray() {
        for data in dataArray {
            self.descDataArray.append(data["desc"] as! String)
        }
    }
}

extension viewDailyExercises: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nameDataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ScheduleCustomCell.identifier, for: indexPath) as? ScheduleCustomCell else {
            fatalError("Failed to dequeue CustomCell")
        }
        
        let image = exerciseImages[indexPath.row]
        let label = nameDataArray[indexPath.row]
        let labelMini = descDataArray[indexPath.row]
        
        cell.configure(with: image, label: label, labelMini: labelMini)
        cell.contentView.backgroundColor = .white
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
