using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using GestDep.Entities;

namespace PopulateDB
{
    class Program
    {
        static void Main(string[] args)
        {
            try { 
                bool CLEAR_DATABASE = true;
                int ROOMS_NUMBER = 9;
                int INSTRUCTORS_NUMBER = 5;
                Populate populateDB = new Populate(CLEAR_DATABASE);  
                CityHall cityHall = populateDB.InsertCityHall();
                Gym gym = populateDB.InsertGym(cityHall);
                ICollection<Room> rooms = populateDB.InsertRooms(ROOMS_NUMBER, gym);
                ICollection<Instructor> instructors = populateDB.InsertInstructors(INSTRUCTORS_NUMBER, cityHall);

                Console.WriteLine("CityHall added:" + cityHall.Name);
                Console.WriteLine("Gym added:" +gym.Name);
                Console.WriteLine("Rooms Added:" );
                foreach(Room room in rooms)
                    Console.WriteLine("Number:"+room.Number);
                Console.WriteLine("Instructors Added:");
                foreach (Instructor instructor in instructors)
                    Console.WriteLine("Name:" + instructor.Name +"\t DNI: "+ instructor.Id);
                Console.WriteLine("Press any key.");
                Console.ReadLine();


            }
            catch(Exception e)
            {
                Console.WriteLine("ERROR: " + e.Message);
                Console.WriteLine("Press any key.");
                Console.ReadLine();
            }


}
    }
}
