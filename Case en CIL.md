case expr of:

​	a: A => expr_1

​	b: B => expr_2

```
<expr_0.locals>
<expr_0.code>
x <- <expr_0.value>
tx <- TypeOf(x)
y <- TypeOf(Object)
destination_expr <- 0

---

Action_1: # este label no hace falta
action_1_variable <- init_A()
t_action_1 <- TypeOf(A)
temp <- tx

Next:
If tx = t_action_1 Goto expr_1

If temp = 1 Goto action_2:
If temp = y Goto action_2:
temp <- ChildOf(temp)
If not (temp=ta) Goto Next:

OtherInherits:
temp <- ChildOf(temp)
If 1 = temp Goto action_2
If not (y = temp) Goto OtherInherits:
y <- ta
destination_expr <- expr_1

---

expr_1:
action_1_variable <- x
<expr_1.locals>
<expr_1.code>
case_result = <expr_1.value>
Goto Finish

---
```