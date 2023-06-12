//
// DataStore.swift
// Good Sips
//
// DataStore : Task Structure
// Connected To: MySips, RatingView, BarTabList
//
// Created by Katelin Vincent
// Tested by Afiya Vora on 6/20/22.

import Foundation
import SwiftUI
import Combine

struct DSTask : Identifiable{
  var id = String()
  var toDoItem = String()
    var rating = Int()
}

class TaskStore : ObservableObject {
  @Published var tasks = [DSTask]()
}
