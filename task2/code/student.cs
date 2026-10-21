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
    
    
    // We have derived class Student
    
    class Student : Person{
        public Student(string name) : base(name){
            
        }
        // the new that we have below hides the base method which is static binding
        public new void ShowRole(){
            Console.WriteLine(Name + " is a student ADA University");
            
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
    }
}
}