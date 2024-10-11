# Learning GDScript by Developing a Game with Godot 4

<a href="https://www.packtpub.com/product/learning-gdscript-by-developing-a-game-with-godot-4/9781804616987"><img src="https://content.packt.com/B19358/cover_image_small.jpg" alt="" height="256px" align="right"></a>

This is the code repository for [Learning GDScript by Developing a Game with Godot 4](https://www.packtpub.com/product/learning-gdscript-by-developing-a-game-with-godot-4/9781804616987), published by Packt.

**A fun introduction to programming in GDScript 2.0 and game development using the Godot engine**

## What is this book about?
In the digital landscape driven by interactive experiences, the demand for creative individuals with the skills to create captivating games has never been higher. Written by Sander Vanhove, a seasoned game developer with over 20 games to his credit, this book will serve as your entry point into game development, showing you how to leverage the powerful features of the open-source, versatile GDScript 2.0 to develop your ideas, from simple platformers to complex RPGs.
	
This book covers the following exciting features:
* Develop your GDScript 2.0 programming skills from basic to advanced, emphasizing code cleanliness
* Harness Godot 4's integrated physics engine to control and manipulate in-game objects
* Design a vibrant and immersive game world by seamlessly integrating a diverse array of assets
* Master the art of processing input from various sources for enhanced interactivity
* Extend the reach of your game by learning how to export it to multiple platforms
* Implement basic AI systems and incorporate simple multiplayer functionality for a dynamic gaming experience

If you feel this book is for you, get your [copy](https://www.amazon.com/dp/1804616982) today! 

<a href="https://www.packtpub.com/?utm_source=github&utm_medium=banner&utm_campaign=GitHubBanner"><img src="https://raw.githubusercontent.com/PacktPublishing/GitHub/master/GitHub.png" 
alt="https://www.packtpub.com/" border="5" /></a>


## Instructions and Navigations
All of the code is organized into folders. For example, Chapter03.

The code will look like the following:
```gdscript
func _ready():
  var inventory = [
    "Boots",
    "Bananas",
    "Bees"
  ]
  print(inventory[100])
```

**Following is what you need for this book:**

This book is for programmers, game designers, game developers, and game artists who want to start creating games in Godot 4. If you’re new to coding or game development, looking for a new creative outlet, and want to give Godot 4 and GDScript 2.0 a try, this book is for you. While no prior knowledge of programming or Godot is required, this book gradually introduces more complex concepts as you advance through the chapters.

With the following software and hardware list you can run all code files present in the book (Chapter 1-16).

### Software and Hardware List

| Chapter  | Software required    | OS required                      |
| -------- | ---------------------| ---------------------------------|
| 1-16     | Godot 4.2.1          | Windows, macOS, or Linux         |
| 1-16     | GDScript 2.0         | Windows, macOS, or Linux         |


### Related products <Other books you may enjoy>
* The Essential Guide to Creating Multiplayer Games with Godot 4.0 [[Packt]](https://www.packtpub.com/product/the-essential-guide-to-creating-multiplayer-games-with-godot-40/9781803232614) [[Amazon]](https://www.amazon.com/dp/1803232617)

* Godot 4 Game Development Projects [[Packt]](https://www.packtpub.com/product/godot-4-game-development-projects-second-edition/9781804610404) [[Amazon]](https://www.amazon.com/dp/1804610402)

## Errata 
* Page 32, Multiplication does not have precedence over division or modulo, just like addition does not have precedence over subtraction.
* Page 33, "We have assigned new **valuesv** to variables using the assignment operator (=)"  _it should be_  "We have assigned new **values** to variables using the assignment operator (=)"
* Page 33, Figure 2.6: Line 11 reads `number_of_lives -= number_of_lives` _should read_ `number_of_lives -= fire_ball_damage`
* Page 36, This snippet of code should print out the following:
  ``` The number of lives is 3. ```
  _should be_
  ```The number of lives is 1 ```
* Page 52, Last code snippet _should be_ `print("You live" if number_of_lives > 0 else "You died!")` _instead of_ `Print("You live" if number_of_lives > 0`
* Page 62, "Here, we remove the first element of the inventory array as long, so the array has a length of more than three elements." _it should be_ "Here, we remove the first element of the inventory array as long as the length is more than three elements."
* Page 64, Line 2 of the code snippet: `For item in inventory.size():` _should read_ `For item in inventory:`
* Page 95, The `_ready` functions of the `BuffEnemy` and `StrongEnemy` classes should be `_init` functions.
* Page 136, Under section **Different types of exported variables** "including the outer values of 0 and 20." _should be_ "including the outer values of 0 and 10."
* Page 136, Last code snippet _should be_ `@export_range(0, 10) var health: int = 10` _instead of_ `@export_range(0, 10) health: int = 10`
* Page 193, The path to the sprite should be `assets/sprites/collectibles` instead of `assets/visual/collectibles`.
* Page 194, "Save the script as collectible.gb" _should be_ "Save the script as collectible.gd".
* Page 209, point number 6, it should be "the first VBoxContainer node" _instead of_ "the first VBocContainer node"
* Page 210, "In the function that is connected to the Exit button, we call the quit() function, which simply **shits**
down the runtime." _should be_ "In the function that is connected to the Exit button, we call the quit() function, which simply **shuts**
down the runtime."
* Page 220, The function `hit()` should be called `get_hit()`.
* Page 233 & 243, `_enemy_spawner.stop() _health_potion_spawner.stop()` should be `_enemy_spawner.stop_timer() _health_potion_spawner.stop_timer()`.
* Page 259, The function call for `get_childr` should be `get_child`.
* Chapter 8, There is confusing use between the name `Arena` and `Environment` for the node that contains all the objects of the terrain. It should be `Environment` in both the screenshots, explanation and folder structure.


## Get to Know the Author
**Sander Vanhove** 
has been creating games with the Godot Game Engine for over five years, releasing over 20 games on multiple platforms. However, his interest in games started long before that, taking him from engine to engine before finally settling. This enthusiasm, along with his master's in computer science, gave him a broad knowledge of programming and AI, which he now applies in his day job as a lead game developer and technical artist of a studio that uses the Godot Engine. You can always find him working on that next project, learning new game development techniques, or trying to teach people how to use Godot.
