# Player-Tracking-in-Cricket-Broadcasting-videos
Tracking of player in the cricket field during a match


## Project Description

### Key Frame Detection
* Detecting key frames in the video which contain cricket field through dominant color detection. (Here, for a cricket ground the dominant color is green)
* Seperate the R,G,B components from the frame and find the average of all the 3 components.

![alt text](https://github.com/yuhiremath/Player-Tracking-in-Cricket-Broadcasting-videos/blob/master/Images/dominant_color_detection.png)

### Cricket ground segmentation 
* Take some sample images which have field view and some which do not.
* Convert the RGB image into L*a*b color space as RGB includes only about 90% all perceivable colors.
* Take the  ‘a’ and ‘b’ components of all the pixels and all the images and feed it into the K means algorithm and obtain the cluster centroid
* Use the cluster centroid to vector quantize the images to segment in the field in the image. 

### Edge detection 
* Consider the original image.
* Blur the image with an averaging filter.
* Subtract the image with the original image.
* Apply binary threshold.

## Detecting players
* A heuristic approach is used according to the shape and the size of players in the field to eliminate the false positives.


## Results

### Key frames 

![alt text](https://github.com/yuhiremath/Player-Tracking-in-Cricket-Broadcasting-videos/blob/master/Images/key_frames.png)
<br>
<br>
### Vector Quantization of images using cluster centroids (Obtain blobs)

![alt text](https://github.com/yuhiremath/Player-Tracking-in-Cricket-Broadcasting-videos/blob/master/Images/obtaining_cluster_centers.png)
<br>
<br>
### Edge Detection 

![alt text](https://github.com/yuhiremath/Player-Tracking-in-Cricket-Broadcasting-videos/blob/master/Images/edge_detection.png)
<br>
<br>
### Combining blob and edge detection 

![alt text](https://github.com/yuhiremath/Player-Tracking-in-Cricket-Broadcasting-videos/blob/master/Images/combining_edge_blob.png)
<br>
<br>
### Bounding boxes to detect players

![alt text](https://github.com/yuhiremath/Player-Tracking-in-Cricket-Broadcasting-videos/blob/master/Images/bouding_boxes.png)
<br>
<br>














