import UIKit

class viewSchedule: UIViewController {
    
    let exerciseImages : [UIImage] = [
        UIImage(systemName: "figure.run")!,
        UIImage(systemName: "figure.run")!,
        UIImage(systemName: "figure.run")!,
        UIImage(systemName: "figure.run")!,
        UIImage(systemName: "figure.run")!,
        UIImage(systemName: "figure.run")!,
        UIImage(systemName: "figure.run")!,
        
        
    ]
    
    let desc : [String] = [
        "Monday",
        "Tuesday",
        "Wednesday",
        "Thursday",
        "Fridday",
        "Saturday",
        "Sunday",
       
    ]
    
    
   
    
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
        setupUI()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func setupUI() {
        view.backgroundColor = .white
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
        ])
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
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
}
