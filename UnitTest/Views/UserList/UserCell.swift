//
//  UserCell.swift
//  UnitTest
//
//  Created by Md Hosne Mobarok on 1/2/26.
//


import UIKit

final class UserCell: UITableViewCell {
    static let id = "UserCell"

    func configure(user: User) {
        textLabel?.text = user.name
        detailTextLabel?.text = user.company.name
        accessoryType = .disclosureIndicator
    }
}
