# SVM
## Data Mining and Machine Learning Course Final Project
## A Support Vector Machine approach for object based image.

### Project Flow
-	After understanding what we had to do, we searched for pictures of 2 shapes on the internet.
We parted them into 2 groups and defined one group as data training and the other as a test. We had to make sure that the SVM structure that we’ve created was accurate enough, and so we had gone through a small process of trial and error.

-	In addition, we defined a classification vector that symbolizes the classes. After figuring out the way to use the algorithm we were trying to make it run with the most accurate depictions. 

-	Because the picture we have found online did not contain colour, in first place, we needed to somehow produce an image containing 2 objects. Therefore, we created a function that recognize the object. In case of a 2-objects-base-image or less, it will distinguish between the objects and separate them.

-	In the next step we used SVM to generate a model that will classify unknown future object based image on data and class vector we have. We had to make some changes with the received matrix from the image in order to make it work.

-	The next step is examining our machine by sampling new images activating the function that recognizes the object and checking the resulting class. This turned out to be easier than expected, given the SVM structure on Matlab, which was efficient enough for the use.

###	Obtained results:
 The target was achieved successfully and the object classified correctly, as well in case of 2 objects in one image.

###	Conclusion:
 An algorithm that is based on an object will be more accurate since it can have properties of the whole object that cannot be achieved from one pixel. SVM can distinguish well enough between objects of pictures if done right, but it takes some effort.
