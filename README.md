# Graph

![version](https://img.shields.io/badge/version-v0.2-lightgrey)
![license](https://img.shields.io/badge/license-GNU%20GPL%20v3-blue) <br>
[![linkedin](https://img.shields.io/badge/linkedin-0A66C2?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/luis-fernando-rojas-gonz%C3%A1lez-792a431a3/)<br>

This is a class for creating interactive colored and dynamic graph bar with Processing

<img src="https://i.imgur.com/LxmE33c.png" title="Example" />

## Installation

1. Download and Install <a href="https://processing.org/download">Processing 3.x</a> stable release
2. Download and Install <a href="https://www.oracle.com/technetwork/es/java/javase/downloads/index.htm">Java SE 8.x</a>
3. Download the last version of Graph using GitHub clone button or...

If you have git command line installed in your PC you can use
```bash
git clone https://github.com/LuisFer666/Graph.git
```

If you have GitHub command line installed in your PC you can use
```bash
gh repo clone LuisFer666/Graph
```

4. Build and run this project

You can create instances of Grafica class in your own project

## Usage

1. Create a global object of Grafica class

```java
Grafica g;
```

2. Instance you object and set values before draw method (setup method is recomended)

```java
void setup(){
  // ...
  g = new Grafica(10, 10, 500,500);
  g.setValues(new float[]{5.5, 6.6, 7.7, 8.2, 0.5, 1.2});
  // ...
}
```

3. Call Grafica's draw() method for drawing your Graph after calling background method

```java
void draw(){
  background(255);
  // ...
  g.draw();
  // ...
}
```
