# CG Group Z Project

Godot download (our project is in Godot 4.6): https://godotengine.org/download/windows/.

How to use Godot project with Github Desktop: https://www.youtube.com/watch?v=fZ-CJIYPFMI&t=370s

Basics on making a 3D game in Godot: https://www.youtube.com/watch?v=ke5KpqcoiIU

# Using KayKit Platformer Asset Pack
Link to platformer asset pack by Kay Lousberg (it's free): https://kaylousberg.itch.io/kaykit-platformer . We should use these assets as our basic environment. 

After you've downloaded this pack, to import an asset into our Godot project you need to go to the following in your file system wherever you downloaded it:
KayKit_Platformer_Pack_1.0_FREE -> Assets -> gltf -> red (for example).
From there, drag a .bin file AND the corresponding .gltf file into the "models" folder in our Godot project (they'll be named the same thing). Dragging these two files into the models folder will create a singluar .gltf file which is the model as a whole. It should automatically texture itself based on the "platformer_texture.png" file within the models folder. 

To then actually be able to use that model in our game, create a 3D scene on Godot, name it the same as the model (just as a convention for our uses), and drag the model from the models folder under the new scene that you created, making it a child. This way we can have a collisionshape3D child next to it. 

Here's an example of this working: 
- I wanted a platform asset to use in our game, so I went to KayKit_Platformer_Pack_1.0.Free -> Assets -> gltf -> red in my files
- I then scrolled down until I saw "platform_6x6x4_red"
- I then dragged the .bin file and the .gltf file both called "platform_6x6x4_red" into the models folder in Godot
- I then clicked the "+" button at the top bar of the screen in Godot to create a new scene.
- I clicked "other node" and searched for the "StaticBody3D" node, which is used for objects that won't be moving. I clicked it and then renamed it to "platform_6x6x4_red".
- I then dragged "platform_6x6x4_red.gltf" from the models folder under the StaticBody3D node that I just created, making it a child of the StaticBody3D node.
- I renamed the .gltf file under the StaticBody3D node to "model"
- I then added a CollisionShape3D node as a child of the StaticBody3D node and set up its shape by selecting "BoxShape3D" from the Shape section under Inspector while having the CollisionShape3D selected.
- I then saved all of this to the "scenes" folder in our godot project. So, we now have a model called "platform_6x6x4" under the "models" folder and a scene named the same under the scenes folder. Things under the models folder should be used solely as a visual component for the actual objects (scenes) that we create, so we shouldn't drag things from the models folder directly into the game world. This is to keep from editing the actual models and rather use new scenes so that we can add different nodes to them like the collision shapes without breaking anything. 
