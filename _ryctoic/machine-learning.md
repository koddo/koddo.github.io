---
title:   "Machine learning"
layout:  collection_page

---

<https://www.reddit.com/r/math/comments/4ieenr/calculus_and_backpropagation/d2xqaj7>

<http://devzum.com/2015/06/best-machine-learning-cheat-sheets/>

<https://s3.amazonaws.com/MLMastery/MachineLearningAlgorithms.png>


# Kaggle

start with <https://www.quora.com/What-Kaggle-competitions-should-a-beginner-start-with-1/answer/William-Chen-6?srid=Ywn4>

Binary Classification: Titanic: Machine Learning from Disaster

Multi-Class Classification: Forest Cover Type Prediction

Regression with temporal component: Bike Sharing Demand

Binary Classification with text data: Random Acts of Pizza

Digit Recognizer

Amazon Employee Access Challenge

Sentiment Analysis on Movie Reviews

# XGBoost

<https://xgboost.readthedocs.io/en/latest/model.html>


# decision trees

## algorithm

we start at the root node

1. find a split that that maximizes information gain
2. do the split
3. recur into two new nodes

stopping rules:

- max depth is reached
- leaf nodes are pure
- splitting doesn't lead to an information gain


## gini vs entropy

> - Gini is intended for continuous attributes, and Entropy for attributes that occur in classes (e.g. colors)
> - “Gini” will tend to find the largest class, and “entropy” tends to find groups of classes that make up ~50% of the data
> - “Gini” to minimize misclassification

from [Theoretical Comparison between the Gini Index and Information Gain Criteria, by Laura E. Raileanu and Kilian Stoffel](http://citeseerx.ist.psu.edu/viewdoc/download?doi=10.1.1.57.9764&rep=rep1&type=pdf):

> [...] we were able to analyze the frequency of agreement/disagremment of the Gini Index function and the Information Gain function. We found that they disagree only in 2%, which explains why most previously published empirical results concluded that it is not possible to decide which one of the two tests to prefer. 

<div class="ryctoic-questions" markdown="1">
- q: gini vs entropy criterias for decision trees
</div>

## entropy

impurity of split

![impurity illustration](images/20160821-1436-498cTU.screenshot.png)


## missing values
