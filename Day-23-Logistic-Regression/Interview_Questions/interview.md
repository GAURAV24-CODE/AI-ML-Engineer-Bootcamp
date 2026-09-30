============================================================
DAY 23 — LOGISTIC REGRESSION
INTERVIEW QUESTIONS
============================================================

Q1. What is Logistic Regression?
Answer: Logistic Regression is a supervised ML algorithm mainly used for classification problems.

Q2. Why is Logistic Regression used for classification?
Answer: It predicts a probability between 0 and 1, which can be converted into a class using a threshold.

Q3. What is the Sigmoid function?
Answer: The Sigmoid function converts a model score into a value between 0 and 1.

Q4. What is the formula of the Sigmoid function?
Answer: Sigmoid(z) = 1 / (1 + e^(-z)).

Q5. What is a classification threshold?
Answer: A threshold converts probability into a class; commonly >= 0.5 means Class 1 and < 0.5 means Class 0.

Q6. What is Binary Classification?
Answer: Binary Classification predicts one of two classes, such as Pass/Fail or Spam/Not Spam.

Q7. What is Multiclass Classification?
Answer: Multiclass Classification predicts one class from more than two possible classes.

Q8. What does predict() do?
Answer: predict() returns the predicted class label, such as 0 or 1.

Q9. What does predict_proba() do?
Answer: predict_proba() returns the probability of each class.

Q10. What is a Confusion Matrix?
Answer: It summarizes classification results using TP, TN, FP, and FN.

Q11. What is True Positive (TP)?
Answer: The model predicts positive and the actual class is also positive.

Q12. What is True Negative (TN)?
Answer: The model predicts negative and the actual class is also negative.

Q13. What is False Positive (FP)?
Answer: The model predicts positive when the actual class is negative.

Q14. What is False Negative (FN)?
Answer: The model predicts negative when the actual class is positive.

Q15. What is Accuracy?
Answer: Accuracy is the proportion of all predictions that are correct.

Q16. What is Precision?
Answer: Precision tells us how many predicted positive samples were actually positive.

Q17. What is Recall?
Answer: Recall tells us how many actual positive samples were correctly identified.

Q18. What is F1 Score?
Answer: F1 Score is the harmonic mean of Precision and Recall.

Q19. What is the difference between Precision and Recall?
Answer: Precision focuses on predicted positives, while Recall focuses on actual positives.

Q20. What is the difference between Linear and Logistic Regression?
Answer: Linear Regression predicts continuous values, while Logistic Regression predicts probabilities/classes.

Q21. What is train_test_split()?
Answer: It divides data into training and testing sets for model training and evaluation.

Q22. What does model.fit() do?
Answer: fit() trains the Logistic Regression model using the provided training data.

Q23. Can Logistic Regression handle multiclass problems?
Answer: Yes, Logistic Regression can handle multiclass classification using strategies such as OvR or multinomial approaches.

Q24. What is regularization in Logistic Regression?
Answer: Regularization helps reduce overfitting by penalizing large model coefficients.

Q25. What is C in LogisticRegression()?
Answer: C controls the inverse strength of regularization; smaller C means stronger regularization.

Q26. When should Logistic Regression be used?
Answer: It is useful when the target is categorical and a relatively simple decision boundary is appropriate.

Q27. What is overfitting?
Answer: Overfitting occurs when a model learns the training data too closely and performs poorly on unseen data.

Q28. Why is scaling sometimes used with Logistic Regression?
Answer: Scaling puts features on comparable ranges and can improve optimization, especially when features have very different scales.

Q29. What is the main advantage of Logistic Regression?
Answer: It is simple, fast, interpretable, and provides class probabilities.

Q30. What is the main limitation of Logistic Regression?
Answer: It may perform poorly when the relationship between features and classes is highly nonlinear.

============================================================
END OF INTERVIEW QUESTIONS
============================================================