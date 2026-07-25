# 📘 Day 03 - Functions, Modules & Exception Handling

## 🎯 Learning Objectives

By the end of this lesson, you will be able to:

- Create reusable functions
- Pass data using different types of arguments
- Use built-in Python modules
- Handle runtime errors using exception handling
- Build modular and robust Python programs

---

# 1️⃣ Functions

A **function** is a reusable block of code that performs a specific task.

## Syntax

```python
def function_name(parameters):
    # Code
    return value
```

### Example

```python
def greet(name):
    print(f"Hello {name}")

greet("Gaurav")
```

### Advantages

- Code Reusability
- Easy Maintenance
- Better Readability
- Reduces Duplicate Code

---

# 2️⃣ Function Arguments

Python supports different types of arguments.

## A. Positional Arguments

Arguments are passed in the same order as parameters.

```python
def add(a, b):
    return a + b

add(10, 20)
```

---

## B. Default Arguments

A default value is used if no argument is provided.

```python
def country(name="India"):
    print(name)

country()
country("Japan")
```

---

## C. Keyword Arguments

Arguments are passed using parameter names.

```python
student(name="Gaurav", age=22)
```

---

## D. Variable-Length Arguments (*args)

Allows multiple positional values.

```python
def total(*numbers):
    return sum(numbers)
```

---

## E. Keyword Variable-Length Arguments (**kwargs)

Allows multiple keyword arguments.

```python
def details(**info):
    print(info)
```

---

# 3️⃣ Return Statement

The `return` keyword sends a value back to the caller.

```python
def square(x):
    return x * x
```

---

# 4️⃣ Lambda Function

A lambda function is a small anonymous function.

## Syntax

```python
lambda arguments: expression
```

### Example

```python
square = lambda x: x ** 2
print(square(5))
```

---

# 5️⃣ Recursion

A recursive function calls itself until a stopping condition is met.

### Example

```python
def factorial(n):
    if n == 1:
        return 1
    return n * factorial(n - 1)
```

---

# 6️⃣ Python Modules

A **module** is a file containing reusable Python code.

### Common Built-in Modules

### math

```python
import math

math.sqrt(25)
math.pi
```

### random

```python
import random

random.randint(1, 100)
```

### datetime

```python
from datetime import datetime

datetime.now()
```

---

# 7️⃣ Exception Handling

Exception handling prevents the program from crashing when errors occur.

## Syntax

```python
try:
    # Code
except:
    # Handle Error
```

---

## Common Exceptions

### ValueError

Occurs when the input type is incorrect.

```python
int("abc")
```

---

### ZeroDivisionError

Occurs when dividing by zero.

```python
10 / 0
```

---

## else Block

Runs only if no exception occurs.

```python
try:
    print(10 / 2)
except:
    print("Error")
else:
    print("Success")
```

---

## finally Block

Always executes whether an error occurs or not.

```python
finally:
    print("Program Finished")
```

---

# 8️⃣ raise Keyword

Used to create custom exceptions.

```python
age = 15

if age < 18:
    raise ValueError("Age must be at least 18.")
```

---

# 🧮 Mini Project

**Calculator Application**

Concepts Used:

- Functions
- User Input
- Conditional Statements
- Exception Handling

---

# 💼 Interview Tips

✔ Explain the purpose of functions.

✔ Know the difference between parameters and arguments.

✔ Understand recursion with a factorial example.

✔ Be able to explain `*args` and `**kwargs`.

✔ Explain `try`, `except`, `else`, and `finally`.

✔ Know when to use `raise`.

---

# 📌 Quick Revision

| Topic | Key Point |
|--------|-----------|
| Function | Reusable block of code |
| Return | Sends a value back |
| Default Argument | Uses a default value if none is passed |
| Keyword Argument | Uses parameter names |
| *args | Multiple positional arguments |
| **kwargs | Multiple keyword arguments |
| Lambda | Anonymous function |
| Recursion | Function calls itself |
| Module | Reusable Python file |
| Exception | Runtime error |
| try | Contains risky code |
| except | Handles the error |
| else | Executes if no error occurs |
| finally | Always executes |
| raise | Creates a custom exception |

---

# 🎯 Day 03 Summary

After completing Day 03, you can:

- ✅ Write reusable functions
- ✅ Work with different argument types
- ✅ Use built-in Python modules
- ✅ Handle runtime errors effectively
- ✅ Build small real-world Python applications

**Great job! You're one step closer to becoming an AI/ML Engineer. 🚀**