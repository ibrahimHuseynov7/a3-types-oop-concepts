# Ruby OOP

## Purpose

This program is a small library catalog that manages books, DVDs and CDs. It demonstrates the main OOP principles in Ruby: class design, inheritance, encapsulation and polymorphism.

## Classes

**LibraryItem** is the base class. It holds the common properties (title, author, year) and a shared `display_info` method.

**Book** inherits from LibraryItem and adds a `genre`.

**DVD** inherits from LibraryItem and adds a `director` and a `genre`.

**CD** inherits from LibraryItem and adds an `artist` and a `genre`.

**Library** stores a collection of items. It can add items (`add_item`), remove items 
by title (`remove_item`) and display every item (`display_all_items`).

## OOP Principles

**Inheritance:** Book, DVD and CD inherit from LibraryItem using `<`, and call the parent's `initialize` with `super`.

**Encapsulation:** data is kept in instance variables such as `@title` and `@items`. Properties can be read with `attr_reader` but not changed from outside, and the item list can only be changed through Library's methods.

**Polymorphism:** `display_item(item)` calls `item.display_info` without checking the item's type. Each class prints its details in its own format.

## How to Run

```
ruby library.rb
```

## Output

The program first prints each item on its own. It then adds all three items to the library and displays the whole collection. Finally, it removes one item by title and displays the library again, showing the updated item count.