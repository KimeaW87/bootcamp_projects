print("Welcome to our pizza shop")

print("Hello there!")

# Q1
print("What's your name?")
user_name <- readLines("stdin",n=1)
print(paste("Hi", user_name))

# Q2
menus <- c("pizza","beverage", "pasta", "appitizer", "exit", "pay")

fin <- FALSE
while (fin == FALSE) {

print("what do you want to order today?")
print("1. pizza, 2. beverage, 3. pasta, 4. appitizer, 5. exit, 6.pay")
action <- readLines("stdin", n=1)
if (as.integer(action) & action <5) {
  print( paste("you choose",
               menus[as.integer(action)]))
  
} else if (action ==5) {
  print("Good bye")
  fin <- TRUE
  break
} else if (action ==6) {
  paid <- FALSE
  while (paid == FALSE) {

  print("1. Cash, 2. Card")
  pay_method <- readLines("stdin", n=1)

  
  if (as.integer(pay_method)) {
    if(pay_method == 1) {
      print("you choose cash.")
      paid <- TRUE
      break
    } else if (pay_method == 2) {
      print("you choose card.")
      paid <- TRUE
      break
    } else {
      print("Wrong Type, pls try again!")
      paid <- FALSE
    }
    
  } else {
    print("N/A, pls try again!")
    paid <- FALSE
  }
}
  print("Done! Thank you.")
  fin <- TRUE
  break
  
} else {
  print("you choose wrong order.")
}
  print("Need to order more? [Y/N]")
  ans <- readLines("stdin", n=1)
  if (ans == "Y") {
    fin <- FALSE
  } else {
    fin <- TRUE
  }
}
