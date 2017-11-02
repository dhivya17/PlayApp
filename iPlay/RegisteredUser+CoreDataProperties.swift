//
//  RegisteredUser+CoreDataProperties.swift
//  iPlay
//
//  Created by mac_admin on 31/10/17.
//  Copyright © 2017 mac_admin. All rights reserved.
//
//

import Foundation
import CoreData


extension RegisteredUser {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<RegisteredUser> {
        return NSFetchRequest<RegisteredUser>(entityName: "Users")
    }

    @NSManaged public var fname: String?
    @NSManaged public var password: String?
    @NSManaged public var email: String?
    @NSManaged public var interest: String?
    @NSManaged public var bday: String?

}
