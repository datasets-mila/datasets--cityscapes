##########
CITYSCAPES
##########

`<https://www.cityscapes-dataset.com/>`_

****************
Dataset Overview
****************

The Cityscapes Dataset focuses on semantic understanding of urban street
scenes. In the following, we give an overview on the design choices that were
made to target the dataset’s focus.

********
Features
********

Polygonal annotations

-  Dense semantic segmentation
-  Instance segmentation for vehicle and people

Complexity

-  30 classes
-  See `Class Definitions <#class-definitions>`__ for a list of all classes and
   have a look at the applied `labeling policy <#labeling-policy>`__.

Diversity

-  50 cities
-  Several months (spring, summer, fall)
-  Daytime
-  Good/medium weather conditions
-  Manually selected frames

   -  Large number of dynamic objects
   -  Varying scene layout
   -  Varying background

Volume

-  5 000 annotated images with fine annotations (`examples
   <https://www.cityscapes-dataset.com/examples/#fine-annotations>`__)
-  20 000 annotated images with coarse annotations (`examples
   <https://www.cityscapes-dataset.com/examples/#coarse-annotations>`__)

Metadata

-  Preceding and trailing video frames. Each annotated image is the 20\
   :sup:`th` image from a 30 frame video snippets (1.8s)
-  Corresponding right stereo views
-  GPS coordinates
-  Ego-motion data from vehicle odometry
-  Outside temperature from vehicle sensor

Extensions by other researchers

-  Bounding box annotations of people
-  Images augmented with fog and rain

Benchmark suite and evaluation server

-  Pixel-level semantic labeling
-  Instance-level semantic labeling
-  Panoptic semantic labeling

***************
Labeling Policy
***************

Labeled foreground objects must never have holes, i.e. if there is some
background visible ‘through’ some foreground object, it is considered to be
part of the foreground. This also applies to regions that are highly mixed with
two or more classes: they are labeled with the foreground class. Examples: tree
leaves in front of house or sky (everything tree), transparent car windows
(everything car).

*****************
Class Definitions
*****************

Please click on the individual classes for details on their definitions.

+-----------------------------------+-----------------------------------+
| Group                             | Classes                           |
+===================================+===================================+
| flat                              | road · sidewalk · parking\ + ·    |
|                                   | rail track\ +                     |
+-----------------------------------+-----------------------------------+
| human                             | person\ \* · rider\ \*            |
+-----------------------------------+-----------------------------------+
| vehicle                           | car\ \* · truck\ \* · bus\ \* ·   |
|                                   | on rails\ \* · motorcycle\ \* ·   |
|                                   | bicycle\ \* · caravan\ \*+ ·      |
|                                   | trailer\ \*+                      |
+-----------------------------------+-----------------------------------+
| construction                      | building · wall · fence · guard   |
|                                   | rail\ + · bridge\ + · tunnel\ +   |
+-----------------------------------+-----------------------------------+
| object                            | pole · pole group\ + · traffic    |
|                                   | sign · traffic light              |
+-----------------------------------+-----------------------------------+
| nature                            | vegetation · terrain              |
+-----------------------------------+-----------------------------------+
| sky                               | sky                               |
+-----------------------------------+-----------------------------------+
| void                              | ground\ + · dynamic\ + ·          |
|                                   | static\ +                         |
+-----------------------------------+-----------------------------------+

-  \* Single instance annotations are available. However, if the boundary
   between such instances cannot be clearly seen, the whole crowd/group is
   labeled together and annotated as group, e.g. car group.
-  + This label is not included in any evaluation and treated as void (or in
   the case of *license plate* as the vehicle mounted on).
