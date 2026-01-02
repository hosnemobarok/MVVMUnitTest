//
//  UserListViewController.swift
//  UnitTest
//
//  Created by Md Hosne Mobarok on 1/2/26.
//


import UIKit
import Combine

final class UserListViewController: UIViewController {

    // MARK: UI Component
    private let tableView = UITableView()

    private let viewModel: UserListViewModel
    private var cancellables = Set<AnyCancellable>()

    init(viewModel: UserListViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        title = "Users"
    }

    required init?(coder: NSCoder) { fatalError("init(coder:) not implemented") }

    override func viewDidLoad() {
        super.viewDidLoad()
        initCall()
    }
    
    // MARK: Private Methods -
    
    private func initCall() {
        setupUI()
        bindViewModel()
        viewModel.loadUsers()
    }
    
    private func setupUI() {
        view.backgroundColor = .systemBackground
        tableView.register(UserCell.self, forCellReuseIdentifier: UserCell.id)
        tableView.dataSource = self
        view.addSubview(tableView)
        tableView.frame = view.bounds
    }

    private func bindViewModel() {
        viewModel.$users
            .receive(on: DispatchQueue.main)
            .sink { [weak self] _ in self?.tableView.reloadData() }
            .store(in: &cancellables)
    }
}

extension UserListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.users.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: UserCell.id, for: indexPath) as? UserCell else {
            return UITableViewCell()
        }
        let user = viewModel.users[indexPath.row]
        cell.configure(user: user)
        return cell
    }
}
