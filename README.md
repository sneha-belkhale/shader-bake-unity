# Shader Baking in Unity

Bake a pretty - or computationally challenging - shader into a texture in Unity. 

Check out this  <a href ="https://medium.com/@snayss/exploration-into-image-based-procedural-generation-unity-8f9fa7de10c1">medium article</a> for a more detailed explanation of the technique, and other related projects <a href ="https://codercat.tk">here</a>.

<img src ="https://user-images.githubusercontent.com/17795014/62589702-0245d880-b87f-11e9-8757-f4fed4ff8d52.png" width="75%">

## Description
Texture baking is very common technique in computer graphics to transfer the details of your shader into a texture. This is useful if you're shader is computationally heavy, but produces a static result ( complex noises ). 
Many modeling applications have this functionality down. If you have a pipeline of transferring assets from Blender/Houdini/Maya, then you may want to do the texture baking there. 

However, if you primarily work out of Unity, this repo is for you. With this technique, you can effectively save a custom shader's results that were manipulated in real-time, and  use the generated texture in any another application with a default shader ( Sketchfab? etc. ) .

## Usage

Open the Shader Baker scene in the Unity project, and press play. Press the 'M' Key to bake the current shader values into a texture. 

Pointers if you want to dig in and use this for your own projects:

`Shaders/FractalNoiseUnwrap.shader` - this shader is a duplicate of the one you want to bake, except with the vertex shader modified to render the vertices in UV space.

`Shaders/Dilate.shader` - this shader is responsible for the dilation post processing of the output texture.

`Scripts/ShaderBaker.cs` - attach this script to the camera, it is responsible for rendering the mesh to a texture. It has public fields where you should place the object you want to bake, a material with the unwrapped version of the shader you want to bake (`FractalNoiseUnwrap.shader` in this case), and a material with the dilate shader (`Dilate.shader`). You should also set the `backgroundColor` property to be a color that is distinct from the colors in your shader.


