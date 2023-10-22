//
//  TopModel.swift
//  CryptoTestApp
//
//  Created by Artem on 19.10.2023.
//

import Foundation

struct TopModel: Equatable {
    let position: Int
    let country: String
    let name: String
    var deposit: Int
    var profit: Int
}
struct Pair: Identifiable {
    let id: Int
    let pair: String
}

var currencyPairs = [
    Pair(id: 0, pair:"EUR/USD"),
    Pair(id: 1, pair:"RUB/USD"),
    Pair(id: 2, pair:"GPB/USD"),
    Pair(id: 3, pair:"USD/RUB"),
    Pair(id: 4, pair:"USD/EUR"),
    Pair(id: 5, pair:"EUR/USD"),
    Pair(id:6, pair:"RUB/USD"),
    Pair(id:7, pair:"GPB/USD"),
    Pair(id:8, pair:"USD/RUB"),
    Pair(id:9, pair:"USD/EUR"),
    Pair(id:10, pair:"GPB/USD"),
    Pair(id:11, pair:"USD/RUB"),
    Pair(id:12, pair:"USD/EUR"),
    Pair(id:13, pair:"RUB/USD")]

var mocData: [TopModel] = [
TopModel(position: 1, country: "swed", name: "Oliver", deposit: 19993, profit: 101501),
TopModel(position: 2, country: "usa", name: "Bob", deposit: 5555, profit: 97900),
TopModel(position: 3, country: "korea", name: "Kim", deposit: 3995, profit: 95200),
TopModel(position: 4, country: "rus", name: "Vovan", deposit: 4500, profit: 88020),
TopModel(position: 5, country: "brazil", name: "Jacob", deposit: 10000, profit: 74125),
TopModel(position: 6, country: "greece", name: "Mark", deposit: 14200, profit: 52300),
TopModel(position: 7, country: "belgium", name: "Stewart", deposit: 7000, profit: 39401),
TopModel(position: 8, country: "france", name: "Jack", deposit: 5555, profit: 25700),
TopModel(position: 9, country: "wales", name: "Angela", deposit: 993, profit: 19080),
TopModel(position: 10, country: "austr", name: "Tim", deposit: 1555, profit: 12000),
]
