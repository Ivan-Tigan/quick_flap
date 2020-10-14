# quick_flap

To create a local copy of the project with the non-completed version,  
run the commands below (in any folder you choose):
```
git clone https://github.com/Ivan-Tigan/quick_flap.git
cd quick_flap
git checkout start
```
1. Open Godot.
2. Click Scan.
3. Find the folder quick_flap where you cloned the project and select it.
4. Click Select Current Folder.
5. An entry called quick_flap should now appear -- double click to open it.

## Godot Quick Guide - major features of the engine

## Editor

There are 4 main windows. Each window gives access to a few tabs. Each tab provides some functionality.  
- top left:
  - Scene - tree hierarchy of all nodes in the currently opened scene. (in Godot each Node can be opened as a Scene and each Scene can be used as a Node)
  - Import - file import settings; the most important ones are:
    - *.png - filter - disable this for pixel art to prevent blurriness
    - *.wav:
      - trim - remove unnecessary silence at beginning or end of audio file
      - loop - looping soundtracks
- middle:
   - 2D/3D - visualization of the currently opened scene; notice the blue rectangle outline that shows the limits of the screen when the game is played
   - script - write code here
- top right:
   - Inspector - all properties of the currently selected node; each one can be animated or accessed/modified through code by the name you see here.
   - Node - 
      - Signals - events that you can connect to a function in your code (Timer node has timeout signal which will call any connected function when the Timer times out)
      - Groups - tags, useful for checking whether a node belongs to some group (has some tag) or to get all nodes from a group (all nodes with some tag)
- bottom left - folders and files
- bottom middle - submenus for different tools, such as debug output, spritesheet editing/selection, audio channel manipulation, animation, etc.

## Nodes
A Node is a Scene and a Scene is a Node. Every Node can be edited as a Scene and every Scene can be instanced inside another Node/Scene as a Node.
Predefined Nodes come with some very useful predefined functionality.
- Control - UI related nodes
   - Button
   - Label - display text
- Node2D - 2D game nodes
  - Sprite - 2D image
  - KinematicBody2D - 2d node with sophisticated movement logic via move_and_slide(...) function - this is what you use when you want something to move.Requires Area2D for collisions.
  - Area2D - Node that can detect overlaps with other Area2D nodes. Use area_entered signals. Requires CollisionShape2D to define its shape.
  - CollisionShape2D - define the shape of Area2D. Usually circle/capsule for player and rectangle for solids.
- Spatial - like Node2D but for 3D
- Other - Anything that does not fit into above categories. Usually provide some utility.
  - Timer - can run function every n seconds via the timeout signal
  - AnimationPlayer - can define animations that animate any property of any node over time and can be controlled through code.
  - AudioStreamPlayer (NOT AudioStreamPlayer2D) - plays a sound; for sound effects pick AudioStreamRandomPitch for Stream in the Inspector

## Navigation
 - Q - select
 - W - move selection
 - E - rotate 
 - S - scale

## Settings (top left)
- Project:
  - Project Settings:
    - General:
      - Window:
        - set resolution here
        - Mode - set to 2D
        - Aspect - set to keep
        - Last 2 make resolution work perfectly regardless of how screen is scaled and on what monitor. Try with and without them.
      - Node: 
        - Name Casing - I recommend you set this to snake_case but you can do whatever you prefer
    - Input Map
      - define input actions here and bind them to one or more keys/buttons/mouse/joystick whatever. Left mouse button is also touch for touchscreen.
  - Export:
    - you might need to download templates if you see red text, just click the link and then click the first option and it will do it for you
    - export by pressing Export Project and NOT Export PCK/Zip
    - for HTML5 remember to save your file as index.html instead of say flappy.html
    - for other platforms you can name the file however you wish.

## Other
- When creating a new project pick GLES2 for HTML5. This means that you can the only use CPUParticles2D instead of Particles2D (not a big deal for most cases)
