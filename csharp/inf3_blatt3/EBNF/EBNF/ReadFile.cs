using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;

namespace EBNF_Parser
{
    public class ReadFile
    {
        static void Main(string[] args)
        {
            string line;
            List<string> list = new List<string>();

          
            //load the expressions.txt  
            //set amount of running thread in threadpool
            //go through every line with different thread
            System.IO.StreamReader file = new System.IO.StreamReader("expressions.txt");
            while ((line = file.ReadLine()) != null)
            {
                list.Add(line);
            }

            const int parsCount = 8;
            
            ManualResetEvent[] doneEvents = new ManualResetEvent[parsCount];
            EbnfParser[] parArray = new EbnfParser[parsCount];
   
            Console.WriteLine("launching {0} tasks...",parsCount);
            int counter = 0;
            for (int i = 0; i < list.Count; i++)
            {
                if(counter>=parsCount)
                {
                    counter = 0;
                }
                doneEvents[counter] = new ManualResetEvent(false);
                EbnfParser par = new EbnfParser(list[i], doneEvents[counter]);
                parArray[counter] = par;
                ThreadPool.QueueUserWorkItem(par.ThreadPoolCallback, counter);
                counter++;
            }

            WaitHandle.WaitAll(doneEvents);
            Console.WriteLine("All Events are complete.");

            Console.Read();
            file.Close();
            System.Console.ReadLine();
        }
    }
}


