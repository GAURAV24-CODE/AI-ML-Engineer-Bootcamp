from sklearn.linear_model import LinearRegression

# Input feature
X = [[1], [2], [3], [4], [5]]

# Target
y = [35, 45, 50, 60, 70]

# Create model
model = LinearRegression()

# Train model
model.fit(X, y)

# Learned parameters
print("Slope:", model.coef_[0])
print("Intercept:", model.intercept_)

# Multiple new inputs
new_hours = [[6], [7], [8], [9], [10]]

# Make multiple predictions
predictions = model.predict(new_hours)

# Display predictions
for hours, marks in zip(new_hours, predictions):
    print(f"{hours[0]} hours → Predicted marks: {marks:.2f}")