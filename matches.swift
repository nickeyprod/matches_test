/* Текст задания:
Дан список с
результатами матчей ("3:1", "2:2", "0:1",
"4:2", "3:a", "3- 12").
Исходя из логики, что за победу в домашних матчах дается 3 очка, за ничью 1
очко, за поражение 0 очков.

Вывести на экран количество очков, набранных каждой командой по итогам
проведенных матчей.

Например, счет матча "3:1":
Команда №1 (хозяева) забила 3 гола, гости - Команда №2 забила 1 гол.
Соответственно, Команда №1 получила 3 очка, Команда №2 - 0 очков.

В результатах матча могут быть ошибки, ваш код должен обработать это поведение. */

// Сыгранные матчи и их результаты (счет)
let matchesList = ["3:1", "2:2", "0:1",
"4:2", "3:a", "3- 12"]

// Награды за домашние матчи
let awardsForHomeMatches = [
    "win": 3,
    "draw": 1,
    "loss": 0
]


let homeCmdIndex = 0
let foreignCmdIndex = 1

var homeCmdGoals = 0
var foreignCmdGoals = 0
var gameNum = 1

var totalCmd1 = 0
var totalCmd2 = 0
for score in matchesList {
    print("====== ИГРА №\(gameNum) ======")
    gameNum += 1
    var splittedScore = score.split(separator: ":")
    if let homeCmdGoals = Int(score.split(separator: ":")[0]) {
        if let foreignCmdGoals = Int(score.split(separator: ":")[1]) {
            
            let homeGameResult = homeCmdGoals > foreignCmdGoals ? "win" : homeCmdGoals < foreignCmdGoals ? "loss" : "draw"
            let foreignGameResult  = homeCmdGoals < foreignCmdGoals ? "win" : homeCmdGoals > foreignCmdGoals ? "loss" : "draw"
            let homeAward = awardsForHomeMatches[homeGameResult]!
            let foreignAward = awardsForHomeMatches[foreignGameResult]!

            totalCmd1 += homeAward
            totalCmd2 += foreignAward

            let homeGoalsEnding = "\(homeCmdGoals == 1 ? "гол" : homeCmdGoals > 4 || homeCmdGoals == 0 ? "голов" : "гола")"
            let foreignGoalsEnding = "\(foreignCmdGoals == 1 ? "гол" : foreignCmdGoals > 4 || foreignCmdGoals == 0 ? "голов" : "гола")"
            print("Команда №1 (хозяева) забила \(homeCmdGoals) \(homeGoalsEnding), гости - Команда №2 забила \(foreignCmdGoals) \(foreignGoalsEnding).")
            let homeAwardEnding = "\(homeAward == 1 ? "очко" : homeAward > 1 && homeAward < 4 ? "очка" : homeAward > 4 || homeAward == 0 ? "очков" : "очка")"
            let foreignAwardsEnding = "\(foreignAward == 1 ? "очко" : foreignAward > 1 && foreignAward < 4 ? "очка" : foreignAward > 4 || foreignAward == 0 ? "очков" : "очка")"
            print("Команда №1 получила \(homeAward) \(homeAwardEnding), Команда №2 - \(foreignAward) \(foreignAwardsEnding).")
        } else {
            print("Я не смог распознать счет Второй команды! Поэтому не могу рассчитать очки.")
            splittedScore.remove(at: 1)
        }
        
    } else {
        print("Я не смог распознать счет Первой команды! Поэтому не могу рассчитать очки.")
        splittedScore.remove(at: 0)
    }

    if splittedScore.count != 2 {
        print("В предоставленных результатах для Игры №\(gameNum) содержится ошибка!")
    }
    
}
print("=================================================")
print("Итого: Команда №1 (хозяева) набрала \(totalCmd1) \(totalCmd1 == 1 ? "очко" : totalCmd1 > 1 && totalCmd1 < 4 ? "очка" : totalCmd1 > 4 || totalCmd1 == 0 ? "очков" : "очка"), а Команда №2 (гости) - \(totalCmd2) \(totalCmd2 == 1 ? "очко" : totalCmd2 > 1 && totalCmd2 < 4 ? "очка" : totalCmd2 > 4 || totalCmd2 == 0 ? "очков" : "очка").")