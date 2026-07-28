# 🚀 Day 4 Cheat Sheet - Python Data Structures

---

# 📌 List

### Create

```python
fruits = ["Apple", "Banana", "Mango"]
```

### Access

```python
fruits[0]
fruits[-1]
```

### Methods

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
extend()
```

### Example

```python
fruits.append("Orange")
fruits.insert(1, "Grapes")
fruits.remove("Banana")
fruits.pop()
```

---

# 📌 Tuple

### Create

```python
numbers = (10, 20, 30)
```

### Access

```python
numbers[0]
numbers[-1]
```

### Methods

```python
count()
index()
```

---

# 📌 Set

### Create

```python
A = {1, 2, 3}
```

### Methods

```python
add()
remove()
discard()
clear()
copy()
union()
intersection()
difference()
issubset()
issuperset()
```

### Example

```python
A = {1,2,3}
B = {3,4,5}

A.union(B)
A.intersection(B)
A.difference(B)
```

---

# 📌 Dictionary

### Create

```python
student = {
    "Name": "Gaurav",
    "Age": 22
}
```

### Access

```python
student["Name"]
student.get("Age")
```

### Methods

```python
keys()
values()
items()
update()
pop()
popitem()
clear()
copy()
get()
```

### Example

```python
student["City"] = "Pune"

student.update({"Marks": 90})
```

---

# 📌 Nested Dictionary

```python
students = [
    {
        "Name": "Rahul",
        "Marks": 89
    },
    {
        "Name": "Amit",
        "Marks": 91
    }
]
```

Access

```python
students[0]["Name"]

students[1]["Marks"]
```

---

# 🎯 List vs Tuple

| Feature | List | Tuple |
|----------|------|-------|
| Mutable | ✅ | ❌ |
| Ordered | ✅ | ✅ |
| Duplicate | ✅ | ✅ |
| Faster | ❌ | ✅ |

---

# 🎯 Set vs Dictionary

| Feature | Set | Dictionary |
|----------|-----|------------|
| Unique Values | ✅ | Keys Only |
| Ordered | ❌ | ✅ |
| Key-Value Pair | ❌ | ✅ |
| Mutable | ✅ | ✅ |

---

# 🔥 Most Used Functions

## List

```python
append()
insert()
remove()
pop()
sort()
len()
```

## Tuple

```python
count()
index()
```

## Set

```python
add()
remove()
union()
intersection()
difference()
```

## Dictionary

```python
keys()
values()
items()
update()
get()
pop()
```

---

# 🤖 AI/ML Applications

### List

- Dataset
- Features
- Labels

### Tuple

- Coordinates
- Fixed Configuration

### Set

- Remove Duplicate Values
- Unique Categories

### Dictionary

- JSON Data
- API Responses
- Model Parameters
- Configuration Files

---

# 💡 Interview Tips

✅ List is mutable.

✅ Tuple is immutable.

✅ Set removes duplicate values.

✅ Dictionary stores key-value pairs.

✅ Dictionaries are widely used in Data Science and Machine Learning.

---

# 📝 Quick Revision

- List → Ordered, Mutable
- Tuple → Ordered, Immutable
- Set → Unordered, Unique
- Dictionary → Key-Value Pairs

---

🎉 **End of Day 4 Cheat Sheet**