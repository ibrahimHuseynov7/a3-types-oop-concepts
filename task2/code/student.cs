using System;


// We have our Base class Person

class Person{
    public string Name; // It is name stored string 
    
    public Person(string name){
        Name = name;
    }
    
    // Our normal method without using virtual
    
    public void ShowRole(){
        Console.WriteLine(Name + " is a member of ADA University");
    }
    
    // virtual lets derived classes override this method (dynamic binding)
    public virtual void Introduce(){
        Console.WriteLine("Hello, I am " + Name + " from ADA University");
    }
}
    
    
    // We have derived class Student
    
    class Student : Person{
        public Student(string name) : base(name){
            
        }
        // the new that we have below hides the base method which is static binding
        public new void ShowRole(){
            Console.WriteLine(Name + " is a student ADA University");
            
        }
        
        // override replaces the base method which is dynamic binding
        public override void Introduce(){
            Console.WriteLine("Hello, I am " + Name + ", a Computer Science student at ADA University");
        }
    }
    
    // We have another derived class Professor
    
    class Professor : Person{
        public Professor(string name) : base(name){
            
        }
        // override replaces the base method which is dynamic binding
        public override void Introduce(){
            Console.WriteLine("Hello, I am Professor " + Name + ", I teach at ADA University");
        }
    }
    
    class Program
{
    static void Main(){
        Console.WriteLine("Static binding...");
        // I have created new student 
        Student student = new Student("Ibo");
        
        Person person = student; // We have same object but reference to person
        
        student.ShowRole();
        person.ShowRole();
        
        Console.WriteLine();
        Console.WriteLine("Dynamic binding...");
        // All references are Person, but objects are different
        Person p1 = new Person("Guest");
        Person p2 = new Student("Ibo");
        Person p3 = new Professor("Rahimov");
        
        p1.Introduce(); // Person version
        p2.Introduce(); // Student version 
        p3.Introduce(); // Professor version
    }
}