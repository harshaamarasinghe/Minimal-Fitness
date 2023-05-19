import UIKit
import SnapKit
import FirebaseCore
import FirebaseFirestore

class viewHome: UIViewController {
    
    //Mark:- Variables
    
    let db = Firestore.firestore() //Firebase Decl
    
    var dataArray: [[String: Any]] = []
    var nameDataArray: [String] = []
    var descDataArray: [String] = []
    var picDataArray: [String] = []
    var videoDataArray: [String] = []
    
    
    //Mark:- Components
    
    let labelTitleOne : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 36, weight: .thin)
        label.text = "Let's thrive"
        label.textAlignment = .center
        return label
    }()
    
    let labelTitleTwo : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 14, weight: .thin)
        label.textColor = UIColor(red: 89/255, green: 89/255, blue: 89/255, alpha: 1.0)
        label.text = "Bring your best to the tables"
        label.textAlignment = .center
        return label
    }()
    
    let imageProfile: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "man"))
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 40
        return imageView
    }()
    
    let exerciseTable : UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.backgroundColor = .systemBackground
        table.allowsSelection = true
        table.register(CustomCell.self, forCellReuseIdentifier: CustomCell.identifier)
        return table
    }()
    
    //Mark:- Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        readDocument()
        
        self.exerciseTable.delegate = self
        self.exerciseTable.dataSource = self
        
        
        setupUI()
    }
    
    //Mark:- Funcs
    
    func setupUI(){
        view.backgroundColor = .white
        view.addSubview(labelTitleOne)
        view.addSubview(labelTitleTwo)
        view.addSubview(imageProfile)
        view.addSubview(exerciseTable)
        
        //Constraints
        
        labelTitleOne.snp.makeConstraints { make in
            make.top.equalTo(view.snp.top).offset(70)
            make.left.equalTo(view.safeAreaLayoutGuide.snp.left).offset(25)
        }
        
        labelTitleTwo.snp.makeConstraints { make in
            make.top.equalTo(labelTitleOne.snp.bottom).offset(5)
            make.left.equalTo(view.safeAreaLayoutGuide.snp.left).offset(25)
        }
        
        imageProfile.snp.makeConstraints { make in
            make.top.equalTo(view.snp.top).offset(60)
            make.right.equalTo(view.snp.right).offset(-25)
            make.size.equalTo(CGSize(width: 80, height: 80))
        }
        
        exerciseTable.snp.makeConstraints { make in
            make.top.equalTo(labelTitleTwo.snp.bottom).offset(40)
            make.left.equalTo(view.safeAreaLayoutGuide.snp.left).offset(20)
            make.right.equalTo(view.safeAreaLayoutGuide.snp.right).offset(-20)
            make.centerX.equalTo(view)
            make.size.equalTo(CGSize(width: 340, height: 600))
        }
    }
    
    func readDocument(){
        
        db.collection("/exercises/gain-weight/day-one").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    let data = document.data()
                    self.dataArray.append(data)
                }
                
                self.saveNameArray()
                self.saveDescArray()
                self.savePicArray()
                self.saveVideoArray()
                
                self.exerciseTable.reloadData()
            }
        }
    }
    
    func saveNameArray() {
        for data in dataArray {
            self.nameDataArray.append(data["name"] as! String)
        }
        printArrayData()
    }
    
    func saveDescArray() {
        for data in dataArray {
            self.descDataArray.append(data["desc"] as! String)
        }
    }
    
    func savePicArray() {
        for data in dataArray {
            self.picDataArray.append(data["pic"] as! String)
        }
    }
    
    func saveVideoArray() {
        for data in dataArray {
            self.videoDataArray.append(data["videoid"] as! String)
        }
    }
    
    func printArrayData() {
        print("Name data array:")
        for data in nameDataArray {
            print(data)
        }
    }
}

extension viewHome : UITableViewDelegate, UITableViewDataSource{
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.nameDataArray.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = exerciseTable.dequeueReusableCell(withIdentifier: CustomCell.identifier, for: indexPath) as? CustomCell else {
            fatalError("Failed Attempt: Table View")
        }
        
        let image = self.picDataArray[indexPath.row]
        let pic = UIImage(named: image)
        let label = self.nameDataArray[indexPath.row]
        cell.configure(with: pic!, and: label)
        cell.contentView.backgroundColor = .white
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        //let row = [indexPath.row]
        
        let nameD = nameDataArray[indexPath.row]
        let descD = descDataArray[indexPath.row]
        let videoD = videoDataArray[indexPath.row]
        
        print(nameD,":",descD,":",videoD)
        
        
        
        //sendExerciseDataToViewExer(name: nameD, desc: descD, video: videoD)
        getNext(name: nameD, desc: descD, video: videoD)
    }
    
//    func sendExerciseDataToViewExer(name:String,desc:String,video:String){
//        let exerVc = viewExercise()
//        exerVc.labelWorkout.text = name
//        exerVc.labelDesc.text = desc
//        exerVc.videoId = video
//
//
//    }
    
    @objc func getNext(name:String,desc:String,video:String) {
        let vc = viewExercise()
        vc.labelWorkout.text = name
        vc.labelDesc.text = desc
        vc.videoId = video
        
        navigationController?.pushViewController(vc, animated: true)
    }

}


