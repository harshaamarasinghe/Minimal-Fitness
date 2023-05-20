
import UIKit

class viewProgress: UIViewController  {
    

    //Mark:- Varibles
    
    
    //Mark:- Components
    
    let labelTitleOne : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 36, weight: .thin)
        label.text = "My Progress"
        label.textAlignment = .center
        return label
    }()
    
    //Mark:- Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }
    
    func setupUI(){
        view.backgroundColor = .white
        
        view.addSubview(labelTitleOne)
        
        labelTitleOne.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.centerX.equalTo(view)
        }
//
//        labelTwo.snp.makeConstraints { make in
//            make.top.equalTo(labelOne).offset(40)
//            make.centerX.equalTo(view)
//        }
//
//        image.snp.makeConstraints { make in
//            make.top.equalTo(labelTwo).offset(50)
//            make.centerX.equalTo(view)
//            make.size.equalTo(CGSize(width: 240, height: 180))
//        }
//
//        hStackMid.snp.makeConstraints { make in
//            make.top.equalTo(image.snp.bottom).offset(40)
//            make.centerX.equalTo(view)
//        }
//
//        labelFive.snp.makeConstraints { make in
//            make.size.equalTo(CGSize(width: 200, height: 100))
//        }
//
//        hStack.snp.makeConstraints { make in
//            make.top.equalTo(hStackMid.snp.bottom).offset(50)
//            //make.centerX.equalTo(view)
//            make.left.equalTo(view.safeAreaLayoutGuide.snp.left).offset(60)
//        }
//
//        labelSeven.snp.makeConstraints { make in
//            make.size.equalTo(CGSize(width: 200, height: 50))
//        }
//
//        buttonStart.snp.makeConstraints { make in
//            make.top.equalTo(hStack.snp.bottom).offset(60)
//            //make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-20)
//            make.centerX.equalTo(view)
//            make.size.equalTo(CGSize(width: 227, height: 50))
//        }
        
        
       
    }
    //Mark:- UI Setup
    

    

    // MARK:- Functions
    
    

}

