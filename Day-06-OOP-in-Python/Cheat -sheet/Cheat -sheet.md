🚀 Python OOP Cheat Sheet (Day 6)

1. What is OOP?

Object-Oriented Programming (OOP) is a programming paradigm that organizes code into objects and classes. It helps make code reusable, modular, and easier to maintain.

---

2. Class

A class is a blueprint for creating objects.

class Student:
    pass

---

3. Object

An object is an instance of a class.

s1 = Student()

---

4. Constructor ("__init__")

A constructor is automatically called when an object is created.

class Student:
    def __init__(self, name):
        self.name = name

---

5. "self" Keyword

- Refers to the current object.
- Used to access instance variables and methods.

self.name = name

---

6. Instance Variable

class Student:
    def __init__(self, name):
        self.name = name

---

7. Instance Method

class Student:
    def display(self):
        print(self.name)

---

8. Class Variable

class Student:
    school = "ABC School"

Shared by all objects.

---

9. Encapsulation

Wrapping data and methods into a single unit.

class Bank:
    def __init__(self):
        self.__balance = 1000

Private variable:

__balance

---

10. Inheritance

class Animal:
    pass

class Dog(Animal):
    pass

Types

- Single
- Multiple
- Multilevel
- Hierarchical
- Hybrid

---

11. Polymorphism

Method overriding example:

class Animal:
    def sound(self):
        print("Animal Sound")

class Dog(Animal):
    def sound(self):
        print("Bark")

---

12. Abstraction

from abc import ABC, abstractmethod

class Shape(ABC):

    @abstractmethod
    def area(self):
        pass

---

13. "super()" Function

class Parent:
    def __init__(self):
        print("Parent")

class Child(Parent):
    def __init__(self):
        super().__init__()

---

14. Static Method

class Demo:

    @staticmethod
    def hello():
        print("Hello")

---

15. Class Method

class Demo:

    @classmethod
    def info(cls):
        print(cls)

---

16. Magic Method

__init__()
__str__()
__len__()
__repr__()

---

17. Access Specifiers

Type| Symbol
Public| variable
Protected| _variable
Private| __variable

---

18. Four Pillars of OOP

- Encapsulation
- Inheritance
- Polymorphism
- Abstraction

---

19. Advantages of OOP

- Code Reusability
- Easy Maintenance
- Modular Design
- Scalability
- Security
- Better Code Organization

---

20. OOP Interview Tips

✔ Know all four pillars.

✔ Understand "self" and "__init__".

✔ Practice inheritance examples.

✔ Know the difference between class variables and instance variables.

✔ Understand "super()".

✔ Learn abstract classes and polymorphism.

---

One-Line Revision

- Class → Blueprint
- Object → Instance of class
- "self" → Current object
- "__init__" → Constructor
- Encapsulation → Data hiding
- Inheritance → Code reuse
- Polymorphism → One interface, many forms
- Abstraction → Hide implementation
- "super()" → Access parent class
- Static Method → No object required
- Class Method → Works with class
