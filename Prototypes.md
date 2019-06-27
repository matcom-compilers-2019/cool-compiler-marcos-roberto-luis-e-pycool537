# Objects Prototype

|   offset 0    |     Class tag(a number)     |
| :-----------: | :-------------------------: |
| **offset 4**  |    Object size(a number)    |
| **offset 8**  | Dispatch pointer(A POINTER) |
| **offset 12** |   Attributes(references)    |

# Int Prototype

|   offset 0    |       Class tag       |
| :-----------: | :-------------------: |
| **offset 4**  |      Object Size      |
| **offset 8**  |   Dispatch pointer    |
| **offset 12** | Value(Pointer to Int) |

# Bool prototype

|   offset 0    |         Class tag          |
| :-----------: | :------------------------: |
| **offset 4**  |        Object Size         |
| **offset 8**  |      Dispatch pointer      |
| **offset 12** | Bool value(Pointer to Int) |

# String prototype

|   offset 0    |              Class tag               |
| :-----------: | :----------------------------------: |
| **offset 4**  |             Object Size              |
| **offset 8**  |           Dispatch pointer           |
| **offset 12** |     String size (Pointer to Int)     |
| **offset 16** | ASCII Sequence(Pointer to character) |

# Example of object prototype

```
class Grandparent{
    first: Object;
};
class Parent inherits Grandparent{
    seconf: Object;
};
class Child inherits Parent{
    third: Object;
    fourth: Object;
};
```

**Child prototype**

| offset 0  |     Class tag      |
| :-------: | :----------------: |
| offset 4  |    Object size     |
| offset 8  |  Dispatch pointer  |
| offset 12 | Attribute `first`  |
| offset 16 | Attribute `second` |
| offset 20 | Attribute `third`  |
| offset 24 | Attribute `fourth` |

