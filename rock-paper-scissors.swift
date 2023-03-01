import Foundation

print("------------------------------------------------\n\\Rock, Paper, Scissors\\n------------------------------------------------\n")

func game() {
    // Every action is beaten by the one before it. If not a tie, the user wins if the computer didn't choose the action the precedes the user's choice in the list.
    let actions = ["Rock", "Paper", "Scissors"]

    let computerAction = actions[Int.random(in: 0..<actions.count)]
    print("Rock, paper, or scissors?")
    guard let userAction = readLine()?.capitalized else {
        print("Invalid action!\n")
        replay()
        return
    }

    // Check if user input is valid
    guard actions.contains(userAction) else {
        print("Invalid action!\n")
        replay()
        return
    }

    print("\nComputer: \(computerAction)")

    // Tie?
    if userAction == computerAction {
        print("Tie!\n")
        replay()
        return
    }

    // User wins if comp didn't choose action preceding user choice.
    let index = actions.firstIndex(of: userAction)!
    let win = actions[(index + 1) % actions.count] == computerAction

    print("You \(win ? "lose" : "win")\n")

    replay()
}

func replay() {
    print("Would you like to keep playing?")
    if let reply = readLine()?.lowercased() {
        print("")
        switch reply {
        case "yes":
            game()
        case "no":
            exit(0)
        default:
            print("Please answer \"YES\" or \"NO\"\n")
            replay()
        }
    }
}

game()