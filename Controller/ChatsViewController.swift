import UIKit
import SnapKit

class ChatsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let scrollView = UIScrollView()
    let tableView = UITableView()
    let tabBar = UITabBar()
    var previousSelectedIndex: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        view.addSubview(scrollView)
        
        scrollView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(100)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(84)
        }
        
        let container = UIView()
        scrollView.addSubview(container)
        
        container.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.height.equalTo(scrollView)
            make.width.equalTo(700)
        }
        
        for i in 0..<10 {
            let circleView = UIImageView(image: UIImage(systemName: "person.crop.circle.fill"))
            circleView.layer.cornerRadius = 28
            circleView.layer.masksToBounds = true
            container.addSubview(circleView)
            
            circleView.snp.makeConstraints { make in
                make.centerY.equalToSuperview()
                make.leading.equalToSuperview().offset(20 + (i * 60))
                make.size.equalTo(CGSize(width: 56, height: 56))
            }
        }
        
        
        let labelProfile = UILabel()
        labelProfile.text = "Chats"
        labelProfile.textColor = .black
        labelProfile.font = UIFont.systemFont(ofSize: 16)
        
        let labelProfileButton = UIBarButtonItem(customView: labelProfile)
        
        if let existingItems = navigationItem.leftBarButtonItems {
            navigationItem.leftBarButtonItems = existingItems + [labelProfileButton]
        } else {
            navigationItem.leftBarButtonItems = [labelProfileButton]
        }
        
        navigationItem.leftItemsSupplementBackButton = true
        
        let searchTextField = UITextField()
        searchTextField.placeholder = "Search"
        searchTextField.backgroundColor = UIColor.lightGray.withAlphaComponent(0.3)
        searchTextField.textAlignment = .left
        searchTextField.leftViewMode = .always
        
        guard let searchImage = UIImage(systemName: "magnifyingglass") else {
            fatalError("System image 'magnifyingglass' not found")
        }
        
        let searchImageView = UIImageView(image: searchImage)
        searchImageView.contentMode = .scaleAspectFit
        
        searchTextField.leftView = searchImageView
        view.addSubview(searchTextField)
        
        searchTextField.snp.makeConstraints { make in
            make.top.equalTo(scrollView.snp.bottom).offset(40)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo(36)
        }
        
        tableView.backgroundColor = .clear
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(ContactTableViewCell.self, forCellReuseIdentifier: "Cell")
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(searchTextField.snp.bottom).offset(30)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview().offset(-110)
        }
        
        let button1 = UITabBarItem(title: "", image: UIImage(named: "ImageContacts"), selectedImage: nil)
        let button2 = UITabBarItem(title: "", image: UIImage(named: "ImageChats"), selectedImage: nil)
        let button3 = UITabBarItem(title: "", image: UIImage(named: "ImageSettings"), selectedImage: nil)
        
        tabBar.items = [button1, button2, button3]
        
        view.addSubview(tabBar)
        
        tabBar.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview()
            make.height.equalTo(100)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! ContactTableViewCell
        
        cell.imageViewProfile.image = UIImage(systemName: "person.crop.circle.fill")
        cell.labelName.text = "John Doe"
        cell.labelTime.text = "2:30 PM"
        
        return cell
    }
}

extension ChatsViewController: UITabBarDelegate {
    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        tabBar.selectedItem = tabBar.items?[previousSelectedIndex]
    }
}
