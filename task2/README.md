# Static and Dynamic Binding in C#

## Purpose

This program shows the difference between **static** and **dynamic binding** in C#.

## Classes

**Person** is the base class. It has a normal method `ShowRole()` and a `virtual` method `Introduce()`.
**Student** inherits from Person. It hides `ShowRole()` with `new` and replaces `Introduce()` with `override`.
**Professor** inherits from Person. It replaces `Introduce()` with `override`.

## How to Run


```
dotnet run student.cs
```

**Inside a console project** (`dotnet new console`): put `student.cs` in the project folder, delete the default `Program.cs`, then run:

```
dotnet run
```


## Output

```

Ibo is a student at ADA University.
Ibo is a member of ADA University.


Hello, I am Guest from ADA University.
Hello, I am Ibo, a Computer Science student at ADA University.
Hello, I am Professor Rahimov, I teach at ADA University.
```

## Explanation

**Static binding (`new`):** the method to call is chosen at **compile time**, based on the **reference type**. The same Student object prints the Student message through a `Student` reference, but the Person message through a `Person` reference.

**Dynamic binding (`virtual` + `override`):** the method to call is chosen at **runtime**, based on the **real object type**. All three objects are stored in `Person` references, but each one calls its own class's `Introduce()` method.