import UIKit
import FirebaseCore
import FirebaseFirestore
import SnapKit

class viewSchedule: UIViewController {
    
    //Mark:- Variables
    
    let db = Firestore.firestore() // Firebase
    
    var dataArray: [[String: Any]] = []
    var nameDataArray: [String] = []
    var picDataArray: [String] = []
    
    let exerciseImages : [UIImage] = [
        UIImage(named: "1")!,
        UIImage(named: "2")!,
        UIImage(named: "3")!,
        UIImage(named: "4")!,
        UIImage(named: "5")!,
        UIImage(named: "6")!,
        UIImage(named: "7")!
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
    
    //Mark:- Comps
    
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
        table.register(CustomCell.self, forCellReuseIdentifier: CustomCell.identifier)
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.setHidesBackButton(true, animated: true)
        
        setupUI()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    //Mark:- Funcs
    
    func setupUI() {
        view.backgroundColor = .white
        view.addSubview(labelTitleOne)
        view.addSubview(tableView)
        
        
        labelTitleOne.snp.makeConstraints { make in
            make.top.equalTo(view.snp.top).offset(70)
            make.centerX.equalTo(view)
        }
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(labelTitleOne.snp.bottom).offset(20)
            make.left.equalTo(view.safeAreaLayoutGuide.snp.left).offset(20)
            make.right.equalTo(view.safeAreaLayoutGuide.snp.right).offset(-20)
            make.centerX.equalTo(view)
            make.size.equalTo(CGSize(width: 340, height: 600))
        }
    }
    
  
}

extension viewSchedule: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return exerciseImages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomCell.identifier, for: indexPath) as? CustomCell else {
            fatalError("Failed to dequeue CustomCell")
        }
        
        let image = exerciseImages[indexPath.row]
        let label = desc[indexPath.row]
        cell.configure(with: image, and: label)
        cell.contentView.backgroundColor = .white
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let selectedRow = indexPath.row
        
        if(selectedRow == 0){
            //monday
            getNextVC(pathStr: "/exercises/gain-weight/day-one",day: "Monday")
        }else if(selectedRow == 1){
            //tuesday
            getNextVC(pathStr: "/exercises/gain-weight/day-two",day: "Tuesday")
        }else if(selectedRow == 2){
            //wednesday
            getNextVC(pathStr: "/exercises/gain-weight/day-three",day: "Wednesday")
        }else if(selectedRow == 3){
            //thursday
            getNextVC(pathStr: "/exercises/gain-weight/day-four",day: "Thursday")
        }else if(selectedRow == 4){
            //friday
            getNextVC(pathStr: "/exercises/gain-weight/day-five",day: "Friday")
            
        }else if(selectedRow == 5){
            //saturday
            getNextVC(pathStr: "/exercises/gain-weight/day-six",day: "Saturday")
        }else if(selectedRow == 6){
            //sunday
            getNextVC(pathStr: "/exercises/gain-weight/day-seven",day: "Sunday")
        }
        
    }
    
    @objc func getNextVC(pathStr:String, day:String){
        let vc = viewDailyExercises()
        vc.pathStr = pathStr
        vc.labelTitleOne.text = day
        navigationController?.pushViewController(vc, animated: true)
    }
}
