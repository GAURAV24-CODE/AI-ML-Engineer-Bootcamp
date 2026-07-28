# Day 4 – Data Structures in Python

## 🎯 Learning Objectives

By the end of this lesson, you will be able to:

- Understand Python Data Structures
- Work with Lists
- Work with Tuples
- Work with Sets
- Work with Dictionaries
- Perform common operations
- Use nested data structures
- Choose the right data structure for different AI/ML tasks

---

# What are Data Structures?

A Data Structure is a way of organizing and storing data so that it can be used efficiently.

Python provides four built-in data structures:

1. List
2. Tuple
3. Set
4. Dictionary

---

# 1. List

A List is an ordered, mutable collection that allows duplicate values.

### Example

```python
fruits = ["Apple", "Banana", "Mango"]
```

### Characteristics

- Ordered
- Mutable
- Allows duplicates
- Indexed

### Accessing Elements

```python
print(fruits[0])
print(fruits[-1])
```

### Common Methods

```python
append()
insert()
remove()
pop()
sort()
reverse()
clear()
copy()
count()
index()
```

Example

```python
fruits.append("Orange")
fruits.remove("Banana")
```

---

# 2. Tuple

A Tuple is an ordered but immutable collection.

Example

```python
numbers = (10,20,30,40)
```

Characteristics

- Ordered
- Immutable
- Allows duplicates
- Faster than lists

Access

```python
print(numbers[1])
```

Methods

```python
count()
index()
```

---

# 3. Set

A Set is an unordered collection of unique elements.

Example

```python
colors = {"Red","Blue","Green","Red"}
```

Output

```
{'Red', 'Blue', 'Green'}
```

Duplicates are removed automatically.

### Common Methods

```python
add()
remove()
discard()
union()
intersection()
difference()
```

Example

```python
A={1,2,3}
B={3,4,5}

print(A.union(B))
print(A.intersection(B))
```

---

# 4. Dictionary

Dictionary stores data in Key : Value pairs.

Example

```python
student = {
    "Name":"Gaurav",
    "Age":22,
    "Course":"MCA"
}
```

Access

```python
print(student["Name"])
```

Methods

```python
keys()
values()
items()
update()
pop()
get()
```

Example

```python
student["City"]="Pune"
```

---

# Nested Data Structures

Example

```python
students = [
    {
        "Name":"Rahul",
        "Marks":89
    },
    {
        "Name":"Amit",
        "Marks":91
    }
]
```

Access

```python
print(students[0]["Name"])
```

---

# Comparison

| Feature | List | Tuple | Set | Dictionary |
|----------|------|-------|-----|------------|
| Ordered | ✅ | ✅ | ❌ | ✅ |
| Mutable | ✅ | ❌ | ✅ | ✅ |
| Duplicate Values | ✅ | ✅ | ❌ | Keys ❌ |
| Indexed | ✅ | ✅ | ❌ | Keys |

---

# AI/ML Usage

Lists
- Store datasets
- Store features

Tuples
- Fixed configurations
- Coordinates

Sets
- Remove duplicates
- Unique labels

Dictionary
- JSON data
- API responses
- Model parameters

---

# Best Practices

✅ Use List when data changes.

✅ Use Tuple for fixed values.

✅ Use Set for unique elements.

✅ Use Dictionary for key-value data.

---

# Summary

Today you learned:

- Lists
- Tuples
- Sets
- Dictionaries
- Nested Structures
- Common Methods
- AI/ML Applications

These are the foundation of data manipulation in Python and are used extensively in Data Science, Machine Learning, and Artificial Intelligence.