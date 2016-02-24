# matlab-eigenface-recognizer

This was for [an assignment](http://home.ku.edu.tr/~yyemez/comp508/Assignment3.htm) of [the computer vision course](http://home.ku.edu.tr/~yyemez/comp508/index.htm) that I took from [Yücel Yemez](http://home.ku.edu.tr/~yyemez/). This is the implementation of [eigenfaces technique](https://en.wikipedia.org/wiki/Eigenface) for face detection, verification and recognition tasks.

The system is trained and tested using 50x62 preprocessed (histogram equalization) grayscale jpeg images. Training set consist of images of the faces of people, one for each person. The file names of the training set are the names of the people. Test set consist of images which the program takes one by one and outputs whether it is a face or not, if it is, who is among the training set is more similar to the tested face.

## Installation and Execution
You should first clone the repository to your local
```
$ git clone https://github.com/atilberk/matlab-eigenface-recognizer.git
$ cd matlab-eigenface-recognizer
```
Then create `data`, `data/train` and `data/test` in the project directory.
```
$ mkdir data data/train data/test
```
and copy your train and test images under corresponding directories. Also copy one training image as `data/reconstruct.jpg` for reconstruction for training verification.
```
$ find data/train/*.jpg | head -1 | xargs -I % cp % data/reconstruct.jpg
```
Then finally you can run the script by
```
$ matlab main.m
```
You will see the program trains itself, verifies the training, and detects the faces then recognizes (if the person exists in the training set, otherwise what you will get is the most similar person).
