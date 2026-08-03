# Mini Project

import numpy as np

marks = np.array([85, 78, 92, 88, 76])

print("Student Marks:", marks)

print("Total Marks:", np.sum(marks))
print("Average Marks:", np.mean(marks))
print("Highest Marks:", np.max(marks))
print("Lowest Marks:", np.min(marks))
print("Standard Deviation:", np.std(marks))

percentage = np.mean(marks)

print("Percentage:", percentage, "%")

if percentage >= 40:
    print("Result: Pass")
else:
    print("Result: Fail")
    