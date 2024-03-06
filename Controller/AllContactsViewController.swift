import UIKit
import SnapKit

class AllContactsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let tableView = UITableView()
    let tabBar = UITabBar()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        let labelProfile = UILabel()
        labelProfile.text = "Contacts"
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
            make.top.equalToSuperview().offset(100)
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
        
        tabBar.delegate = self
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

extension AllContactsViewController: UITabBarDelegate {
    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        if item == tabBar.items?[1] {
            showChatsViewController()
        }
    }
    
    func showChatsViewController() {
        let chatsVC = ChatsViewController()
        navigationController?.pushViewController(chatsVC, animated: true)
    }
}

class ContactTableViewCell: UITableViewCell {
    let imageViewProfile = UIImageView()
    let labelName = UILabel()
    let labelTime = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        imageViewProfile.contentMode = .scaleAspectFill
        imageViewProfile.layer.cornerRadius = 28
        imageViewProfile.clipsToBounds = true
        contentView.addSubview(imageViewProfile)
        
        labelName.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        contentView.addSubview(labelName)
        
        labelTime.font = UIFont.systemFont(ofSize: 14)
        labelTime.textColor = .gray
        contentView.addSubview(labelTime)
        
        imageViewProfile.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.centerY.equalToSuperview()
            make.width.height.equalTo(56)
        }
        
        labelName.snp.makeConstraints { make in
            make.top.equalTo(imageViewProfile.snp.top)
            make.leading.equalTo(imageViewProfile.snp.trailing).offset(30)
        }
        
        labelTime.snp.makeConstraints { make in
            make.top.equalTo(labelName.snp.bottom).offset(18)
            make.leading.equalTo(labelName.snp.leading)
            make.bottom.lessThanOrEqualTo(contentView.snp.bottom).offset(-18)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
