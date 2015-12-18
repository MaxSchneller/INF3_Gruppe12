using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EBNF
{
    public class ReadFile
    {
        static void Main(string[] args)
        {
            //int counter = 0;
            string line;
            List<string> list = new List<string>();

            System.IO.StreamReader file = new System.IO.StreamReader(@"C:\Users\Max\Documents\Projects\EBNF-Parser\expressions.txt");
            while((line = file.ReadLine()) != null)
            {
                list.Add(line);
                //counter++;
            }

            bool result = ebnfParser.convert(list);
            Console.WriteLine(result);

            Console.Read();
            file.Close();
            System.Console.ReadLine();
        }
    }
}
